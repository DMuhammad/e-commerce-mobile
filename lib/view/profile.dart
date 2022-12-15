import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff242231),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                const ClipOval(),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Dzikri',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffE1E1E1),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '@dzikrimuhammad',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff504F5E),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String txt) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: GoogleFonts.poppins(
                color: const Color(0xff999999),
                fontSize: 13,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xffE1E1E1),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          decoration: const BoxDecoration(
            color: Color(0xff242231),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: GoogleFonts.poppins(
                  color: const Color(0xffE1E1E1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: menuItem('Edit Profile'),
              ),
              menuItem('Your Orders'),
              menuItem('Help'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: GoogleFonts.poppins(
                  color: const Color(0xffE1E1E1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              menuItem('Privacy & Policy'),
              menuItem('Terms & Conditions'),
              menuItem('Rate App'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
