part of 'game_controller_bloc.dart';

abstract class GameControllerEvent extends Equatable {
  const GameControllerEvent();
}

class GameControllerUpdatePosition extends GameControllerEvent {
  const GameControllerUpdatePosition({required this.position});
  final Rad position;

  @override
  List<Object?> get props => [position];

  @override
  bool get stringify => true;
}
