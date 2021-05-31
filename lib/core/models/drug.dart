import 'dart:convert';

Drug drugFromJson(String str) => Drug.fromJson(json.decode(str));

String drugToJson(Drug data) => json.encode(data.toJson());

class Drug {
  Drug({
    this.id,
    this.name,
    this.image,
    this.dose,
    this.manufacturer,
    this.isFav,
  });

  String id;
  String name;
  String image;
  String dose;
  String manufacturer;
  bool isFav;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    dose: json["dose"],
    manufacturer: json["manufacturer"],
    isFav: json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "dose": dose,
    "manufacturer": manufacturer,
    "isFav": isFav,
  };
}