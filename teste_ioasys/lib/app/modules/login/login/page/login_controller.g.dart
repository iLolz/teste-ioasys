// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(repository: i<LoginRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_LoginControllerBase.hasError'))
          .value;

  final _$appStatusAtom = Atom(name: '_LoginControllerBase.appStatus');

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

  final _$passwordVisibilityAtom =
      Atom(name: '_LoginControllerBase.passwordVisibility');

  @override
  bool get passwordVisibility {
    _$passwordVisibilityAtom.reportRead();
    return super.passwordVisibility;
  }

  @override
  set passwordVisibility(bool value) {
    _$passwordVisibilityAtom.reportWrite(value, super.passwordVisibility, () {
      super.passwordVisibility = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<void> login({String email, String password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setStatus({AppStatus status}) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setStatus');
    try {
      return super.setStatus(status: status);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetErrorMessage() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.resetErrorMessage');
    try {
      return super.resetErrorMessage();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changeObscure() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeObscure');
    try {
      return super.changeObscure();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appStatus: ${appStatus},
passwordVisibility: ${passwordVisibility},
errorMessage: ${errorMessage},
hasError: ${hasError}
    ''';
  }
}
