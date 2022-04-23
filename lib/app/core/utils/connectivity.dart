import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../widgets/custom_snackbar.dart';

abstract class VerifyConnectivity {
  static Future<bool> isConnected({bool showMsg = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      if (showMsg) {
        CustomSnackBar.showSnackBar(
            "Check your internet connection!", Get.context,
            title: "Ops...");
      }
      return false;
    }
  }
}
