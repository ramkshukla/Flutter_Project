import 'package:flutter/material.dart';
import 'package:flutterlearn/module/http/controller/http_bloc.dart';

import 'package:flutterlearn/module/signup/view_model/signup_model.dart';
import 'package:flutterlearn/util/bloc/block_builder.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});
  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  final ApiBloc _apiBloc = ApiBloc();

  @override
  void initState() {
    super.initState();
    _apiBloc.getAPICall();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () {
        return Scaffold(
          appBar: AppBar(),
          body: _apiBloc.state.appState == AppState.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    children: [
                      Text(_apiBloc.state.responseModel?.data["metadata"]
                          ["name"]),
                      Image.network(_apiBloc
                          .state.responseModel?.data["metadata"]["images"][0]),
                      // Text(_apiBloc.state.responseModel?.data['metadata'])
                      // Expanded(
                      //   child: ListView.builder(
                      //       itemCount: _apiBloc
                      //           .state.responseModel?.data["metadata"].length,
                      //       itemBuilder: (context, index) {
                      //         return _buildListItem(index);
                      //       }),
                      // ),
                    ],
                  ),
                ),
        );
      },
      bloc: _apiBloc,
    );
  }

  // Widget _buildListItem(int index) {
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     color: Colors.red,
  //     padding: const EdgeInsets.all(10),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(_apiBloc.state.responseModel?.data["metadata"]["name"])
  // Text(_apiBloc.state.modelList[index].date),
  // Text(_apiBloc.state.modelList[index].countryCode),
  // Text(_apiBloc.state.modelList[index].name),
  // Text(_apiBloc.state.modelList[index].localName)
  //       ],
  //     ),
  //   );
  // }
}
// _data[index]["date"].toString()
//_data[index]["localName"].toString()
//_data[index]["name"].toString()
//_data[index]["countryCode"].toString()

