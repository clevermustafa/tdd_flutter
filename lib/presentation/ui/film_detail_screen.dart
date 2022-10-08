import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';
import 'package:testing_with_flutter/presentation/features/bloc/filmdetails_bloc.dart';

import '../../core/service_locator.dart';
import '../common_widgets/loading_widget.dart';
import '../features/film_bloc/film_bloc.dart';

class FilmDetailScreen extends StatefulWidget {
  final int id;
  const FilmDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<FilmDetailScreen> createState() => _FilmDetailScreenState();
}

class _FilmDetailScreenState extends State<FilmDetailScreen> {
  late FilmdetailsBloc _filmdetailsBloc;

  @override
  void initState() {
   _filmdetailsBloc = FilmdetailsBloc(di());
   _filmdetailsBloc.add(GetFilmDetailsEvent(widget.id));
    super.initState();
  }

  @override
  void dispose() {
    _filmdetailsBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text("Film Detail"),
      ),
      body: BlocBuilder<FilmdetailsBloc, FilmdetailsState>(
        bloc:_filmdetailsBloc,
        builder: (context, state) {
          if (state is FilmDetailsLoading) {
            return const LoadingWidget();
          } else if (state is FilmDetailsError) {
            return ErrorWidget(state.errorMessage);
          } else if (state is FilmDetailsLoaded) {
            FilmEntity filmdetails = state.filmDetails;
            return Card(
                child: ListTile(
                  title: Text(filmdetails.title ?? "No title"),
                  subtitle: Text(filmdetails.openingCrawl ?? "No description"),
                  trailing: Text(filmdetails.producer ?? ""),
                ),
              );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}