import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_controller_event.dart';
part 'game_controller_state.dart';

class GameControllerBloc
    extends Bloc<GameControllerEvent, GameControllerState> {
  GameControllerBloc() : super(GameControllerState.initial()) {
    on<GameControllerUpdatePosition>(_onUpdatePosition);
  }

  void _onUpdatePosition(
    GameControllerUpdatePosition event,
    Emitter<GameControllerState> emit,
  ) {
    emit(GameControllerState(position: event.position));
  }
}
