part of 'game_controller_bloc.dart';

class GameControllerState extends Equatable {
  const GameControllerState({required this.position});

  factory GameControllerState.initial() {
    return const GameControllerState(position: 0);
  }
  final Rad position;

  @override
  List<Object?> get props => [position];

  @override
  bool get stringify => true;
}
