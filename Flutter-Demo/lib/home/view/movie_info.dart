import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moveoapp/_utils/configs/theme_config.dart';

import '../../_utils/ui_components/widget_extensions.dart';
import '../controller/home_bloc.dart';

class MovieInfoPage extends StatelessWidget {
  const MovieInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments;

    return BlocProvider(
      create: (context) => HomeBloc()..add(GetMovieDetail(id)),
      child: const MovieInfoPageUI(),
    );
  }
}

class MovieInfoPageUI extends StatelessWidget {
  const MovieInfoPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  state.movieDetailDTO?.title ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Release Date\n\n",
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: /* getDisplayDateFormat(DateTime.parse(
                                state.movieDetailDTO?.date ?? "")) */
                                "s",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "Rating",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        RatingBarIndicator(
                          rating: (state.movieDetailDTO?.rating ?? 0) / 2,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          itemCount: 5,
                          itemSize: 21.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: Colors.blue.wrapMatProp()),
                child: const Text(
                  "Book Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
