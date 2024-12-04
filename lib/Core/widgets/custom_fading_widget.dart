import 'package:flutter/material.dart';

class CustomFadingAnimation extends StatefulWidget {
  const CustomFadingAnimation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CustomFadingAnimation> createState() => _CustomFadingAnimationState();
}

class _CustomFadingAnimationState extends State<CustomFadingAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: .2, end: .8).animate(_animationController);
    _animationController.addListener(
      () {
        setState(() {});
      },
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: widget.child,
    );
  }
}
