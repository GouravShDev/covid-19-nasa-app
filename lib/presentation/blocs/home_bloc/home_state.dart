part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final int prediction;

  HomeLoaded({required this.prediction});
}

class HomeError extends HomeState {}
