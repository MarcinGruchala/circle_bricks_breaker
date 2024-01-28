import 'package:circle_bricks_breaker/game_controller/bloc/game_controller_bloc.dart';
import 'package:circle_bricks_breaker/theme/colors.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/painting.dart';

class GameControllerComponent extends RectangleComponent
    with FlameBlocReader<GameControllerBloc, GameControllerState> {
  GameControllerComponent(
    this.parentSize,
  ) {
    size = Vector2(parentSize.x, parentSize.y / 2);
    position = Vector2(0, parentSize.y / 2);
    paint = Paint()..color = cbrWhite;
  }

  final Vector2 parentSize;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final circleRadius = size.x / 3;
    final centerX = size.x / 2;
    final centerY = size.y / 2;

    final dragCircle = DragCircleComponent(
      position: Vector2(centerX - circleRadius, centerY - circleRadius),
      radius: circleRadius,
      onNewDragPosition: (Rad angle) {
        bloc.add(GameControllerUpdatePosition(position: angle));
      },
    );

    add(dragCircle);
  }
}

class DragCircleComponent extends CircleComponent with DragCallbacks {
  DragCircleComponent({
    required Vector2 position,
    required double radius,
    required this.onNewDragPosition,
  }) : _localCircleCenter = Vector2(radius, radius) {
    this.position = position;
    this.radius = radius;

    paint = Paint()..color = cbrGrey;
  }

  final Function(double) onNewDragPosition;

  final Vector2 _localCircleCenter;

  Rad _findAngleToDragPoint(Vector2 dragPoint) {
    final vectorToDragPoint = Vector2(
      dragPoint.x - _localCircleCenter.x,
      dragPoint.y - _localCircleCenter.y,
    );
    return findAngle(
      horizontalVector,
      vectorToDragPoint,
    );
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    onNewDragPosition(_findAngleToDragPoint(event.localPosition));
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    onNewDragPosition(_findAngleToDragPoint(event.localEndPosition));
  }
}
