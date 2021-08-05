import 'package:flutter/material.dart';

/// scale animation initially small & then zoom out
class AppScaleAnimation extends StatefulWidget {
  final Widget? child;
  final bool expand;
  final int milliSeconds;
  final Alignment? alignment;

  const AppScaleAnimation({
    Key? key,
    this.expand = false,
    this.child,
    this.milliSeconds = 500,
    this.alignment,
  }) : super(key: key);

  @override
  AppScaleAnimationState createState() => AppScaleAnimationState();
}

class AppScaleAnimationState extends State<AppScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    _expandController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.milliSeconds,
        ),
        reverseDuration: Duration(
          milliseconds: widget.milliSeconds ~/ 2,
        ));
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
    );
  }

  Future<void> reverseAnimation() async {
    await _expandController.reverse();
  }

  void _runExpandCheck() {
    if (widget.expand) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(AppScaleAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: widget.alignment ?? Alignment.center,
      scale: _animation,
      child: widget.child,
    );
  }
}
