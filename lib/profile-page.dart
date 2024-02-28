import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mor_motivasyon/main.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    setState(() {
                      setState(() {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: MainPage(),
                          ),
                        );
                      });
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Sıdıka ÖZCAN",
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "Mutlu Günler",
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/pp.jpeg"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/img/pexels-scott-webb-1029592.jpg",
                            ),
                            fit: BoxFit.cover)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Matra Premium'u Dene",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                "7-gün Ücretsiz",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.favorite_border),
                                Text(
                                  "Favorilerim",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.menu),
                                Text(
                                  "Kategoriler",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.eject_outlined),
                                Text(
                                  "Temalar",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.settings_outlined),
                                Text("Ayarlar",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border),
                    Text(
                      "Favorilerim",
                      style: GoogleFonts.lato(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.menu),
                    Text(
                      "Kategoriler",
                      style: GoogleFonts.lato(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.eject_outlined),
                    Text(
                      "Temalar",
                      style: GoogleFonts.lato(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    Text("Ayarlar", style: GoogleFonts.lato()),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ), */