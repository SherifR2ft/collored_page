import 'package:flutter/material.dart';

/// Represents an animated text widget which fades in/out the text.
class AnimatedTextWidget extends StatefulWidget {
  /// The text to be displayed.
  final String text;

  /// The style of the text.
  final TextStyle? style;

  /// Creates a new [AnimatedTextWidget].
  /// [text] must not be null.
  const AnimatedTextWidget({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  AnimatedTextWidgetState createState() => AnimatedTextWidgetState();
}

class AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  String _displayText = '';
  int _index = 0;
  late AnimationController _animationController;

  void _startAnimation() {
    _animationController.forward();
    _animateText();
  }

  void _animateText() {
    if (_index < widget.text.length) {
      setState(() {
        _displayText = widget.text.substring(0, _index + 1);
        _index++;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        _animateText();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      _startAnimation();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _animationController.value,
          child: child,
        );
      },
      child: Text(
        _displayText,
        style: widget.style,
      ),
    );
  }
}
