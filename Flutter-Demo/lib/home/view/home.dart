import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../_utils/constants/asset_constants.dart';
import '../controller/home_bloc.dart';
import 'widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(FetchNowPlaying())
        ..add(FetchTrending())
        ..add(FetchPopular())
        ..add(FetchTopRated()),
      child: const HomePageUI(),
    );
  }
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Image.asset(
          Assets.netflixLogo,
          height: 60.0,
        )
        /* Text(
          "NETFLIX",
          style: TextStyle(color: Colors.red),
        ) */
        ,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              context.read<HomeBloc>()
                ..add(FetchNowPlaying())
                ..add(FetchTrending())
                ..add(FetchPopular())
                ..add(FetchTopRated());

              final completer = Completer();
              completer.complete();
              return completer.future;
            },
            child: CustomScrollView(
              slivers: <Widget>[
                if (state.fetchingNowPlaying)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      height: 230.0,
                      child: PageView.builder(
                        pageSnapping: true,
                        allowImplicitScrolling: true,
                        controller: PageController(viewportFraction: 0.9),
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                          isActive: false,
                          movie: state.nowPlaying[index],
                        ),
                        itemCount: state.nowPlaying.length,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: const Text(
                      "Trending",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                if (state.fetchingTrending)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                          showingShading: false,
                          movie: state.trending[index],
                        ),
                        itemCount: state.trending.length,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: const Text(
                      "Popular Movies",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                if (state.fetchingPopular)
                  SliverToBoxAdapter(
                      child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ))
                else
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                          showingShading: false,
                          movie: state.popular[index],
                        ),
                        itemCount: state.popular.length,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: const Text(
                      "Top Rated",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                if (state.fetchingTopRated)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                          showingShading: false,
                          movie: state.topRated[index],
                        ),
                        itemCount: state.topRated.length,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
