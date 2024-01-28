import 'package:circle_bricks_breaker/game_view/bounce_back_circle_component.dart';
import 'package:circle_bricks_breaker/game_view/bounce_back_platform.dart';
import 'package:circle_bricks_breaker/utils/log.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class BallComponent extends CircleComponent with CollisionCallbacks {
  BallComponent({
    required Vector2 super.position,
    required double super.radius,
    required Paint super.paint,
  });

  Vector2 _moveVector = Vector2(-1, 0);

  void move() {
    position += _moveVector;
  }

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is BounceBackCircleComponent) {
      _moveVector = Vector2(1, _moveVector.y);
    }
    if (other is BounceBackPlatform) {
      final isCollisionWithPlatform =
          other.isCollisionWithPlatform(position + Vector2(radius, radius));
      log('BallComponent collision:\n'
          'collision intersection: $intersectionPoints\n'
          'ball position: $position \n'
          'with platform: $isCollisionWithPlatform,\n');
      _moveVector = Vector2(-1, _moveVector.y);
    }
  }
}
