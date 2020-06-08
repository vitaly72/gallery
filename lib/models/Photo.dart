import 'package:gallery/models/Urls.dart';

//Модель для изображений
class Photo {
  final String id;
  final String description;
  final String altDescription;
  final String color;
  final Urls urls;

  Photo({this.id, this.description, this.altDescription, this.color, this.urls});

  //Фабричный метод парсит даные в формате JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as String,
      description: json['description'] as String,
      altDescription: json['alt_description'] as String,
      color: json['color'] as String,
      urls: json['urls'] != null ? new Urls.fromJson(json['urls']) : null,
    );
  }
}