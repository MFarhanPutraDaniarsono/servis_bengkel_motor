import 'package:get/get.dart';

class ServisController extends GetxController {
  var barcode = ''.obs;

  void setBarcode(String code) {
    barcode.value = code;
  }
}