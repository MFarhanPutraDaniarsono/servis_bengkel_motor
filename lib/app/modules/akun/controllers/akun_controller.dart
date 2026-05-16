import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class AkunController extends GetxController {
  var nama = "Abdan".obs;
  var noHp = "081943661097".obs;
  var role = "Pemilik".obs;

  void logout() {
    debugPrint("Logout berhasil");
  }
}