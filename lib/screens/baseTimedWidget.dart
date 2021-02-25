import 'package:flutter/cupertino.dart';

abstract class BaseTimedWidget {
  resize(Size size) {}

  render(Canvas canvas) {}

  update(double t) {}

  onPanUpdate(DragUpdateDetails details) {}

  onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {}

  onTapDown(TapDownDetails details) {}

  onPanDown(DragDownDetails details) {}
}
