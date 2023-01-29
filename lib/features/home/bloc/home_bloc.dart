import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/investment_and_service.dart';
import '../../../core/service/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._apiService) : super(HomeInitial()) {
    on<HomeLoadingEvent>(_loading);
    on<HomeLoadedEvent>(_loaded);
  }

  late final ApiService _apiService;

  static HomeBloc of(BuildContext context) {
    return BlocProvider.of<HomeBloc>(context);
  }

  Future<void> _loading(HomeLoadingEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
  }

  Future<void> _loaded(HomeLoadedEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final InvestmentAndService data =
          await _apiService.getAssetsAndServices();
      emit(HomeLoadedState(data: data));
    } catch (_) {
      emit(HomeErrorState(message: 'An error have occured'));
    }
  }
}
