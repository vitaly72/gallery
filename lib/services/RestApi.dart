import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gallery/models/Photo.dart';
import 'package:http/http.dart' as http;

class RestApi {
  // Функция вычисления для запуска parsePhotos в отдельном потоке.
  static Future<List<Photo>> fetchPhoto(http.Client client) async {
    final String api =
        'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0&per_page=100';

    final response = await client.get(api);

    return compute(parsePhotos, response.body);
  }

// Функция, которая преобразует body ответа в List <Photo>
  static List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
