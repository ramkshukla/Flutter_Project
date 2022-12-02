import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../bloc/bloc.dart';
import '../view_model/home_model.dart';

class HomeBloc extends Bloc<HomeModelList> {
  @override
  HomeModelList initDefaultValue() {
    return HomeModelList(appState: AppState.initial);
  }

  Future<List> getPopularMovies() async {
    state.appState = AppState.loading;
    emit(state);
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=dd3b117ce6223771ee6c788ea1d73678&language=en-US&page=1"),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: response.statusCode.toString(),
        statusMessage: "Success",
        data: jsonDecode(response.body),
      );
      return state.responseModel!.data['results'].toList();
    } else {
      debugPrint("Try Again");
      state.appState = AppState.failure;
    }
    emit(state);
    return [];
  }

  Future<List> getTopRated() async {
    state.appState = AppState.loading;
    emit(state);
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=dd3b117ce6223771ee6c788ea1d73678&language=en-US&page=1"),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: response.statusCode.toString(),
        statusMessage: "Success",
        data: jsonDecode(response.body),
      );
      return state.responseModel!.data['results'].toList();
    } else {
      debugPrint("Try Again");
      state.appState = AppState.failure;
    }
    emit(state);
    return [];
  }

  Future<List> getTrendingMovie() async {
    state.appState = AppState.loading;
    emit(state);
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/trending/all/day?api_key=dd3b117ce6223771ee6c788ea1d73678"),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: response.statusCode.toString(),
        statusMessage: "Success",
        data: jsonDecode(response.body),
      );
      return state.responseModel!.data['results'].toList();
    } else {
      debugPrint("Try Again");
      state.appState = AppState.failure;
    }
    emit(state);
    return [];
  }
}
