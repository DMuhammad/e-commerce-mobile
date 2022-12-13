import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List members = [
    {
      'name': 'Muhammad Khoirul Huda',
      'nim': '200605110085',
      'profile': 'huda_tampan.jpg',
      'biodata': 'Saya adalah seorang mahasiswa di Universitas Islam Negeri Maulana Malik Ibrahim Malang',
    },
    {
      'name': 'M. Royhan Daffa',
      'nim': '200605110104',
      'profile': 'royhan.jpg',
      'biodata': 'Saya adalah seorang mahasiswa di Universitas Islam Negeri Maulana Malik Ibrahim Malang',
    },
    {
      'name': 'Muhammad Dzikri Zulkifly Riskha',
      'nim': '200605110053',
      'profile': 'dzikri.jpg',
      'biodata': 'Saya adalah seorang mahasiswa di Universitas Islam Negeri Maulana Malik Ibrahim Malang',
    },
    {
      'name': 'Yoga Pratama Kusendi',
      'nim': '200605110084',
      'profile': 'yoga.jpg',
      'biodata': 'Saya adalah seorang mahasiswa di Universitas Islam Negeri Maulana Malik Ibrahim Malang',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff242231),
        centerTitle: true,
        title: Text(
          'Member Profile',
          style: GoogleFonts.poppins(
            color: const Color(0xffE1E1E1),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xff242231),
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) => Card(
            color: const Color(0xff999999),
            elevation: 3.0,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage("assets/${members[index]['profile']}"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 50,
                width: 50,
              ),
              title: Text(members[index]['name']),
              subtitle: Text(members[index]['nim']),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
