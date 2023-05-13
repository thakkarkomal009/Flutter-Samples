import 'dart:async';

import 'package:bloc/bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(splashValue: 4)) {
    getUser();
  }

  getUser() async {
    Timer(Duration(seconds: state.splashValue!), () async {
      emit(MoveToNextScreen());
    });
  }
}
