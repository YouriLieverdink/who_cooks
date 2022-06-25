// Mocks generated by Mockito 5.2.0 from annotations
// in app/test/src/state/recipes/recipes_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:app/src/generated/generated.dart' as _i2;
import 'package:app/src/generated/nl_iruoy_whocooks_recipes_v0_client.dart'
    as _i4;
import 'package:app/src/generated/nl_iruoy_whocooks_recipes_v0_json.dart'
    as _i5;
import 'package:app/src/services/repository/repository.dart' as _i6;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeNlIruoyWhocooksRecipesV0Client_0 extends _i1.Fake
    implements _i2.NlIruoyWhocooksRecipesV0Client {}

class _FakeClient_1 extends _i1.Fake implements _i3.Client {}

class _FakeNlIruoyCommonV0ModelsHealthcheckResource_2 extends _i1.Fake
    implements _i4.NlIruoyCommonV0ModelsHealthcheckResource {}

class _FakeNlIruoyWhocooksRecipesV0ModelsRecipeResource_3 extends _i1.Fake
    implements _i2.NlIruoyWhocooksRecipesV0ModelsRecipeResource {}

class _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_4 extends _i1.Fake
    implements _i5.NlIruoyWhocooksRecipesV0ModelsRecipe {}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i6.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NlIruoyWhocooksRecipesV0Client get client =>
      (super.noSuchMethod(Invocation.getter(#client),
              returnValue: _FakeNlIruoyWhocooksRecipesV0Client_0())
          as _i2.NlIruoyWhocooksRecipesV0Client);
}

/// A class which mocks [NlIruoyWhocooksRecipesV0Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockNlIruoyWhocooksRecipesV0Client extends _i1.Mock
    implements _i2.NlIruoyWhocooksRecipesV0Client {
  MockNlIruoyWhocooksRecipesV0Client() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_1()) as _i3.Client);
  @override
  String get baseUrl =>
      (super.noSuchMethod(Invocation.getter(#baseUrl), returnValue: '')
          as String);
  @override
  _i4.NlIruoyCommonV0ModelsHealthcheckResource get healthchecks =>
      (super.noSuchMethod(Invocation.getter(#healthchecks),
              returnValue: _FakeNlIruoyCommonV0ModelsHealthcheckResource_2())
          as _i4.NlIruoyCommonV0ModelsHealthcheckResource);
  @override
  _i2.NlIruoyWhocooksRecipesV0ModelsRecipeResource get recipes =>
      (super.noSuchMethod(Invocation.getter(#recipes),
              returnValue:
                  _FakeNlIruoyWhocooksRecipesV0ModelsRecipeResource_3())
          as _i2.NlIruoyWhocooksRecipesV0ModelsRecipeResource);
}

/// A class which mocks [NlIruoyWhocooksRecipesV0ModelsRecipeResource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNlIruoyWhocooksRecipesV0ModelsRecipeResource extends _i1.Mock
    implements _i2.NlIruoyWhocooksRecipesV0ModelsRecipeResource {
  MockNlIruoyWhocooksRecipesV0ModelsRecipeResource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_1()) as _i3.Client);
  @override
  String get baseUrl =>
      (super.noSuchMethod(Invocation.getter(#baseUrl), returnValue: '')
          as String);
  @override
  _i7.Future<List<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>> get(
          {int? limit = 100, int? skip = 0}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {#limit: limit, #skip: skip}),
              returnValue:
                  Future<List<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>>.value(
                      <_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>[]))
          as _i7.Future<List<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>>);
  @override
  _i7.Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe> post(
          _i5.NlIruoyWhocooksRecipesV0ModelsRecipeForm? recipeForm) =>
      (super.noSuchMethod(Invocation.method(#post, [recipeForm]),
          returnValue: Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>.value(
              _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_4())) as _i7
          .Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>);
  @override
  _i7.Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe> getById({String? id}) =>
      (super.noSuchMethod(Invocation.method(#getById, [], {#id: id}),
          returnValue: Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>.value(
              _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_4())) as _i7
          .Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>);
  @override
  _i7.Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe> putById(
          _i5.NlIruoyWhocooksRecipesV0ModelsRecipeForm? recipeForm,
          {String? id}) =>
      (super.noSuchMethod(Invocation.method(#putById, [recipeForm], {#id: id}),
          returnValue: Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>.value(
              _FakeNlIruoyWhocooksRecipesV0ModelsRecipe_4())) as _i7
          .Future<_i5.NlIruoyWhocooksRecipesV0ModelsRecipe>);
  @override
  _i7.Future<void> deleteById({String? id}) =>
      (super.noSuchMethod(Invocation.method(#deleteById, [], {#id: id}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
}
