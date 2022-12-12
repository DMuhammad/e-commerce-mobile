import 'package:flutter/material.dart';
import 'package:uas_mobile/view/product.dart';
import 'package:uas_mobile/view/liveSupport.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.live_help)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          title: const Text('NIKI Toko'),
          backgroundColor: const Color(0xff1F1D2B),
        ),
        body: const TabBarView(
          children: [
            ProductPage(),
            ChatPage(),
            ProductPage(),
          ],
        ),
        backgroundColor: const Color(0xff242231),
      ),
    );
  }
}
