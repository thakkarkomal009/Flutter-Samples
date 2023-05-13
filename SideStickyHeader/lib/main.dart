import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:side_sticky_header/business_logic/internet/internet_cubit.dart';
import 'package:side_sticky_header/presentation/router/router.dart';
import 'package:side_sticky_header/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      SideStickyHeaderApp(router: AppRouter(), connectivity: Connectivity()));
}

class SideStickyHeaderApp extends StatelessWidget {
  final AppRouter? router;
  final Connectivity connectivity;

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  //create key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  SideStickyHeaderApp({Key? key, this.router, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(SCREEN_WIDTH, SCREEN_HEIGHT),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider<InternetCubit>(
                  create: (BuildContext context) =>
                      InternetCubit(connectivity: connectivity),
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: router!.generateRoute,
                navigatorKey: navigatorKey,
                scaffoldMessengerKey: rootScaffoldMessengerKey,
              ));
        });
  }
}
