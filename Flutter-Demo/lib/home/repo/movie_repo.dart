import 'package:dartz/dartz.dart';

import '../../_utils/entities/api_response.dart';
import '../../_utils/services/api_call.dart';
import '../model/movie_detail_dto.dart';
import '../model/movie_dto.dart';

abstract class MovieRepository {
  Future<APIResponse<List<MovieDTO>>> fetchNowPlaying();

  Future<APIResponse<List<MovieDTO>>> fetchTrending();

  Future<APIResponse<List<MovieDTO>>> fetchPopular();

  Future<APIResponse<List<MovieDTO>>> fetchTopRated();

  Future<APIResponse<MovieDetailDTO>> getMovieDetail(int id);
}

class MovieRepositotyImpl implements MovieRepository {
  @override
  Future<APIResponse<List<MovieDTO>>> fetchNowPlaying() async {
    return await ApiCall<List<MovieDTO>>().handleApi(
      endpoint: "movie/now_playing",
      handleSuccess: (responseBody) async {
        final listMap = responseBody["results"] as List<dynamic>;

        return right(listMap.map((e) => MovieDTO.fromMap(e)).toList());
      },
    );
  }

  @override
  Future<APIResponse<List<MovieDTO>>> fetchTrending() async {
    return await ApiCall<List<MovieDTO>>().handleApi(
      endpoint: "trending/movie/week",
      handleSuccess: (responseBody) async {
        final listMap = responseBody["results"] as List<dynamic>;

        return right(listMap.map((e) => MovieDTO.fromMap(e)).toList());
      },
    );
  }

  @override
  Future<APIResponse<List<MovieDTO>>> fetchPopular() async {
    return await ApiCall<List<MovieDTO>>().handleApi(
      endpoint: "movie/popular",
      handleSuccess: (responseBody) async {
        final listMap = responseBody["results"] as List<dynamic>;

        return right(listMap.map((e) => MovieDTO.fromMap(e)).toList());
      },
    );
  }

  @override
  Future<APIResponse<List<MovieDTO>>> fetchTopRated() async {
    return await ApiCall<List<MovieDTO>>().handleApi(
      endpoint: "movie/top_rated",
      handleSuccess: (responseBody) async {
        final listMap = responseBody["results"] as List<dynamic>;

        return right(listMap.map((e) => MovieDTO.fromMap(e)).toList());
      },
    );
  }

  @override
  Future<APIResponse<MovieDetailDTO>> getMovieDetail(int id) async {
    return await ApiCall<MovieDetailDTO>().handleApi(
      endpoint: "movie/$id",
      handleSuccess: (responseBody) async {
        return right(
            MovieDetailDTO.fromMap(responseBody as Map<String, dynamic>));
      },
    );
  }
}
