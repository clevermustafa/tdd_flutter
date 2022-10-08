import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testing_with_flutter/core/route/router.gr.dart';
import 'package:testing_with_flutter/core/service_locator.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_with_flutter/presentation/common_widgets/loading_widget.dart';
import 'package:testing_with_flutter/presentation/features/film_bloc/film_bloc.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({Key? key}) : super(key: key);

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  late FilmBloc _filmBloc;
  @override
  void initState() {
    _filmBloc = FilmBloc(di());
    _filmBloc.add(GetFilmsEvent());

    super.initState();
  }

  @override
  void dispose() {
    _filmBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Films"),
      ),
      body: BlocBuilder<FilmBloc, FilmState>(
        bloc: _filmBloc,
        builder: (context, state) {
          if (state is FilmLoading) {
            return const LoadingWidget();
          } else if (state is FilmError) {
            return ErrorWidget(state.failureMessage);
          } else if (state is FilmLoaded) {
            List<FilmEntity>? films = state.result.results;
            return ListView.builder(
                itemCount: films?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(FilmDetailScreen(id: index + 1));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(films?[index].title ?? "No title"),
                        subtitle: Text(films?[index].director ?? "No director"),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
