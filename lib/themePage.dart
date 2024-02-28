import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final imgUrl = [
    "assets/img/pexels-adedamola-adetoyi-17879308.jpg",
    "assets/img/pexels-ben-mack-5326925.jpg",
    "assets/img/pexels-egil-sjøholt-1906658.jpg",
    "assets/img/pexels-jeremy-bishop-20145983.jpg",
  ];
  final seslerImgUrl = [
    "assets/img/pexels-adedamola-adetoyi-17879308.jpg",
    "assets/img/pexels-ben-mack-5326925.jpg",
    "assets/img/pexels-egil-sjøholt-1906658.jpg",
    "assets/img/pexels-jeremy-bishop-20145983.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Temalar"),
            Row(
              children: [
                TextButton(onPressed: () {}, child: Text("Hareketsiz")),
                TextButton(onPressed: () {}, child: Text("Canlı")),
              ],
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: imgUrl.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('${imgUrl[index]}'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  }),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: seslerImgUrl.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('${seslerImgUrl[index]}'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
