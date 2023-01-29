part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  HomeLoadedState({
    required this.data,
  });
  final InvestmentAndService data;
}

class HomeErrorState extends HomeState {
  HomeErrorState({
    required this.message,
  });

  final String message;
}
