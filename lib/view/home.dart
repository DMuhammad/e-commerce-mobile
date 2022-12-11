import 'package:flutter/material.dart';
import 'package:uas_mobile/viewmodel/fetchDataProducts.dart';
import 'package:uas_mobile/model/products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Javanica Shop'),
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            const Center(
              child: Text("Gagal ambil data"),
            );
          }
          return snapshot.hasData
              ? const Text("success")
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
