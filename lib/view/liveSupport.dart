import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: const Color(0xff242231),
          centerTitle: true,
          title: Text(
            'Live Support',
            style: GoogleFonts.poppins(
              color: const Color(0xffE1E1E1),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xff242231),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 33),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIKI Toko',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xffE1E1E1),
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Good Night, This item is on ...',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff999999),
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )),
                          Text(
                            'Now',
                            style: GoogleFonts.poppins(
                              color: const Color(0xff999999),
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
