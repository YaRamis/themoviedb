import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/app_gradients.dart';

import 'app_button_style.dart';

class DefaultGradientIcon extends StatelessWidget {
  const DefaultGradientIcon(this.icon, this.size,
      {super.key, required this.isActive});

  final IconData icon;
  final double size;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Gradient gradient = isActive
        ? AppGradients.defaultAppLinearGradient
        : AppGradients.greyAppLinearGradient;

    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

class DefaultGradientTextButton extends StatelessWidget {
  const DefaultGradientTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Gradient gradient = AppGradients.defaultAppLinearGradient;

    return TextButton(
      onPressed: onPressed,
      style: AppButtonStyle.defaultButtonStyle,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            alignment: Alignment.center,
            child: child),
      ),
    );
  }
}
