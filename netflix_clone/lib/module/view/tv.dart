import 'package:flutter/material.dart';

import 'description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular TV Shows',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          SizedBox(
            // color: Colors.red,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['original_title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              tv[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              tv[index]['poster_path'],
                          description: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          launchon: "02-02-2022",
                        ),
                      ),
                    )
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    // color: Colors.green,
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['backdrop_path']),
                                fit: BoxFit.cover),
                          ),
                          height: 140,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          tv[index]['original_title'] != null
                              ? tv[index]['original_title']
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
