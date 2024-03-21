import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mor_motivasyon/favoritPage.dart';
import 'package:mor_motivasyon/kategoriModel.dart';
import 'package:mor_motivasyon/kategori_cart.dart';
import 'package:mor_motivasyon/splashScreen.dart';
import 'package:page_transition/page_transition.dart';

const textFavoriBox = 'Boxfavori';
var textList = [
  {"id": 1, "kategori": "ktg1", "text": "text1"},
  {"id": 3, "kategori": "ktg2", "text": "text2"},
  {"id": 4, "kategori": "ktg2", "text": "text3"},
  {"id": 5, "kategori": "ktg2", "text": "text4"},
  {"id": 6, "kategori": "ktg3", "text": "text5"},
];
void main() async {
  /* Hive  init ve openBox */
  await Hive.initFlutter();
  await Hive.openBox(textFavoriBox);

  /* -------------------------------- */
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => SplashScreen(),
      '/home': (context) => MainPage(),
      '/favori': (context) => FavoritePage(),
      '/category': (context) => Categories(),

      // Add other routes for your app screens here
    },
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  /*   -------------------------------------  TANIMLAMALARR değerler -------------------------------------  */
  var currentIndex = 0;

  String themaName = "tema";
  String selectedCategory = '';

  bool animate = true;

  var fontName = [
    'ABeeZee',
    'Acme',
    'Advent Pro',
    'Alata',
    'Allan',
    'Amatic SC',
    'Anton',
    'Archivo',
    'Arvo',
    'Pacifico'
  ];

  late Future<MyData> futureData;
  /* Animasyon controller */
  late final AnimationController _animationController;
  late AnimationController controller;

  /* --------------------------     ------------------------------------------------ */

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          print("Animasyon bittiiiiiiii iiiiiiiiii iiiiiiiiiiiiiii iiiii");
          changeText();
          controller.reverse();

          _animationController
            ..duration = Duration(seconds: 5)
            ..reverse();
        });
      }
    });
    futureData = loadMyData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
/*  ------------------------------------- FONKSİYONLAR ------------------------------------- */

  /*  ------------------------- animasyonu oynatmamızı sağlayan fonksiyon------------------- */
  _handlePlayAnimationReverse() {
    // animasyon bitmiş mi diye kontrol ediyoruz

    // eğer bitmişse ve tekrardan butona basmışsak animasyonu tersten oynatıyoruz
    _animationController
      ..duration = Duration(seconds: 3)
      ..reverse();
    print("reverse");
  }

  _handlePlayAnimationForward() {
    // eğer bitmemişse ve butona basmışsak animasyonu ileri doğru oynatıyoruz
    _animationController
      ..duration = Duration(seconds: 3)
      ..forward();
    print("forward");
  }

  /* ----------------------------- ------------------------------------- ------------------------------------- */

