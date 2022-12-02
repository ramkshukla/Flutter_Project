import 'package:flutterlearn/module/signup/view_model/signup_model.dart';

class ModelList {
  AppState appState;
  //List<ModelClass> modelList;
  ResponseModel? responseModel;
  //ModelList({required this.appState, required this.modelList});
  ModelList({required this.appState, this.responseModel});
}

class ModelClass {
  String date;
  String localName;
  String name;
  String countryCode;

  ModelClass(
      {required this.date,
      required this.localName,
      required this.name,
      required this.countryCode});

  factory ModelClass.fromJson(Map json) {
    return ModelClass(
        date: json["date"],
        localName: json["localName"],
        name: json["name"],
        countryCode: json["countryCode"]);
  }
}
