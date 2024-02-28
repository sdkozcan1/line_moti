import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mor_motivasyon/main.dart';
import 'package:page_transition/page_transition.dart';

/* Kategori model sınıfı */

class Categories {
  String imgeUrl;
  String name;
  String aciklama;

  Categories(
      {required this.imgeUrl, required this.name, required this.aciklama});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      name: json['name'],
      imgeUrl: json['imgUrl'],
      aciklama: json['aciklama'],
    );
  }
}
/* .............................. */

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  /* Kategori img,name,açıklama json formatı */
  final String jsonString =
      '[{"imgUrl": "assets/img/pexels-adedamola-adetoyi-17879308.jpg", "name": "Genel", "aciklama": "Açıklama"}, '
      '{"imgUrl": "assets/img/pexels-natalia-yamboglo-15868390.jpg", "name": "Aşk ", "aciklama": "Açıklama"}, '
      '{"imgUrl": "assets/img/pexels-adedamola-adetoyi-17879308.jpg", "name": "Genel", "aciklama":" Açıklama"}]';
  /* .............................. */

  @override
  Widget build(BuildContext context) {
    /* jsonı liste çevirme kodu */
    List<Categories> categories = (jsonDecode(jsonString) as List)
        .map((data) => Categories.fromJson(data))
        .toList();
    /* .............................. */
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 246, 242, 242),
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MainPage(),
                        ),
                      );
                    });
                  },
                  icon: Icon(Icons.close),
                ),
                Text(
                  "Kategoriler",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 26),
                ),
                /* cart */
                Container(
                  width: screenSize.width,
                  height: 600,
                  child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            height: 125,
                            width: 100,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              '${categories[index].imgeUrl}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                '${categories[index].name}',
                                                style: GoogleFonts.lato(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "${categories[index].aciklama}",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.check_circle_rounded)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: screenSize.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: <Color>[
                          Color(0xffe5cffc),
                          Color(0xffdec0f1),
                          Color(0xffb79ced),
                          Color(0xff957fef),
                          Color(0xff7161ef),
                          Color(0xff614cae),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Kaydet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