/* Anasayfadaki texti değiştirme fonksiyonu bu fonksiyon mainpage 3 icon da olan async icon butonu tıklandığında gerçekleşecek */
  changeText() {
    animate = !animate;
    setState(() {
      if (currentIndex < textList.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 1;
      }
    });
  }

  /* -----------------------------  ------------------------------------- -------------------------------------*/

  /* Favori Iconı Tıklaıdğımızda Gerçekleşecek olan olayların Fonksiyonu (Hive veri ekleme silme) */
  Widget getIcon(int index) {
    var box = Hive.box(textFavoriBox);
    if (box.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress(int index) {
    var box = Hive.box(textFavoriBox);

    if (box.containsKey(currentIndex)) {
      box.delete(currentIndex);
      print("delete:${currentIndex}: \n ${textList[currentIndex]}");

      return;
    }
    box.put(index, textList[currentIndex]);
    print("put :${currentIndex}: \n ${textList[currentIndex]}");
  }
/* ------------------------------------- ------------------------------------- ------------------------------------- ------------------------------------- ----------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    /* Cihazın Sizenı Almak İçin olan Kod */
    final screenSize = MediaQuery.of(context).size;
    /* ------------------ */

    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/pexels-mark-yu-18178746.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              /* ANASAYFANIN ÜSTÜNE GELEN SİYAH TRANSPARAN YAZININ DAHA İYİ OKUNMASI İÇİN */

              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    /* ANASAYFA ELEMNTLERİN OLDUĞU KISIM */
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Profil Photo and İCONLAR */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /* PROFİL PHOTO AND YAZI */
                            profilPhotoandText(),
                            /* Twoıcon üçgen ve menü */
                            twoIcon(context)
                          ],
                        ),
                        /* Main page motivasyon Textt */
                        mainPageMotivasyonTextAndTarih(),
                        /* MOTİVASYON TEXT DEĞİŞTİRME ANİMASYON  */
                        Container(
                          width: 300,
                          height: 300,
                          child: GestureDetector(
                            onLongPressUp: () {
                              _handlePlayAnimationReverse();
                              controller.reverse();
                            },
                            onLongPress: () {
                              _handlePlayAnimationForward();
                              controller.forward();
                            },
                            child: Lottie.asset(
                              "assets/img/olumlama.json",
                              controller: _animationController,
                            ),
                          ),
                        ),
                        /* MAIN PAGE 3 ICON */
                        threeIcon()
                      ],
                    ),
                  ),
                ),
              ),

              /* Ana kapama işaretleri silme */
            );
          },
        ),
      ),
    );
  }

  Center mainPageMotivasyonTextAndTarih() {
    return Center(
      child: FadeOut(
        manualTrigger: true,
        duration: Duration(seconds: 1),
        animate: animate,
        controller: (animationCtrl) => controller = animationCtrl,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '05 ',
            style: GoogleFonts.aboreto(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: '\n MAR 2024',
              ),
              TextSpan(text: "\n ${textList[currentIndex]["text"]}"),
            ],
          ),
        ),
      ),
    );
  }

  Row threeIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              changeText();
            });
          },
          icon: ImageIcon(
            AssetImage("assets/img/sync (1).png"),
            color: Colors.white,
          ),
        ),
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  print("test");
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: FavoritePage(),
                    ),
                  );
                  setState(() {
                    getIcon(currentIndex);
                  });
                  print("deneme");
                  /* getIcon(currentIndex); */
                },
                icon: Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    onFavoritePress(currentIndex);
                  });
                },
                icon: getIcon(currentIndex),
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }

  Container profilPhotoandText() {
    return Container(
      width: 200,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /* profil photo */
          InkWell(
            onTap: () {},
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/img/pp.jpeg"), radius: 25),
          ),
          /* Mutlu günler text */
          RichText(
            text: TextSpan(
                text: "Mutlu Günler",
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(text: "\n Sıdıka", style: TextStyle(fontSize: 20)),
                ]),
          ),
        ],
      ),
    );
  }

  Container twoIcon(BuildContext context) {
    return Container(
      child: Row(
        children: [
          /* Tema ICON */
          IconButton(
            onPressed: () {
              print("tıklandııı");
              /* ÜÇGEN TIKLANDIĞINDA AÇILACAK SHOWMODAL BOTTOMSHEETMODAL */
              sMB(context);
            },
            icon: ImageIcon(
              AssetImage("assets/img/Group 38.png"),
              color: Colors.white,
            ),
          ),
          /* Menu icon tıklandığında kategori sayfasını açarsın */
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Categories(),
                  ),
                );
                if (result != null) {
                  setState(() {
                    selectedCategory = result;
                  });
                }
                setState(() {
                  result;
                  print("deneme ${result}");
                });
              },
              icon: ImageIcon(
                AssetImage(
                  "assets/img/Group 37.png",
                ),
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Future<dynamic> sMB(BuildContext context) {
    return showModalBottomSheet(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        color: Colors.white,
                      ),
                      Center(
                        child: Text(
                          "Ayarlar",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Kilitleri Aç"),
                      ),
                    ],
                  ),
                ),
              ),
              /* Tema Nameleri  ve tema butonları tıklandığında tema name değişir ve ona göre tasarım oluşur*/
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        debugPrint("TEMALAR");
                        themaName == "";

                        setState(() {
                          themaName = "tema";
                        });
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
                        themaName == "";

                        setState(() {
                          themaName = "canli";
                        });
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
                        themaName == "";
                        debugPrint("SESLER");
                        setState(() {
                          themaName = "sesler";
                        });
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
                        themaName == "";

                        setState(() {
                          themaName = "font";
                        });
                      },
                      child: const Text(
                        'Fontlar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              /* Hangi tema namedeyse ona göre tasarım gelir ona göre seçenekler gelen kod */
              FutureBuilder(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        /* Item Count temaname göre item count length*/
                        itemCount: themaName == "tema"
                            ? snapshot.data!.tema.length
                            : themaName == "canli"
                                ? snapshot.data!.canli.length
                                : themaName == "sesler"
                                    ? snapshot.data!.sesler.length
                                    : themaName == "font"
                                        ? fontName.length
                                        : 0, // Burada 0 olarak setlenmiştir, değişebilir.
                        /* -------------- ---------------- */

                        itemBuilder: (context, index) {
                          /* tema naemi tema veya canlıysa gelen seçenekler */
                          if (themaName == "tema" || themaName == "canli") {
                            MyTheme tema = snapshot.data!.tema[index];
                            MyTheme canli = snapshot.data!.canli[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          themaName == "tema"
                                              ? tema.imgUrl
                                              : canli.imgUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 175,
                                    left: 25,
                                    child: Center(
                                      child: Text(
                                        themaName == "tema"
                                            ? tema.photoAciklama
                                            : canli.photoAciklama,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                            /* ----------------------------- */
                          } else if (themaName == "sesler") {
                            MyTheme sesler = snapshot.data!.sesler[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          AssetImage(sesler.imgUrl),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${sesler.name}',
                                    style:
                                        GoogleFonts.lato(color: Colors.white),
                                  ),
                                )
                              ],
                            );
                          } else if (themaName == "font") {
                            return Center(
                              child: Container(
                                width: 120,
                                child: ListTile(
                                  title: index >= 0 && index < fontName.length
                                      ? Text(
                                          fontName[index],
                                          style: GoogleFonts.getFont(
                                            fontName[index],
                                            textStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          "Invalid Index: $index for fontName list",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            );
                          } else {
                            // Diğer durumlar için gerekli kontrolleri ekleyin
                            return Container();
                          }
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
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
