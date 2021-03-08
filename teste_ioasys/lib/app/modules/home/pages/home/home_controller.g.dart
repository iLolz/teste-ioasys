// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(repository: i<HomeRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$appStatusAtom = Atom(name: '_HomeControllerBase.appStatus');

  @override
  AppStatus get appStatus {
    _$appStatusAtom.reportRead();
    return super.appStatus;
  }

  @override
  set appStatus(AppStatus value) {
    _$appStatusAtom.reportWrite(value, super.appStatus, () {
      super.appStatus = value;
    });
  }

  final _$copmaniesAtom = Atom(name: '_HomeControllerBase.copmanies');

  @override
  List<Company> get copmanies {
    _$copmaniesAtom.reportRead();
    return super.copmanies;
  }

  @override
  set copmanies(List<Company> value) {
    _$copmaniesAtom.reportWrite(value, super.copmanies, () {
      super.copmanies = value;
    });
  }

  final _$getEnterprisesAsyncAction =
      AsyncAction('_HomeControllerBase.getEnterprises');

  @override
  Future<void> getEnterprises() {
    return _$getEnterprisesAsyncAction.run(() => super.getEnterprises());
  }

  @override
  String toString() {
    return '''
appStatus: ${appStatus},
copmanies: ${copmanies}
    ''';
  }
}
