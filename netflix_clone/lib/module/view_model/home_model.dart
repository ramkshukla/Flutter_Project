class HomeModelList {
  AppState appState;
  ResponseModel? responseModel;
  HomeModelList({required this.appState, this.responseModel});
}

class ResponseModel<T> {
  String statusCode;
  String statusMessage;
  T? data;
  ResponseModel({
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });
}

enum AppState {
  initial,
  loading,
  success,
  failure,
  nointernet,
}
