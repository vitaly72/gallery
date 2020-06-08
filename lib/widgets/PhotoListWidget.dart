import 'package:flutter/material.dart';
import 'package:gallery/models/Photo.dart';
import 'package:gallery/screens/DetailPage.dart';

//Виджет для страницы HomePage, которая отображает список мини-фотографий с описанием
class PhotoListWidget extends StatelessWidget {
  final List<Photo> photo;

  PhotoListWidget({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: photo.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          String title = photo[index].altDescription != null
              ? photo[index].altDescription
              : photo[index].description != null
              ? photo[index].description
              : 'image';

          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                // ignore: missing_return
                  builder: (context) {
                    return DetailPage(
                        title: title,
                        color: photo[index].color,
                        urlPhoto: photo[index].urls.regular);
                  }));
            },
            child: Card(
                child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.network(
                              photo[index].urls.small,
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                            height: 150),
                        Text(title),
                      ],
                    ))),
          );
        });
  }
}