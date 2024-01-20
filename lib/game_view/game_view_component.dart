import 'dart:async';
import 'dart:ui' hide TextStyle;

import 'package:circle_bricks_breaker/game_controller/bloc/game_controller_bloc.dart';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:flame_bloc/flame_bloc.dart';

class GameViewComponent extends RectangleComponent
    with FlameBlocListenable<GameControllerBloc, GameControllerState> {
  GameViewComponent(this.parentSize) {
    size = Vector2(parentSize.x, parentSize.y / 2);
    position = Vector2(0, 0);
    paint = Paint()..color = const Color(0xFF07aaf0);
  }
  final Vector2 parentSize;

  Rad controllerPosition = 0.0;
  late TextComponent textComponent;

  @override
  void onNewState(GameControllerState state) {
    controllerPosition = state.position;
    textComponent.text =
        controllerPosition.normalize().toStringAsFixed(2);
  }

  @override
  FutureOr<void> onLoad() {
    textComponent = TextComponent(
      text: '$controllerPosition',
      position: Vector2(size.x / 2, size.y / 2),
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 20.0, // Change the font size here
        ),
      ),
    );

    add(
      textComponent,
    );
  }
}
