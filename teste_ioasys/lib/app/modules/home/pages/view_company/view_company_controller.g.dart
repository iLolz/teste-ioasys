// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_company_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ViewCompanyController = BindInject(
  (i) => ViewCompanyController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewCompanyController on _ViewCompanyControllerBase, Store {
  final _$valueAtom = Atom(name: '_ViewCompanyControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ViewCompanyControllerBaseActionController =
      ActionController(name: '_ViewCompanyControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ViewCompanyControllerBaseActionController
        .startAction(name: '_ViewCompanyControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ViewCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
