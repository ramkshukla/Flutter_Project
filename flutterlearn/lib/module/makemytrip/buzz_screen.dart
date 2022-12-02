import 'package:flutter/material.dart';

class BuzzScreen extends StatefulWidget {
  const BuzzScreen({super.key});

  @override
  State<BuzzScreen> createState() => _BuzzScreenState();
}

class _BuzzScreenState extends State<BuzzScreen> {
  final List<String> names = <String>[
    "Trending",
    "Movies",
    "Events",
    "Sports",
    "Streaming",
    "Video"
  ];

  final List<String> moviesName = <String>[
    "Prime Movies",
    "Netflix Movies",
    "Peppa Pig Live",
    "Prateek Kuhad",
  ];

  final List<String> movieImages = <String>[
    "assets/images/chhapak.jpg",
    "assets/images/ahmet-yalcinkaya-aNrRsB2wLDk-unsplash.jpg",
    "assets/images/krists-luhaers-AtPWnYNDJnM-unsplash.jpg",
    "assets/images/timothy-eberly-dTLlhgeEJWg-unsplash.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 127, 64, 140),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "BUZZ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Discover what's trending on entertainment",
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 187, 187), fontSize: 17),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return _moviesStoriesItem(context, index);
                },
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              height: 40,
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: names.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _movieCategory(context, index);
                },
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(15),
              height: 1000,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _moviesDescription(context, index);
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Buzz'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'Profile'),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.red,
      ),
    );
  }

  Widget _moviesStoriesItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                backgroundImage: AssetImage(movieImages[index]),
              )),
          const SizedBox(width: 5.0, height: 5.0),
          Text(
            moviesName[index],
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _movieCategory(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Chip(
        label: Text(names[index]),
        backgroundColor: const Color.fromARGB(255, 214, 186, 186),
      ),
    );
  }

  Widget _moviesDescription(BuildContext context, int index) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25), // Image border
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // Image radius
            child: Image.asset(
              movieImages[index],
              height: 200,
              width: 200,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Should You Watch movie ?",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  Icons.bookmark_border,
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(movieImages[index]),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("18 Mins ago"),
                const SizedBox(width: 70),
                const Icon(Icons.favorite_border_outlined),
                const SizedBox(width: 5),
                const Text("9"),
                const SizedBox(width: 10),
                const Icon(Icons.share)
              ],
            )
          ],
        )
      ],
    );
  }
}
