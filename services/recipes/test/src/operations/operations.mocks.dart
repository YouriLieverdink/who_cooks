// Mocks generated by Mockito 5.2.0 from annotations
// in recipes/test/src/operations/operations.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mongo_dart/mongo_dart.dart' as _i2;
import 'package:mongo_dart/src/database/commands/operation.dart' as _i3;
import 'package:mongo_dart/src/database/message/mongo_modern_message.dart'
    as _i6;
import 'package:queue/queue.dart' as _i7;
import 'package:recipes/recipes.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeState_0 extends _i1.Fake implements _i2.State {}

class _FakeReadPreference_1 extends _i1.Fake implements _i3.ReadPreference {}

class _FakeConnection_2 extends _i1.Fake implements _i2.Connection {}

class _FakeDbCollection_3 extends _i1.Fake implements _i2.DbCollection {}

class _FakeMongoReplyMessage_4 extends _i1.Fake
    implements _i2.MongoReplyMessage {}

class _FakeDb_5 extends _i1.Fake implements _i4.Db {}

class _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_6 extends _i1.Fake
    implements _i4.NlIruoyWhocooksRecipesV0ModelsRecipe {}

/// A class which mocks [Db].
///
/// See the documentation for Mockito's code generation for more information.
class MockDb extends _i1.Mock implements _i4.Db {
  MockDb() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.State get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeState_0()) as _i2.State);
  @override
  set state(_i2.State? _state) =>
      super.noSuchMethod(Invocation.setter(#state, _state),
          returnValueForMissingStub: null);
  @override
  set databaseName(String? _databaseName) =>
      super.noSuchMethod(Invocation.setter(#databaseName, _databaseName),
          returnValueForMissingStub: null);
  @override
  set authSourceDb(_i4.Db? _authSourceDb) =>
      super.noSuchMethod(Invocation.setter(#authSourceDb, _authSourceDb),
          returnValueForMissingStub: null);
  @override
  _i3.ReadPreference get readPreference =>
      (super.noSuchMethod(Invocation.getter(#readPreference),
          returnValue: _FakeReadPreference_1()) as _i3.ReadPreference);
  @override
  set readPreference(_i3.ReadPreference? _readPreference) =>
      super.noSuchMethod(Invocation.setter(#readPreference, _readPreference),
          returnValueForMissingStub: null);
  @override
  _i2.Connection get masterConnection =>
      (super.noSuchMethod(Invocation.getter(#masterConnection),
          returnValue: _FakeConnection_2()) as _i2.Connection);
  @override
  _i2.Connection get masterConnectionAnyState =>
      (super.noSuchMethod(Invocation.getter(#masterConnectionAnyState),
          returnValue: _FakeConnection_2()) as _i2.Connection);
  @override
  List<String> get uriList =>
      (super.noSuchMethod(Invocation.getter(#uriList), returnValue: <String>[])
          as List<String>);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  void selectAuthenticationMechanism(String? authenticationSchemeName) =>
      super.noSuchMethod(
          Invocation.method(
              #selectAuthenticationMechanism, [authenticationSchemeName]),
          returnValueForMissingStub: null);
  @override
  _i2.DbCollection collection(String? collectionName) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionName]),
          returnValue: _FakeDbCollection_3()) as _i2.DbCollection);
  @override
  _i5.Future<_i2.MongoReplyMessage> queryMessage(_i2.MongoMessage? queryMessage,
          {_i2.Connection? connection}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #queryMessage, [queryMessage], {#connection: connection}),
              returnValue: Future<_i2.MongoReplyMessage>.value(
                  _FakeMongoReplyMessage_4()))
          as _i5.Future<_i2.MongoReplyMessage>);
  @override
  void executeMessage(_i2.MongoMessage? message, _i2.WriteConcern? writeConcern,
          {_i2.Connection? connection}) =>
      super.noSuchMethod(
          Invocation.method(#executeMessage, [message, writeConcern],
              {#connection: connection}),
          returnValueForMissingStub: null);
  @override
  _i5.Future<Map<String, Object?>> executeModernMessage(
          _i6.MongoModernMessage? message,
          {_i2.Connection? connection,
          bool? skipStateCheck = false}) =>
      (super.noSuchMethod(
              Invocation.method(#executeModernMessage, [message],
                  {#connection: connection, #skipStateCheck: skipStateCheck}),
              returnValue:
                  Future<Map<String, Object?>>.value(<String, Object?>{}))
          as _i5.Future<Map<String, Object?>>);
  @override
  _i5.Future<dynamic> open(
          {_i2.WriteConcern? writeConcern = _i2.WriteConcern.ACKNOWLEDGED,
          bool? secure = false,
          bool? tlsAllowInvalidCertificates = false,
          String? tlsCAFile,
          String? tlsCertificateKeyFile,
          String? tlsCertificateKeyFilePassword}) =>
      (super.noSuchMethod(
          Invocation.method(#open, [], {
            #writeConcern: writeConcern,
            #secure: secure,
            #tlsAllowInvalidCertificates: tlsAllowInvalidCertificates,
            #tlsCAFile: tlsCAFile,
            #tlsCertificateKeyFile: tlsCertificateKeyFile,
            #tlsCertificateKeyFilePassword: tlsCertificateKeyFilePassword
          }),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<Map<String, dynamic>> executeDbCommand(_i2.MongoMessage? message,
          {_i2.Connection? connection}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #executeDbCommand, [message], {#connection: connection}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  bool documentIsNotAnError(dynamic firstRepliedDocument) =>
      (super.noSuchMethod(
          Invocation.method(#documentIsNotAnError, [firstRepliedDocument]),
          returnValue: false) as bool);
  @override
  _i5.Future<bool> dropCollection(String? collectionName) =>
      (super.noSuchMethod(Invocation.method(#dropCollection, [collectionName]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<dynamic> drop() =>
      (super.noSuchMethod(Invocation.method(#drop, []),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<Map<String, dynamic>> removeFromCollection(String? collectionName,
          [Map<String, dynamic>? selector = const {},
          _i2.WriteConcern? writeConcern]) =>
      (super.noSuchMethod(
          Invocation.method(
              #removeFromCollection, [collectionName, selector, writeConcern]),
          returnValue:
              Future<Map<String, dynamic>>.value(<String, dynamic>{})) as _i5
          .Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> getLastError(
          [_i2.WriteConcern? writeConcern]) =>
      (super.noSuchMethod(Invocation.method(#getLastError, [writeConcern]),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> getNonce({_i2.Connection? connection}) =>
      (super.noSuchMethod(
              Invocation.method(#getNonce, [], {#connection: connection}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> getBuildInfo({_i2.Connection? connection}) =>
      (super.noSuchMethod(
              Invocation.method(#getBuildInfo, [], {#connection: connection}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> isMaster({_i2.Connection? connection}) =>
      (super.noSuchMethod(
              Invocation.method(#isMaster, [], {#connection: connection}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> wait() => (super.noSuchMethod(
          Invocation.method(#wait, []),
          returnValue: Future<Map<String, dynamic>>.value(<String, dynamic>{}))
      as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<dynamic> close() =>
      (super.noSuchMethod(Invocation.method(#close, []),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<List<dynamic>> listDatabases() =>
      (super.noSuchMethod(Invocation.method(#listDatabases, []),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
          as _i5.Future<List<dynamic>>);
  @override
  _i5.Stream<Map<String, dynamic>> collectionsInfoCursor(
          [String? collectionName]) =>
      (super.noSuchMethod(
              Invocation.method(#collectionsInfoCursor, [collectionName]),
              returnValue: Stream<Map<String, dynamic>>.empty())
          as _i5.Stream<Map<String, dynamic>>);
  @override
  _i5.Future<List<String?>> listCollections() =>
      (super.noSuchMethod(Invocation.method(#listCollections, []),
              returnValue: Future<List<String?>>.value(<String?>[]))
          as _i5.Future<List<String?>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getCollectionInfos(
          [Map<String, dynamic>? filter = const {}]) =>
      (super.noSuchMethod(Invocation.method(#getCollectionInfos, [filter]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<String?>> getCollectionNames(
          [Map<String, dynamic>? filter = const {}]) =>
      (super.noSuchMethod(Invocation.method(#getCollectionNames, [filter]),
              returnValue: Future<List<String?>>.value(<String?>[]))
          as _i5.Future<List<String?>>);
  @override
  _i5.Future<bool> authenticate(String? userName, String? password,
          {_i2.Connection? connection}) =>
      (super.noSuchMethod(
          Invocation.method(
              #authenticate, [userName, password], {#connection: connection}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<List<dynamic>> indexInformation([String? collectionName]) => (super
          .noSuchMethod(Invocation.method(#indexInformation, [collectionName]),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
      as _i5.Future<List<dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> createIndex(String? collectionName,
          {String? key,
          Map<String, dynamic>? keys,
          bool? unique,
          bool? sparse,
          bool? background,
          bool? dropDups,
          Map<String, dynamic>? partialFilterExpression,
          String? name}) =>
      (super.noSuchMethod(
              Invocation.method(#createIndex, [
                collectionName
              ], {
                #key: key,
                #keys: keys,
                #unique: unique,
                #sparse: sparse,
                #background: background,
                #dropDups: dropDups,
                #partialFilterExpression: partialFilterExpression,
                #name: name
              }),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<dynamic> ensureIndex(String? collectionName,
          {String? key,
          Map<String, dynamic>? keys,
          bool? unique,
          bool? sparse,
          bool? background,
          bool? dropDups,
          Map<String, dynamic>? partialFilterExpression,
          String? name}) =>
      (super.noSuchMethod(
          Invocation.method(#ensureIndex, [
            collectionName
          ], {
            #key: key,
            #keys: keys,
            #unique: unique,
            #sparse: sparse,
            #background: background,
            #dropDups: dropDups,
            #partialFilterExpression: partialFilterExpression,
            #name: name
          }),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<Map<String, Object?>> serverStatus(
          {Map<String, Object>? options}) =>
      (super.noSuchMethod(
              Invocation.method(#serverStatus, [], {#options: options}),
              returnValue:
                  Future<Map<String, Object?>>.value(<String, Object?>{}))
          as _i5.Future<Map<String, Object?>>);
  @override
  _i5.Future<Map<String, Object?>> createCollection(String? name,
          {_i3.CreateCollectionOptions? createCollectionOptions,
          Map<String, Object>? rawOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#createCollection, [
                name
              ], {
                #createCollectionOptions: createCollectionOptions,
                #rawOptions: rawOptions
              }),
              returnValue:
                  Future<Map<String, Object?>>.value(<String, Object?>{}))
          as _i5.Future<Map<String, Object?>>);
  @override
  _i5.Future<Map<String, Object?>> createView(
          String? view, String? source, List<dynamic>? pipeline,
          {_i3.CreateViewOptions? createViewOptions,
          Map<String, Object>? rawOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#createView, [
                view,
                source,
                pipeline
              ], {
                #createViewOptions: createViewOptions,
                #rawOptions: rawOptions
              }),
              returnValue:
                  Future<Map<String, Object?>>.value(<String, Object?>{}))
          as _i5.Future<Map<String, Object?>>);
  @override
  _i5.Stream<Map<String, dynamic>> aggregate(
          List<Map<String, Object>>? pipeline,
          {bool? explain,
          Map<String, Object>? cursor,
          String? hint,
          Map<String, Object>? hintDocument,
          _i3.AggregateOptions? aggregateOptions,
          Map<String, Object>? rawOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#aggregate, [
                pipeline
              ], {
                #explain: explain,
                #cursor: cursor,
                #hint: hint,
                #hintDocument: hintDocument,
                #aggregateOptions: aggregateOptions,
                #rawOptions: rawOptions
              }),
              returnValue: Stream<Map<String, dynamic>>.empty())
          as _i5.Stream<Map<String, dynamic>>);
}

/// A class which mocks [Queue].
///
/// See the documentation for Mockito's code generation for more information.
class MockQueue extends _i1.Mock implements _i7.Queue {
  MockQueue() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> open() => (super.noSuchMethod(Invocation.method(#open, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> on<T>(void Function(T)? listener) =>
      (super.noSuchMethod(Invocation.method(#on, [listener]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> add<T>(T? event) =>
      (super.noSuchMethod(Invocation.method(#add, [event]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [RecipeDao].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecipeDao extends _i1.Mock implements _i4.RecipeDao {
  MockRecipeDao() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Db> Function() get connect =>
      (super.noSuchMethod(Invocation.getter(#connect),
              returnValue: () => Future<_i4.Db>.value(_FakeDb_5()))
          as _i5.Future<_i4.Db> Function());
  @override
  _i5.Future<List<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>> get(
          {List<String>? ids, String? title, int? limit, int? skip}) =>
      (super.noSuchMethod(
          Invocation.method(
              #get, [], {#ids: ids, #title: title, #limit: limit, #skip: skip}),
          returnValue:
              Future<List<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>>.value(
                  <_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>[])) as _i5
          .Future<List<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>>);
  @override
  _i5.Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe> insert(
          _i4.NlIruoyWhocooksRecipesV0ModelsRecipeForm? recipeForm) =>
      (super.noSuchMethod(Invocation.method(#insert, [recipeForm]),
          returnValue: Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>.value(
              _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_6())) as _i5
          .Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>);
  @override
  _i5.Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe?> getById({String? id}) =>
      (super.noSuchMethod(Invocation.method(#getById, [], {#id: id}),
              returnValue:
                  Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe?>.value())
          as _i5.Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe?>);
  @override
  _i5.Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe> updateById(
          _i4.NlIruoyWhocooksRecipesV0ModelsRecipeForm? recipeForm,
          {String? id}) =>
      (super.noSuchMethod(
          Invocation.method(#updateById, [recipeForm], {#id: id}),
          returnValue: Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>.value(
              _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_6())) as _i5
          .Future<_i4.NlIruoyWhocooksRecipesV0ModelsRecipe>);
  @override
  _i5.Future<void> deleteById({String? id}) =>
      (super.noSuchMethod(Invocation.method(#deleteById, [], {#id: id}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
