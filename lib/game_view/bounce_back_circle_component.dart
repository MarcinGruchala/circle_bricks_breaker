import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class BounceBackCircleComponent extends CircleComponent {
  BounceBackCircleComponent({
    required Vector2 super.position,
    required double super.radius,
    required Paint super.paint,
  });

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }
}
