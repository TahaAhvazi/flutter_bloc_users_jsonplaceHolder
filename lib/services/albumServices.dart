// To parse this JSON data, do
//
//     final albums = albumsFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<Albums> albumsFromJson(String str) =>
    List<Albums>.from(json.decode(str).map((x) => Albums.fromJson(x)));

String albumsToJson(List<Albums> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Albums {
  Albums({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

class getAlbums {
  Future<List<Albums>> getFetchedAlbums([int startIndex = 0]) async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final myAlbums = albumsFromJson(response.body);
    return myAlbums;
  }
}
