import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../transaksi/views/transaksi_view.dart';
import '../../servis/views/servis_view.dart';
import '../../akun/views/akun_view.dart';

class DashboardController extends GetxController {

  // 🔥 Bottom navbar index
  var selectedIndex = 0.obs;

  // 🔥 Pages
  final List<Widget> pages = [
    const SizedBox(), // Dashboard content
    TransaksiPage(),
    ServisPage(),
    const AkunPage(),
  ];

  // 🔥 Change tab
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}