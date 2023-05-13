//navigate to particular screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_sticky_header/business_logic/feed/feed_cubit.dart';
import 'package:side_sticky_header/business_logic/splash/splash_cubit.dart';
import 'package:side_sticky_header/presentation/screens/feed_list_screen.dart';
import 'package:side_sticky_header/presentation/screens/splash_screen.dart';
import 'package:side_sticky_header/utils/constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        final splashCubit = SplashCubit();

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider.value(
              value: splashCubit,
              child: const SplashScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );
      case FEED_LIST_SCREEN:
        final feedCubit = FeedCubit();
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider.value(
              value: feedCubit,
              child: FeedListScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );
      default:
        final splashCubit = SplashCubit();
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider.value(
              value: splashCubit,
              child: SplashScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );
    }
  }
}

FadeTransition getTransition(Animation<double> animation, Widget child) {
  animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);

  return FadeTransition(opacity: animation, child: child);
}
