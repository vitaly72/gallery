import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery/models/Photo.dart';
import 'package:gallery/services/RestApi.dart';
import 'package:gallery/widgets/PhotoListWidget.dart';
import 'package:http/http.dart' as http;

//Страница отображает список мини-фотографий с описанием
class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: RestApi.fetchPhoto(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotoListWidget(photo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
