import 'package:flutter/cupertino.dart';

abstract class BaseWidget {
  resize(Size size) {}

  render(Canvas canvas) {}

  update() {}

  onTapDown(TapDownDetails details, Function fn) {}
}
