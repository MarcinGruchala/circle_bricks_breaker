import 'dart:async';
import 'dart:ui' hide TextStyle;

import 'package:circle_bricks_breaker/game_controller/bloc/game_controller_bloc.dart';
import 'package:circle_bricks_breaker/game_view/bounce_back_platform.dart';
import 'package:circle_bricks_breaker/theme/colors.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

class GameViewComponent extends RectangleComponent
    with FlameBlocListenable<GameControllerBloc, GameControllerState> {
  GameViewComponent(this.parentSize) {
    size = Vector2(parentSize.x, parentSize.y / 2);
    position = Vector2(0, 0);
    paint = Paint()..color = cbrBlue;
  }
  final Vector2 parentSize;
  Rad controllerPosition = 0.0;

  late BounceBackPlatform bounceBackPlatform;
  late CircleComponent gameCircleComponent;
  late CircleComponent bounceBackCircleComponent;

  @override
  void onNewState(GameControllerState state) {
    controllerPosition = state.position;

    bounceBackPlatform.anglePosition = controllerPosition;
  }

  @override
  FutureOr<void> onLoad() {
    final gameCircleRadius = size.x / 2.5;
    final bounceBackCircleRadius = gameCircleRadius / 5;

    final centerX = size.x / 2;
    final centerY = size.y / 1.8;

    gameCircleComponent = CircleComponent(
      position: Vector2(centerX - gameCircleRadius, centerY - gameCircleRadius),
      radius: gameCircleRadius,
      paint: Paint()..color = cbrWhite,
    );

    bounceBackCircleComponent = CircleComponent(
      position: Vector2(
          centerX - bounceBackCircleRadius, centerY - bounceBackCircleRadius),
      radius: bounceBackCircleRadius,
      paint: Paint()..color = cbrGrey,
    );

    bounceBackPlatform = BounceBackPlatform(
      position: Vector2(centerX - gameCircleRadius, centerY - gameCircleRadius),
      radius: gameCircleRadius,
      anglePosition: controllerPosition,
      platformSize: radFromDegrees(30),
    );

    addAll([
      gameCircleComponent,
      bounceBackCircleComponent,
      bounceBackPlatform,
    ]);
  }
}
