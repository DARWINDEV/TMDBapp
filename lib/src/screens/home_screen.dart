import 'package:flutter/material.dart';
import 'package:movieapp/src/providers/movies_provider.dart';
import 'package:movieapp/src/search/search_delegate.dart';
import 'package:movieapp/src/widgets/card_swiper.dart';
import 'package:movieapp/src/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Peliculas actuales'),
        actions: [
          IconButton(onPressed: ()=> showSearch(context: context, delegate: MovieSearchDelegate()), icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares', onNextPage: () => moviesProvider.getPopularMovies())
          ],
        ),
      )
    );
  }
}
