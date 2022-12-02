import 'package:flutter/material.dart';

import 'description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Rated Movies',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'],
                          bannerurl:
                              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' +
                                  toprated[index]['backdrop_path'],
                          posterurl:
                              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' +
                                  toprated[index]['poster_path'],
                          description: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          launchon: "02-02-2022",
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' +
                                      toprated[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          toprated[index]['title'] != null
                              ? toprated[index]['title']
                              : 'Loading',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
