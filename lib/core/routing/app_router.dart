import 'package:flutter/material.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/features/search/presentation/view/search_view.dart';

import '../../features/home/presentation/view/home_view.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRouteName:
        return MaterialPageRoute(builder: (context) => HomeView());
      case Routes.searchRouteName:
        return MaterialPageRoute(builder: (context) => SearchView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
