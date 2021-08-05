import 'package:basic_template/common/themes/enums.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'app_pagination_controller_store.g.dart';

class AppPaginationController = _AppPaginationController with _$AppPaginationController;

abstract class _AppPaginationController with Store {
  
  
  @observable
  PaginationState _state = PaginationState.FREE;

  @observable
  String _errorMessage = "";

  @observable
  int _pageNumber = 0;

  @computed
  PaginationState get state => this._state;

  @computed
  String get error => this._errorMessage;

  @computed
  int get pageNo => this._pageNumber;

  @computed
  bool get isAllDataFetched => this._state == PaginationState.COMPLETED;

  @computed
  bool get isFreeState => this._state != PaginationState.BUSY;

  @action
  void increasePageNumber() {
    this._pageNumber = this._pageNumber + 1;
  }

  @action
  void setPaginationState({
    PaginationState state = PaginationState.FREE,
    String errMsg = '',
  }) {
    this._state = state;
    this._errorMessage = errMsg;
  }

  @action
  void setCompleteState() {
    this._state = PaginationState.COMPLETED;
    this._errorMessage = '';
  }

  @action
  void setBusyState() {
    this._state = PaginationState.BUSY;
    this._errorMessage = '';
  }

  @action
  void setFreeState() {
    this._state = PaginationState.FREE;
    this._errorMessage = '';
  }

  @action
  void setErrorState(String e) {
    this._state = PaginationState.ERROR;
    this._errorMessage = e;
  }

  @action
  void clearAllData() {
    this._state = PaginationState.FREE;
    this._errorMessage = '';
    this._pageNumber = 0;
  }
}
