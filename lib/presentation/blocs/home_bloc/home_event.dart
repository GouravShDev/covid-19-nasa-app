part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetPredication extends HomeEvent {
  final Position position;
  GetPredication(this.position);
}
