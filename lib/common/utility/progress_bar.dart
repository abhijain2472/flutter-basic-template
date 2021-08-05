import 'package:basic_template/common/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressBar {
  BuildContext? _context;

//============ Singletone Start =====================
  static final ProgressBar _progressBar = ProgressBar._internal();

  factory ProgressBar() {
    return _progressBar;
  }

  ProgressBar._internal();

  static ProgressBar get instance => _progressBar;

  bool _isShowing = false;

//============ Singletone End =====================

  void showProgressBarWithContext(BuildContext context) {
    this._context = context;
    this._isShowing = true;
    showDialog(
        context: _context!,
        barrierDismissible: false,
        barrierColor: AppColors.blackColor.withOpacity(0.3),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          );
        });
  }

  void hideProgressBar() {
    if (this._context != null && this._isShowing) {
      _isShowing = false;
      Navigator.pop(_context!);
    }
  }
}
