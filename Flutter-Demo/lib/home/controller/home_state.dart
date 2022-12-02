part of 'home_bloc.dart';

class HomeState {
  final List<MovieDTO> nowPlaying;
  final bool fetchingNowPlaying;
  final List<MovieDTO> trending;
  final bool fetchingTrending;
  final List<MovieDTO> popular;
  final bool fetchingPopular;
  final List<MovieDTO> topRated;
  final bool fetchingTopRated;
  final MovieDetailDTO? movieDetailDTO;
  final bool fetchingMovieDetail;

  HomeState({
    this.nowPlaying = const [],
    this.fetchingNowPlaying = false,
    this.trending = const [],
    this.fetchingTrending = false,
    this.popular = const [],
    this.fetchingPopular = false,
    this.topRated = const [],
    this.fetchingTopRated = false,
    this.fetchingMovieDetail = false,
    this.movieDetailDTO,
  });

  HomeState copyWith({
    List<MovieDTO>? nowPlaying,
    bool? fetchingNowPlaying,
    List<MovieDTO>? trending,
    bool? fetchingTrending,
    List<MovieDTO>? popular,
    bool? fetchingPopular,
    List<MovieDTO>? topRated,
    bool? fetchingTopRated,
    MovieDetailDTO? movieDetailDTO,
    bool? fetchingMovieDetail,
  }) {
    return HomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      fetchingNowPlaying: fetchingNowPlaying ?? this.fetchingNowPlaying,
      trending: trending ?? this.trending,
      fetchingTrending: fetchingTrending ?? this.fetchingTrending,
      popular: popular ?? this.popular,
      fetchingPopular: fetchingPopular ?? this.fetchingPopular,
      topRated: topRated ?? this.topRated,
      fetchingTopRated: fetchingTopRated ?? this.fetchingTopRated,
      movieDetailDTO: movieDetailDTO ?? this.movieDetailDTO,
      fetchingMovieDetail: fetchingMovieDetail ?? this.fetchingMovieDetail,
    );
  }

  @override
  String toString() {
    return 'HomeState(nowPlaying: $nowPlaying, fetchingNowPlaying: $fetchingNowPlaying, trending: $trending, fetchingTrending: $fetchingTrending, popular: $popular, fetchingPopular: $fetchingPopular, topRated: $topRated, fetchingTopRated: $fetchingTopRated, movieDetailDTO: $movieDetailDTO, fetchingMovieDetail: $fetchingMovieDetail)';
  }
}
