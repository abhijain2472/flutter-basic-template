import 'package:basic_template/common/themes/enums.dart';
import 'package:flutter/material.dart';

class AppSlideAnimation extends StatefulWidget {
  final Widget? child;
  final bool expand;
  final int milliSeconds;
  final SlideAnimationType slideAnimationType;

  const AppSlideAnimation({
    Key? key,
    this.expand = true,
    this.slideAnimationType = SlideAnimationType.BottomToTop,
    this.milliSeconds = 400,
    required this.child,
  }) : super(key: key);

  @override
  _AppSlideAnimationState createState() => _AppSlideAnimationState();
}

class _AppSlideAnimationState extends State<AppSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    _prepareAnimations();
    _runAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(AppSlideAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runAnimation();
  }

  ///Setting up the animation
  void _prepareAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.milliSeconds,
      ),
    );

    offset = Tween<Offset>(
      end: Offset.zero,
      begin: getOffsetFromType,
    ).animate(controller);
  }

  Offset get getOffsetFromType {
    if (widget.slideAnimationType == SlideAnimationType.BottomToTop) {
      return Offset(0.0, 1.0);
    } else if (widget.slideAnimationType == SlideAnimationType.TopToBottom) {
      return Offset(0.0, -1.0);
    } else if (widget.slideAnimationType == SlideAnimationType.RightToLeft) {
      return Offset(1.0, 0.0);
    } else {
      /// left to right
      return Offset(-1.0, 0.0);
    }
  }

  void _runAnimation() {
    if (widget.expand) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.repeat(reverse: true);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset,
      child: widget.child,
    );
  }
}
