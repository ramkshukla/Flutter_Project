import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveoapp/_utils/constants/app_constants.dart';
import 'package:moveoapp/home/model/movie_dto.dart';

import '../../../_utils/constants/routes.dart';

class MovieCard extends StatelessWidget {
  final MovieDTO movie;
  final bool showingShading;
  final bool isActive;
  const MovieCard({
    Key? key,
    required this.movie,
    this.showingShading = true,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.movieInfo, arguments: movie.id);
      },
      child: Container(
        width: 130.0,
        margin: EdgeInsets.only(
          top: 20.0,
          bottom: isActive ? 20.0 : 25.0,
          //left: 10.0,
          right: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: showingShading
              ? [
                  const BoxShadow(
                    color: Colors.white24,
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                    offset: Offset(-1.0, 2.0),
                  )
                ]
              : [],
          image: DecorationImage(
            alignment: Alignment.center,
            colorFilter:
                const ColorFilter.mode(Colors.black38, BlendMode.srcOver),
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              "${envConfig.imageBaseUrl}${movie.posterImage}",
            ),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(boxShadow: []),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 5.0, bottom: 5.0, right: 3.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                movie.date.toString(),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
