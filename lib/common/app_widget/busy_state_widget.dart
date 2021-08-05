
import 'package:basic_template/common/themes/app_colors.dart';
import 'package:basic_template/services/network/enum/store_enum.dart';
import 'package:flutter/material.dart';

/// common loading widget/busy state widget that prevent touch while data is loading
class BusyStateWidget extends StatelessWidget {
  final UIState state;
  final bool showProgressIndicator;
  final bool allowFullHeight;

  const BusyStateWidget({
    Key? key,
    required this.state,
    this.showProgressIndicator = false,
    this.allowFullHeight = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state == UIState.busy || state == UIState.loading
        ? WillPopScope(
            onWillPop: () async {
              return Future.value(state != UIState.busy);
            },
            child: AbsorbPointer(
              absorbing: state == UIState.busy,
              child: AbsorbPointer(
                absorbing: state == UIState.busy,
                child: Container(
                  color: showProgressIndicator
                      ? AppColors.blackColor.withOpacity(0.3)
                      : Colors.transparent,
                  height: allowFullHeight ? double.infinity : null,
                  width: double.infinity,
                  child: showProgressIndicator
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
