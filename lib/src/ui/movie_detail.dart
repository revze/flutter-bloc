import 'package:belajar_bloc/src/blocs/movie_detail_bloc.dart';
import 'package:belajar_bloc/src/blocs/movie_detail_bloc_provider.dart';
import 'package:belajar_bloc/src/models/trailer_model.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final String posterUrl;
  final String description;
  final String releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail(
      {this.posterUrl,
      this.description,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.movieId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetail> {
  MovieDetailBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = MovieDetailBlocProvider.of(context);
    bloc.fetchTrailersById(widget.movieId);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.posterUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1, right: 1),
                      ),
                      Text(
                        widget.voteAverage,
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Text(
                        widget.releaseDate,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                  Text('Trailer',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                  StreamBuilder(
                      stream: bloc.movieTrailers,
                      builder: (context,
                          AsyncSnapshot<Future<TrailerModel>> snapshot) {
                        if (snapshot.hasData) {
                          return FutureBuilder(
                              future: snapshot.data,
                              builder: (context,
                                  AsyncSnapshot<TrailerModel> itemSnapShot) {
                                if (itemSnapShot.hasData) {
                                  if (itemSnapShot.data.results.length > 0) {
                                    return trailerLayout(itemSnapShot.data);
                                  } else
                                    return noTrailer(itemSnapShot.data);
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }

  Widget noTrailer(TrailerModel data) {
    return Center(
      child: Container(
        child: Text('No trailer available'),
      ),
    );
  }

  Widget trailerLayout(TrailerModel data) {
    if (data.results.length > 1) {
      return Row(
        children: <Widget>[
          trailerItem(data, 0),
          trailerItem(data, 1),
        ],
      );
    } else {
      return Row(
        children: <Widget>[trailerItem(data, 0)],
      );
    }
  }

  Widget trailerItem(TrailerModel data, int index) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          height: 100,
          color: Colors.grey,
          child: Center(
            child: Icon(Icons.play_circle_filled),
          ),
        ),
        Text(
          data.results[index].name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ));
  }
}
