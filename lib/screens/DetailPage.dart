import 'package:flutter/material.dart';
import 'package:gallery/widgets/DetailWidget.dart';

//Страница отображает одну фотографию с максимальной площадью
class DetailPage extends StatefulWidget {
  final String title;
  final String color;
  final String urlPhoto;

  const DetailPage({Key key, @required this.title, @required this.color, @required this.urlPhoto}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Gallery")
      ),
      body: DetailWidget(
          color: widget.color,
          urlPhoto: widget.urlPhoto
      ),
    );
  }
}