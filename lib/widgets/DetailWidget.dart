import 'package:flutter/material.dart';

//Виджет для страницы DetailPage, которая отображает одну фотографию с максимальной площадью
class DetailWidget extends StatefulWidget {
  final String color;
  final String urlPhoto;

  DetailWidget({Key key, @required this.color, @required this.urlPhoto})
      : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor(widget.color),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(widget.urlPhoto),
              ],
            ),
          ),
        ));
  }
}

//Класс для форматирование значения цвета(строки) из #ffffff в 0xffffffff(int)
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
