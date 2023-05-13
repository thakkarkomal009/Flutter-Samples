import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_sticky_header/business_logic/splash/splash_cubit.dart';
import 'package:side_sticky_header/utils/colors.dart';
import 'package:side_sticky_header/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is MoveToNextScreen) {
          Navigator.pushReplacementNamed(
            context,
            FEED_LIST_SCREEN,
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [colorPrimary, gradient2, gradient2],
                  tileMode: TileMode.clamp),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flutter_dash,
                size: 220,
                color: Colors.blue.shade400,
              )
            ],
          ),
        ],
      ),
    );
  }
}
