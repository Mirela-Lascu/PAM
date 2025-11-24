import 'package:equatable/equatable.dart';

import '../../models/home_data.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoadInProgress extends HomeState {
  const HomeLoadInProgress();
}

class HomeLoadSuccess extends HomeState {
  final HomeData data;

  const HomeLoadSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeLoadFailure extends HomeState {
  final String message;

  const HomeLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}