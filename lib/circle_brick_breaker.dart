import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class CircleBricksBreaker extends FlameGame {
  late RectangleComponent gameController;
  late RectangleComponent gameView;

  @override
  Future<void> onLoad() async {
    gameController = GameControllerComponent(size);
    gameView = GameViewComponent(size);

    add(gameController);
    add(gameView);
  }
}

class GameControllerComponent extends RectangleComponent {
  GameControllerComponent(
    this.parentSize,
  ) {
    size = Vector2(parentSize.x, parentSize.y / 2);
    position = Vector2(0, parentSize.y / 2);
    paint = Paint()..color = const Color.fromARGB(255, 243, 250, 255);
  }

  final Vector2 parentSize;
  late CircleComponent dragCircle;




  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final circleRadius = size.x / 3;
    final centerX = size.x / 2;
    final centerY = size.y / 2;

    dragCircle = DragCircleComponent(
      position: Vector2(centerX - circleRadius, centerY - circleRadius),
      radius: circleRadius,
    );

    add(dragCircle);
  }
}

class GameViewComponent extends RectangleComponent {
  final Vector2 parentSize;

  GameViewComponent(this.parentSize) {
    size = Vector2(parentSize.x, parentSize.y / 2);
    position = Vector2(0, 0);
    paint = Paint()..color = const Color(0xFF07aaf0);
  }
}

class DragCircleComponent extends CircleComponent {
  DragCircleComponent({
    required Vector2 position,
    required double radius,
  }) {
    this.position = position;
    this.radius = radius;
    paint = Paint()..color = Color.fromARGB(255, 122, 122, 122);
  }
}
