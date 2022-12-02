import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveoapp/_utils/ui_components/widget_extensions.dart';
import 'package:moveoapp/home/model/movie_detail_dto.dart';
import 'package:moveoapp/home/model/movie_dto.dart';
import 'package:moveoapp/home/repo/movie_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchNowPlaying>((event, emit) async {
      emit(state.copyWith(fetchingNowPlaying: true));

      final result = await MovieRepositotyImpl().fetchNowPlaying();

      final updatedState = result.fold(
        (l) => state.copyWith(fetchingNowPlaying: false),
        (r) => state.copyWith(
          fetchingNowPlaying: false,
          nowPlaying: r,
        ),
      );

      emit(updatedState);
    });

    on<FetchTrending>((event, emit) async {
      emit(state.copyWith(fetchingTrending: true));

      final result = await MovieRepositotyImpl().fetchTrending();

      final updatedState = result.fold(
        (l) => state.copyWith(fetchingTrending: false),
        (r) => state.copyWith(
          fetchingTrending: false,
          trending: r,
        ),
      );

      emit(updatedState);
    });

    on<FetchPopular>((event, emit) async {
      emit(state.copyWith(fetchingPopular: true));

      final result = await MovieRepositotyImpl().fetchPopular();

      final updatedState = result.fold(
        (l) => state.copyWith(fetchingPopular: false),
        (r) => state.copyWith(
          fetchingPopular: false,
          popular: r,
        ),
      );

      log(updatedState.toString());

      emit(updatedState);
    });

    on<FetchTopRated>((event, emit) async {
      emit(state.copyWith(fetchingTopRated: true));

      final result = await MovieRepositotyImpl().fetchTopRated();

      final updatedState = result.fold(
        (l) => state.copyWith(fetchingTopRated: false),
        (r) => state.copyWith(
          fetchingTopRated: false,
          topRated: r,
        ),
      );

      emit(updatedState);
    });

    on<GetMovieDetail>((event, emit) async {
      emit(state.copyWith(fetchingMovieDetail: true));
      "id: ${event.id}".logIt;

      final result = await MovieRepositotyImpl().getMovieDetail(event.id);

      final updatedState = result.fold(
        (l) => state.copyWith(fetchingMovieDetail: false),
        (r) => state.copyWith(
          fetchingMovieDetail: false,
          movieDetailDTO: r,
        ),
      );

      emit(updatedState);
    });
  }
}
