import 'package:circle_bricks_breaker/theme/colors.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BounceBackPlatform extends CircleComponent {
  BounceBackPlatform({
    super.position,
    super.radius,
    required this.anglePosition,
    required this.platformSize,
    this.platformColor = cbrGrey,
  }) {
    paint = Paint()..color = cbrTransparent;
  }

  final Rad platformSize;
  final Color platformColor;

  Rad anglePosition;

  Vector2 get centerPosition => Vector2(
        radius,
        radius,
      );

  Rad _centerPlatform(Rad currentPosition) =>
      currentPosition - ninetyDegreesInRadians - platformSize / 2;

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()
      ..color = platformColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final Path path = Path();
    path.arcTo(
      Rect.fromCircle(center: centerPosition.toOffset(), radius: radius),
      _centerPlatform(anglePosition.normalize()),
      platformSize,
      false,
    );
    canvas.drawPath(path, paint);
    super.render(canvas);
  }
}
