import 'dart:async';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:events/events.dart';

class Events {
  ///
  Events({
    Client? client,
  })  : _client = client ?? Client(),
        _subscriptions = [];

  final Client _client;

  final List<StreamSubscription> _subscriptions;

  ///
  Future<void> on<T>(void Function(T event) listener) async {
    // We need a factory constructor to create [T] from a JSON map.
    if (!hasFromJson<T>()) {
      throw Exception(
        'The provided type [T] does not provide a $T.fromJson(dynamic value) '
        'constructor. This constructor is required to be able to parse '
        'incoming messages. Please define it.',
      );
    }

    final channel = await _client.channel();
    final exchange = await channel.exchange('$T', ExchangeType.TOPIC);

    final consumer = await exchange.bindPrivateQueueConsumer(['$T']);

    final subscription = consumer.listen((message) {
      //
      final data = fromJson<T>(message.payloadAsJson);
      if (data != null) listener(data);
    });

    _subscriptions.add(subscription);
  }

  ///
  Future<void> add<T>(T event) async {
    // We need a method to create a JSON map from [T].
    if (!hasToJson<T>()) {
      throw Exception(
        'The provided type [T] does not have a toJson() method. This method is '
        'required to be able to encode the messages. Please define it.',
      );
    }

    final channel = await _client.channel();
    final exchange = await channel.exchange('$T', ExchangeType.TOPIC);

    final data = toJson<T>(event);
    if (data != null) exchange.publish(data, '$T');
  }

  ///
  Future<void> close() async {
    // Ensures all subscriptions and the client are closed.
    final futures = <Future>[];

    futures.add(_client.close());

    _subscriptions //
        .map((s) => s.cancel())
        .forEach(futures.add);

    await Future.wait(futures);
  }
}
