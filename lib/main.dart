import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mor_motivasyon/kategori_cart.dart';
import 'package:mor_motivasyon/profile-page.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final temaUrl = [
    "assets/img/pexels-egil-sjøholt-1906658.jpg",
    "assets/img/pexels-jeremy-bishop-20145983.jpg",
    "assets/img/pexels-ben-mack-5326925.jpg",
    "assets/img/pexels-adedamola-adetoyi-17879308.jpg",
  ];

  final canliUrl = [
    "assets/img/pexels-natalia-yamboglo-15868390.jpg",
    "assets/img/pexels-leah-newhouse-20204362.jpg",
    "assets/img/pexels-natalia-yamboglo-15868390.jpg",
    "assets/img/pexels-leah-newhouse-20204362.jpg",
    "assets/img/pexels-natalia-yamboglo-15868390.jpg",
    "assets/img/pexels-leah-newhouse-20204362.jpg",
  ];
  final sesler = [
    "assets/img/orange-circle-1462825_640.png",
    "assets/img/orange-circle-1462825_640.png",
  ];
  final fontPhoto = [
    "assets/img/Ruslan Displayy.png",
    "assets/img/PIEDRA (1).png",
  ];
  String name = "temaUrl";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS:
              PageTransition(type: PageTransitionType.fade, child: Container())
                  .matchingBuilder,
        }),
      ),
      home: Scaffold(
        body: Builder(builder: (context) {
          return Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/pexels-ben-mack-5326925.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                //you can change opacity with color here(I used black) for background.
                decoration:
                    BoxDecoration(color: Colors.black87.withOpacity(0.5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* PROFİL PHOTOS */
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* MUTLU GÜNLER NAME */
                              Container(
                                width: 200,
                                height: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              child: ProfilePage(),
                                            ),
                                          );
                                        });
                                        debugPrint("tıklandı ppp");
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/img/pp.jpeg"),
                                        radius: 25,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Mutlu Günler",
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                          children: [
                                            TextSpan(
                                              text: "\n Sıdıka",
                                              style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              /* 2 İKON */
                              Container(
                                height: 100,
                                width: 100,
                                child: Row(
                                  children: [
                                    /* ÜÇGEN İCON */
                                    IconButton(
                                      onPressed: () {
                                        /* SHOW MODAL KATEGORİLEİRN OLDUĞU BÖLÜM SESLER TEMALAR FONTLAR... */
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                width: 400,
                                                height: 400,
                                                color: Colors.black,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down_outlined),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Ayarlar",
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        26,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                    "Kilitleri Aç"))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                            ),
                                                            onPressed: () {
                                                              debugPrint(
                                                                  "TEMALAR");
                                                              setState(() {
                                                                name =
                                                                    "temaUrl";
                                                              });
                                                            },
                                                            child: const Text(
                                                              'Temalar',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                name =
                                                                    "canliUrl";
                                                              });
                                                              debugPrint(
                                                                  "Canlı");
                                                            },
                                                            child: const Text(
                                                              'Canlı',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                            ),
                                                            onPressed: () {
                                                              debugPrint(
                                                                  "SESLER");
                                                              setState(() {
                                                                name = "sesler";
                                                              });
                                                            },
                                                            child: const Text(
                                                              'Sesler',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                name =
                                                                    "fontphoto";
                                                              });
                                                            },
                                                            child: const Text(
                                                              'Fontlar',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 250,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8),
                                                          itemCount: name ==
                                                                  "temaUrl"
                                                              ? temaUrl.length
                                                              : name ==
                                                                      "canliUrl"
                                                                  ? canliUrl
                                                                      .length
                                                                  : name ==
                                                                          "sesler"
                                                                      ? sesler
                                                                          .length
                                                                      : fontPhoto
                                                                          .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return themeee(
                                                                index);
                                                            ;
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.eject_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    /* MENU */
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: Kategori(),
                                            ),
                                          );
                                        });
                                      },
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        /* TEXT TARİH */
                        Column(
                          children: [
                            Text(
                              "14",
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 30),
                            ),
                            Text("ŞUB 2024",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 20)),
                            Text(
                              "İlişkim güçleniyor,derinleşiyor ve her gün daha da sağlam hale geliyor!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        /* İCONS */
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.cyclone),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.open_in_new,
                                      ),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Padding themeee(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: name == "temaUrl" || name == "canliUrl"
          ? Container(
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                // ignore: unnecessary_string_interpolations
                image: AssetImage(name == "temaUrl"
                    ? '${temaUrl[index]}'
                    : '${canliUrl[index]}'),
                fit: BoxFit.cover,
              )),
            )
          : name == "sesler"
              ? Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('${sesler[index]}'),
                  ),
                )
              : Container(
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // ignore: unnecessary_string_interpolations
                          image: AssetImage('${fontPhoto[index]}'),
                          fit: BoxFit.fitWidth)),
                ),
    );
  }
}
