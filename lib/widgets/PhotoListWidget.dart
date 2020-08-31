import 'package:flutter/cupertino.dart';
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(
                      title: title,
                      color: photo[index].color,
                      urlPhoto: photo[index].urls.regular);
                }));
              },
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  photo[index].urls.small,
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(3),
              ));
        });
  }
}
