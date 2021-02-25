import 'package:testGame/screens/baseTimedWidget.dart';
import 'dart:ui';

class Bullet extends BaseTimedWidget {
  final Paint color;
  Rect position;

  Bullet({this.color}) {

  }

  @override
  void resize(Size size) {}

  @override
  void render(Canvas canvas) {
    canvas.drawRect(position, this.color);
  }

  @override
  void update(double t) {}
}


class GameObject {
  final Paint color;
  Rect position;

  GameObject({this.color});

  void render(Canvas canvas) {
    canvas.drawRect(position, this.color);
  }
}