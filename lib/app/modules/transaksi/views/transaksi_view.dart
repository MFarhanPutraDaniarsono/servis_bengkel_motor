import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() =>
      _TransaksiPageState();
}

class _TransaksiPageState
    extends State<TransaksiPage> {
  int selectedIndex = 2; // default: Selesai

  final List<String> tabs = [
    "Antrian",
    "Dikerjakan",
    "Selesai",
    "Batal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Riwayat Transaksi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // Search
              TextField(
                decoration:
                    InputDecoration(
                  hintText:
                      "Cari nomor transaksi atau nama pelanggan",
                  prefixIcon:
                      const Icon(
                    Icons.search,
                  ),
                  filled: true,
                  fillColor:
                      Colors.white,
                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                                10),
                    borderSide:
                        BorderSide
                            .none,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // Tabs
              Row(
                children:
                    List.generate(
                  tabs.length,
                  (index) {
                    final isSelected =
                        selectedIndex ==
                            index;

                    return Padding(
                      padding:
                          const EdgeInsets
                              .only(
                        right: 10,
                      ),
                      child:
                          GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex =
                                index;
                          });
                        },
                        child:
                            Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal:
                                14,
                            vertical:
                                8,
                          ),
                          decoration:
                              BoxDecoration(
                            color:
                                isSelected
                                    ? Colors
                                        .blue[700]
                                    : Colors
                                        .white,
                            borderRadius:
                                BorderRadius.circular(
                                    20),
                            border:
                                Border.all(
                              color:
                                  isSelected
                                      ? Colors
                                          .blue
                                      : Colors
                                          .grey
                                          .shade300,
                            ),
                          ),
                          child: Text(
                            tabs[index],
                            style:
                                TextStyle(
                              color:
                                  isSelected
                                      ? Colors
                                          .white
                                      : Colors
                                          .grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              // Content
              Expanded(
                child:
                    buildContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 Semua tab disamakan
  Widget buildContent() {
    return emptyState(
      "Transaksi Kosong",
    );
  }

  // 🔥 Dibuat benar-benar center
  Widget emptyState(String text) {
    return Center(
      child: Column(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          const Icon(
            Icons.receipt_long,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}