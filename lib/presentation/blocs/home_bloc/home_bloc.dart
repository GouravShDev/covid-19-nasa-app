import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:covid_19_app/data/datasource/remote_datasource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RemoteDataSources remoteDataSources;
  HomeBloc(this.remoteDataSources) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetPredication) {
        emit(HomeLoading());
        try {
          await remoteDataSources.getWeatherData(event.position);
          await remoteDataSources.getCovidData(event.position);
        } on ServerException {
          emit(HomeError());
        }

        // await Future.delayed(const Duration(milliseconds: 5000), () {
        final int predication = Random().nextInt(3);
        emit(HomeLoaded(prediction: predication));
        // });
      }
    });
  }
}
