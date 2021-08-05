// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_pagination_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppPaginationController on _AppPaginationController, Store {
  Computed<PaginationState>? _$stateComputed;

  @override
  PaginationState get state =>
      (_$stateComputed ??= Computed<PaginationState>(() => super.state,
              name: '_AppPaginationController.state'))
          .value;
  Computed<String>? _$errorComputed;

  @override
  String get error => (_$errorComputed ??= Computed<String>(() => super.error,
          name: '_AppPaginationController.error'))
      .value;
  Computed<int>? _$pageNoComputed;

  @override
  int get pageNo => (_$pageNoComputed ??= Computed<int>(() => super.pageNo,
          name: '_AppPaginationController.pageNo'))
      .value;
  Computed<bool>? _$isAllDataFetchedComputed;

  @override
  bool get isAllDataFetched => (_$isAllDataFetchedComputed ??= Computed<bool>(
          () => super.isAllDataFetched,
          name: '_AppPaginationController.isAllDataFetched'))
      .value;
  Computed<bool>? _$isFreeStateComputed;

  @override
  bool get isFreeState =>
      (_$isFreeStateComputed ??= Computed<bool>(() => super.isFreeState,
              name: '_AppPaginationController.isFreeState'))
          .value;

  final _$_stateAtom = Atom(name: '_AppPaginationController._state');

  @override
  PaginationState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(PaginationState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_errorMessageAtom =
      Atom(name: '_AppPaginationController._errorMessage');

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  final _$_pageNumberAtom = Atom(name: '_AppPaginationController._pageNumber');

  @override
  int get _pageNumber {
    _$_pageNumberAtom.reportRead();
    return super._pageNumber;
  }

  @override
  set _pageNumber(int value) {
    _$_pageNumberAtom.reportWrite(value, super._pageNumber, () {
      super._pageNumber = value;
    });
  }

  final _$_AppPaginationControllerActionController =
      ActionController(name: '_AppPaginationController');

  @override
  void increasePageNumber() {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.increasePageNumber');
    try {
      return super.increasePageNumber();
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaginationState(
      {PaginationState state = PaginationState.FREE, String errMsg = ''}) {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.setPaginationState');
    try {
      return super.setPaginationState(state: state, errMsg: errMsg);
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompleteState() {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.setCompleteState');
    try {
      return super.setCompleteState();
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBusyState() {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.setBusyState');
    try {
      return super.setBusyState();
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFreeState() {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.setFreeState');
    try {
      return super.setFreeState();
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorState(String e) {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.setErrorState');
    try {
      return super.setErrorState(e);
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllData() {
    final _$actionInfo = _$_AppPaginationControllerActionController.startAction(
        name: '_AppPaginationController.clearAllData');
    try {
      return super.clearAllData();
    } finally {
      _$_AppPaginationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
error: ${error},
pageNo: ${pageNo},
isAllDataFetched: ${isAllDataFetched},
isFreeState: ${isFreeState}
    ''';
  }
}
