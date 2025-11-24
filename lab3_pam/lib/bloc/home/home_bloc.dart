import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/news_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewsRepository repository;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<HomeRequested>(_onHomeRequested);
  }

  Future<void> _onHomeRequested(
      HomeRequested event,
      Emitter<HomeState> emit,
      ) async {
    emit(const HomeLoadInProgress());
    try {
      final data = await repository.loadHomeData();
      emit(HomeLoadSuccess(data));
    } catch (e) {
      emit(HomeLoadFailure(e.toString()));
    }
  }
}