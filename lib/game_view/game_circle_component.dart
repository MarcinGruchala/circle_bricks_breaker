import 'package:circle_bricks_breaker/game_view/ball_component.dart';
import 'package:circle_bricks_breaker/game_view/bounce_back_circle_component.dart';
import 'package:circle_bricks_breaker/game_view/bounce_back_platform.dart';
import 'package:circle_bricks_breaker/theme/colors.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class GameCircleComponent extends CircleComponent with HasCollisionDetection {
  GameCircleComponent({
    required Vector2 super.position,
    required double super.radius,
    required this.platformColor,
  });

  final Color platformColor;
  Rad controllerPosition = 0.0;

  late BounceBackPlatform bounceBackPlatform;
  late CircleComponent bounceBackCircleComponent;
  late BallComponent ballComponent;

  Vector2 get circleCenter => Vector2(
        radius,
        radius,
      );

  @override
  Future<void> onLoad() {
    final bounceBackCircleRadius = radius / 5;
    bounceBackCircleComponent = BounceBackCircleComponent(
      position: Vector2(
        circleCenter.x - bounceBackCircleRadius,
        circleCenter.y - bounceBackCircleRadius,
      ),
      radius: bounceBackCircleRadius,
      paint: Paint()..color = cbrGrey,
    );

    bounceBackPlatform = BounceBackPlatform(
      position: Vector2(0, 0),
      radius: radius,
      anglePosition: controllerPosition,
      platformSize: radFromDegrees(30),
    );

    final ballRadius = radius / 20;
    ballComponent = BallComponent(
      position: Vector2(
        circleCenter.x + radius - bounceBackPlatform.platformDepth - ballRadius,
        circleCenter.y,
      ),
      radius: ballRadius,
      paint: Paint()..color = cbrBlue,
    );

    addAll([
      bounceBackCircleComponent,
      bounceBackPlatform,
      ballComponent,
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    ballComponent.move();
  }
}
