/* // To parse this JSON data, do
//
//     final kategoriModel = kategoriModelFromJson(jsonString);

import 'dart:convert';

KategoriModel kategoriModelFromJson(String str) =>
    KategoriModel.fromJson(json.decode(str));

String kategoriModelToJson(KategoriModel data) => json.encode(data.toJson());

class KategoriModel {
  final String imgUrl;
  final String name;
  final String aciklama;

  KategoriModel({
    required this.imgUrl,
    required this.name,
    required this.aciklama,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        imgUrl: json["imgUrl"],
        name: json["name"],
        aciklama: json["aciklama"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "name": name,
        "aciklama": aciklama,
      };
}
 */