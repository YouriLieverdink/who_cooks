import 'dart:async';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:queue/queue.dart';

class Queue {
  ///
  Queue(
    String host,
  ) : _client = Client(
          settings: ConnectionSettings(
            host: host,
            maxConnectionAttempts: 3,
            reconnectWaitTime: const Duration(seconds: 4),
          ),
        );

  /// The [Client] used to the Rabbit messaging queue.
  final Client _client;

  /// Opens a connection to the queue when it does not exists already.
  ///
  /// Throws an [Exception] when the connection fails.
  Future<void> open() async {
    try {
      await _client.connect();
    } //
    on ConnectionFailedException {
      final uri = '${_client.settings.host}:${_client.settings.port}';

      throw Exception(
        'No connection could be established to the instance on $uri. Please '
        'make sure that the uri is correct and that the service is runining.',
      );
    }
  }

  /// Closes all connections to the queue.
  Future<void> close() async {
    await _client.close();
  }

  ///
  Future<void> on<T>(void Function(T event) listener) async {
    // We need a factory constructor to create [T] from a JSON map.
    if (!hasFromJson<T>()) {
      throw Exception(
        'The provided type does not provide a $T.fromJson(dynamic value) '
        'constructor. This constructor is required to be able to parse '
        'incoming messages. Please define it.',
      );
    }

    final channel = await _client.channel();
    final exchange = await channel.exchange('$T', ExchangeType.TOPIC);

    final consumer = await exchange.bindPrivateQueueConsumer(['$T']);

    consumer.listen((message) {
      final data = fromJson<T>(message.payloadAsJson);
      if (data != null) listener(data);
    });
  }

  ///
  Future<void> add<T>(T event) async {
    // We need a method to create a JSON map from [T].
    if (!hasToJson<T>()) {
      throw Exception(
        'The provided type $T does not have a toJson() method. This method is '
        'required to be able to encode the messages. Please define it.',
      );
    }

    final channel = await _client.channel();
    final exchange = await channel.exchange('$T', ExchangeType.TOPIC);

    final data = toJson<T>(event);
    if (data != null) exchange.publish(data, '$T');
  }
}
