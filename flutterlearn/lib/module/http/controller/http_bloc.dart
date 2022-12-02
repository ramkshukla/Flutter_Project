import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutterlearn/module/http/model/http_model.dart';
import 'package:flutterlearn/module/signup/view_model/signup_model.dart';
import 'package:flutterlearn/util/bloc/block.dart';
import 'package:http/http.dart' as http;

class ApiBloc extends Bloc<ModelList> {
  @override
  ModelList initDefaultValue() {
    return ModelList(appState: AppState.initial);
  }

  Future<void> getAPICall() async {
    state.appState = AppState.loading;
    emit(state);
    var response = await http.get(
      Uri.parse("https://list.ly/api/v4/meta?url=http://google.com"),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
          statusCode: response.statusCode.toString(),
          statusMessage: "Success",
          data: jsonDecode(response.body));
      //   List tempData = jsonDecode(response.body);
      //  debugPrint(tempData.toString());
      //   for (Map temp in tempData) {
      //     state.modelList.add(ModelClass.fromJson(temp));
      //   }
      //   debugPrint(state.modelList.length.toString());
    } else {
      debugPrint("Try Again");
      state.appState = AppState.failure;
    }
    emit(state);
  }
}
