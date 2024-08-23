import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkConnectivity {
  Future<bool> isInternetConnected();
}

class NetworkConnectivityImp extends NetworkConnectivity {
  final Connectivity _connectivity;
  NetworkConnectivityImp(this._connectivity);

  @override
  Future<bool> isInternetConnected() async {
    final status = await _connectivity.checkConnectivity();
    return ((status == ConnectivityResult.mobile) ||
        (status == ConnectivityResult.wifi));
  }
}
