import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nb_utils/nb_utils.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  bool isInternet = true;

  InternetCubit({required this.connectivity})
      : assert(connectivity != null),
        super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      getConnectivity(connectivityResult);
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    await connectivityStreamSubscription!.cancel();
    return super.close();
  }

  checkInternet() async {
    var connectivityResult = await connectivity.checkConnectivity();
    getConnectivity(connectivityResult);
  }

  void getConnectivity(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi) {
      print("connectivityResult:: WIFI");
      emitInternetConnected(ConnectionType.wifi);
    } else if (connectivityResult == ConnectivityResult.mobile) {
      print("connectivityResult:: mobile");
      emitInternetConnected(ConnectionType.mobile);
    } else if (connectivityResult == ConnectivityResult.none) {
      print("connectivityResult:: none");
      emitInternetDisconnected();
    }
  }
}
