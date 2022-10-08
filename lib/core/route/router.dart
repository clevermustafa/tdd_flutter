import 'package:auto_route/auto_route.dart';
import 'package:testing_with_flutter/presentation/ui/film_detail_screen.dart';

import '../../presentation/ui/film_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: FilmScreen, initial: true),
    AutoRoute(page: FilmDetailScreen)
  ],
)
class $AppRouter {}
