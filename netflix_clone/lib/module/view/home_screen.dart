import 'package:flutter/material.dart';
import 'package:netflix_clone/module/controller/home_bloc.dart';
import 'package:netflix_clone/module/view/topRated.dart';
import 'package:netflix_clone/module/view/trending.dart';
import 'package:netflix_clone/module/view/tv.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = HomeBloc();
  List topRated = [];
  List trendingMovies = [];
  List tv = [];
  Future loadData() async {
    tv = await _homeBloc.getPopularMovies();
    topRated = await _homeBloc.getTopRated();
    trendingMovies = await _homeBloc.getTrendingMovie();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Movie App '),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TV(tv: tv.toList()),
          TrendingMovies(
            trending: trendingMovies.toList(),
          ),
          TopRatedMovies(
            toprated: topRated.toList(),
          ),
        ],
      ),
    );
  }
}
