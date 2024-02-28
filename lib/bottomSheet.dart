import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetT extends StatefulWidget {
  const BottomSheetT({super.key});

  @override
  State<BottomSheetT> createState() => _BottomSheetTState();
}

class _BottomSheetTState extends State<BottomSheetT> {
  final imgUrl = [
    "assets/img/pexels-adedamola-adetoyi-17879308.jpg",
    "assets/img/pexels-ben-mack-5326925.jpg",
    "assets/img/pexels-egil-sjøholt-1906658.jpg",
    "assets/img/pexels-jeremy-bishop-20145983.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
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
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      color: Colors.white,
                                    ),
                                    Center(
                                      child: Text(
                                        "Ayarlar",
                                        style: GoogleFonts.lato(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Kilitleri Aç"))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      debugPrint("TEMALAR");
                                    },
                                    child: const Text(
                                      'Temalar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      setState() {
                                        imgUrl.clear();
                                        debugPrint("${imgUrl.length}ß");
                                      }

                                      debugPrint("Canlı");
                                    },
                                    child: const Text(
                                      'Canlı',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      debugPrint("SESLER");
                                    },
                                    child: const Text(
                                      'Sesler',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      debugPrint("FONTLAR");
                                    },
                                    child: const Text(
                                      'Fontlar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(8),
                                  itemCount: imgUrl.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  '${imgUrl[index]}'),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    );
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
