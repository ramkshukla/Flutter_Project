part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchNowPlaying extends HomeEvent {}

class FetchTrending extends HomeEvent {}

class FetchPopular extends HomeEvent {}

class FetchTopRated extends HomeEvent {}

class GetMovieDetail extends HomeEvent {
  final int id;

  GetMovieDetail(this.id);
}
