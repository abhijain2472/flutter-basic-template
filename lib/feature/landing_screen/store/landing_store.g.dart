// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LandingStore on _LandingStore, Store {
  final _$stateAtom = Atom(name: '_LandingStore.state');

  @override
  UIState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UIState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LandingStore.errorMessage');

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

  final _$runLandingLogicAsyncAction =
      AsyncAction('_LandingStore.runLandingLogic');

  @override
  Future<void> runLandingLogic(BuildContext context) {
    return _$runLandingLogicAsyncAction
        .run(() => super.runLandingLogic(context));
  }

  final _$_LandingStoreActionController =
      ActionController(name: '_LandingStore');

  @override
  void resetUIState({UIState state = UIState.free, String errMsg = ''}) {
    final _$actionInfo = _$_LandingStoreActionController.startAction(
        name: '_LandingStore.resetUIState');
    try {
      return super.resetUIState(state: state, errMsg: errMsg);
    } finally {
      _$_LandingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage}
    ''';
  }
}
