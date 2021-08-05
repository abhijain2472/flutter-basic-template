
import 'package:basic_template/common/app_widget/pagination/store/app_pagination_controller_store.dart';
import 'package:basic_template/common/themes/enums.dart';
import 'package:basic_template/services/network/enum/store_enum.dart';
import 'package:basic_template/widgets/animated_widgets/app_scale_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../app_error_widget.dart';

class PaginationItemWidget extends StatelessWidget {
  final Function? onTapRetry;
  final AppPaginationController? paginationController;
  const PaginationItemWidget({
    Key? key,
    required this.paginationController,
    this.onTapRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: getPaginationWidget(),
    );
  }

  Widget getPaginationWidget() {
    return Observer(
      builder: (_) {
        if (paginationController!.isAllDataFetched) {
          /// initial page number is 0 & if it is loaded & last item was found in 1st page then on complete method is called
          /// and page number is increased by one
          /// so we need to check if data is loaded second time & then there is a last item found then we can show no more item widget
          if (paginationController!.pageNo > 0) {
            /// build no more item widget
            return buildNoMoreItemWidget();
          } else {
            return SizedBox.shrink();
          }
        } else if (paginationController!.state == PaginationState.ERROR) {
          return AppErrorWidget(
            margin: EdgeInsets.only(
              bottom: 40,
              top: 8,
            ),
            errorMessage: paginationController!.error,
            uiState: UIState.error,
            showRetryButton: true,
            onTapRetry: onTapRetry,
          );
        }
        // else if (paginationController!.state == PaginationState.BUSY) {
        //   Utility.log("BUsy Called");
        //   return buildPaginationLoader();
        // }
        else {
          return buildPaginationLoader();
          // return SizedBox.shrink();
        }
      },
    );
  }

  // Widget getMainWidget() {
  //   if (isLastItem) {
  //     /// initial page number is 1 & if it is loaded & last item was found in 1st page then on complete method is called
  //     /// and page number is increased by one
  //     /// so we need to check if data is loaded second time & then there is a last item found then we can show no more item widget
  //     if (nextPageNumber > 2) {
  //       /// build no more item widget
  //       return buildNoMoreItemWidget();
  //     } else {
  //       return SizedBox.shrink();
  //     }
  //   } else if (paginationError != null) {
  //     return AppErrorWidget(
  //       margin: EdgeInsets.only(
  //         bottom: 40,
  //         top: 8,
  //       ),
  //       errorMessage: paginationError!,
  //       uiState: UIState.error,
  //       showRetryButton: true,
  //       onTapRetry: onTapRetry,
  //     );
  //   } else {
  //     return buildPaginationLoader();
  //   }
  // }

  Widget buildPaginationLoader() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 40, top: 20),
      child: AppScaleAnimation(
        expand: true,
        child: CircularProgressIndicator(),
      ),
    );
  }

  SizedBox buildNoMoreItemWidget() {
    return SizedBox.shrink();
  }
}
