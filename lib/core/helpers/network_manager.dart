import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  static Future<bool> hasConnection() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();

      if (connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  static Stream<bool> connectionStream() async* {
    await for (var results in Connectivity().onConnectivityChanged) {
      if (results.contains(ConnectivityResult.none)) {
        yield false;
      } else {
        yield true;
      }
    }
  }

}

