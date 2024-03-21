/* Menü İconı tıkladığında açılan kategori sayfası */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mor_motivasyon/kategoriModel.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<MyData> futureData;

  @override
  void initState() {
    super.initState();
    futureData = loadMyData();
  }

  String kategoriNameCart = "";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 242, 242),
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context, "ktg2");
              });
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: Text(
            "KATEGORİLER",
            style: GoogleFonts.aboreto(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Container(
          color: Color.fromARGB(255, 246, 242, 242),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Kart */
              FutureBuilder(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 700,
                        width: screenSize.width,
                        child: ListView.builder(
                          itemCount: snapshot.data!.kategori.length,
                          itemBuilder: (BuildContext context, int index) {
                            MyTheme kategori = snapshot.data!.kategori[index];

                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                height: 125,
                                width: 100,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print("kategori tıklandı");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 125,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    '${kategori.imgUrl}'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      child: Text(
                                                        '${kategori.name}',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      "${kategori.aciklama}",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                                Icons.check_circle_rounded),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              /* -------------- */
              /* Kaydet butonu */
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
    );
  }
}
