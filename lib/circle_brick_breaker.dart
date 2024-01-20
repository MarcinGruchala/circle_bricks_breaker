import 'package:circle_bricks_breaker/game_controller/bloc/game_controller_bloc.dart';
import 'package:circle_bricks_breaker/game_controller/game_controller_component.dart';
import 'package:circle_bricks_breaker/game_view/game_view_component.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';

class CircleBricksBreaker extends FlameGame {
  @override
  Future<void> onLoad() async {
    final gameController = GameControllerComponent(size);
    final gameView = GameViewComponent(size);

    await add(
      FlameBlocProvider<GameControllerBloc, GameControllerState>(
        create: GameControllerBloc.new,
        children: [gameController, gameView],
      ),
    );
  }
}
