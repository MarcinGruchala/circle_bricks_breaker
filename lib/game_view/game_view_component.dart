import 'dart:async';
import 'dart:ui' hide TextStyle;

import 'package:circle_bricks_breaker/game_controller/bloc/game_controller_bloc.dart';
import 'package:circle_bricks_breaker/game_view/game_circle_component.dart';
import 'package:circle_bricks_breaker/theme/colors.dart';
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

  late GameCircleComponent gameCircle;

  @override
  void onNewState(GameControllerState state) {
    gameCircle.bounceBackPlatform.anglePosition = state.position;
  }

  @override
  FutureOr<void> onLoad() {
    final centerX = size.x / 2;
    final centerY = size.y / 1.8;

    final gameCircleRadius = size.x / 2.5;

    final gameCirclePosition = Vector2(
      centerX - gameCircleRadius,
      centerY - gameCircleRadius,
    );

    gameCircle = GameCircleComponent(
      position: gameCirclePosition,
      radius: gameCircleRadius,
      platformColor: cbrWhite,
    );

    addAll([gameCircle]);
  }
}
