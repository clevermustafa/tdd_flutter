// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:testing_with_flutter/presentation/ui/film_detail_screen.dart'
    as _i2;
import 'package:testing_with_flutter/presentation/ui/film_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FilmScreen.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.FilmScreen(),
      );
    },
    FilmDetailScreen.name: (routeData) {
      final args = routeData.argsAs<FilmDetailScreenArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.FilmDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          FilmScreen.name,
          path: '/',
        ),
        _i3.RouteConfig(
          FilmDetailScreen.name,
          path: '/film-detail-screen',
        ),
      ];
}

/// generated route for
/// [_i1.FilmScreen]
class FilmScreen extends _i3.PageRouteInfo<void> {
  const FilmScreen()
      : super(
          FilmScreen.name,
          path: '/',
        );

  static const String name = 'FilmScreen';
}

/// generated route for
/// [_i2.FilmDetailScreen]
class FilmDetailScreen extends _i3.PageRouteInfo<FilmDetailScreenArgs> {
  FilmDetailScreen({
    _i4.Key? key,
    required int id,
  }) : super(
          FilmDetailScreen.name,
          path: '/film-detail-screen',
          args: FilmDetailScreenArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'FilmDetailScreen';
}

class FilmDetailScreenArgs {
  const FilmDetailScreenArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'FilmDetailScreenArgs{key: $key, id: $id}';
  }
}
