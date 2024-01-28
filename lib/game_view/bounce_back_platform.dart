import 'package:circle_bricks_breaker/theme/colors.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/collisions.dart';
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

  final _platformDepth = 8.0;
  double get platformDepth => _platformDepth;

  Rad anglePosition;

  Vector2 get centerPosition => Vector2(
        radius,
        radius,
      );

  Rad _centerPlatform(Rad currentPosition) =>
      currentPosition - platformSize / 2;

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()
      ..color = platformColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = platformDepth;

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

extension CollisionUtils on BounceBackPlatform {
  //TODO: add collision with intersection points
  bool isCollisionWithPlatform(Vector2 ballPosition) {
    final vectorToBallPosition = Vector2(
      ballPosition.x - centerPosition.x,
      ballPosition.y - centerPosition.y,
    );

    final ballAnglePosition = findAngle(horizontalVector, vectorToBallPosition);

    if (ballAnglePosition >= anglePosition - platformSize &&
        ballAnglePosition <= anglePosition + platformSize) {
      return true;
    }
    return false;
  }
}
