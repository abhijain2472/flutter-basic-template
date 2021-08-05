import 'package:basic_template/common/themes/context_global_method.dart';
import 'package:flutter/material.dart';

class AppBouncingWidget extends StatefulWidget {
  final Widget child;
  final Function? onPressed;
  final double scaleFactor;
  final bool removeFocus;

  AppBouncingWidget({
    required this.child,
    Key? key,
    this.onPressed,
    this.scaleFactor = 1,
    this.removeFocus = true,
  }) : super(key: key);

  @override
  _AppBouncingWidgetState createState() => _AppBouncingWidgetState();
}

class _AppBouncingWidgetState extends State<AppBouncingWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - (_controller.value * widget.scaleFactor);
    return GestureDetector(
      onTap: () {
        if (widget.removeFocus) {
          ContextGlobalMethod.hideGlobalKb(context);
        }
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Listener(
        onPointerDown: (PointerDownEvent event) {
          if (widget.onPressed != null) {
            _controller.forward();
          }
        },
        onPointerUp: (PointerUpEvent event) {
          if (widget.onPressed != null) {
            _controller.reverse();
          }
        },
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }
}
