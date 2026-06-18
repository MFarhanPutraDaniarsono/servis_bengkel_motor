import 'package:get/get.dart';

import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/otp_view.dart';

import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';

// 🔹 Akun
import '../modules/akun/views/akun_view.dart';
import '../modules/akun/bindings/akun_binding.dart';

// 🔹 Modul lainnya
import '../modules/jasa/views/jasa_view.dart';
import '../modules/pelanggan/views/pelanggan_view.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/bukukas/views/buku_kas_view.dart';
import '../modules/transaksi/views/transaksi_view.dart';
import '../modules/servis/views/servis_view.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [

    // 🔹 LOGIN
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),

    // 🔹 REGISTER
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),

    // 🔹 OTP
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpPage(),
    ),

    // 🔹 DASHBOARD
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

    // 🔹 AKUN
    GetPage(
      name: AppRoutes.akun,
      page: () => const AkunPage(),
      binding: AkunBinding(),
    ),

    // 🔹 JASA
    GetPage(
      name: AppRoutes.jasa,
      page: () => const JasaPage(),
    ),

    // 🔹 PELANGGAN
    GetPage(
      name: AppRoutes.pelanggan,
      page: () => const PelangganPage(),
    ),

    // 🔹 KATEGORI
    GetPage(
      name: AppRoutes.kategori,
      page: () => const KategoriPage(),
    ),

    // 🔹 PRODUK
    GetPage(
      name: AppRoutes.produk,
      page: () => const ProdukPage(),
    ),

    // 🔹 BUKU KAS
    GetPage(
      name: AppRoutes.bukukas,
      page: () => const BukuKasPage(),
    ),

    // 🔹 TRANSAKSI
    GetPage(
      name: AppRoutes.transaksi,
      page: () => TransaksiPage(),
    ),

    // 🔹 SERVIS
    GetPage(
      name: AppRoutes.servis,
      page: () => ServisPage(),
    ),
  ];
}