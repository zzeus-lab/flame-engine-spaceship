import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:testGame/screens/baseWidget.dart';


class Background extends BaseWidget {
  SpriteComponent _bgSprite; 

  Background(String src) {
    _bgSprite = SpriteComponent.fromSprite(0, 0, Sprite(src));
  }

  @override
  void render(Canvas canvas) {
    _bgSprite.render(canvas);
  }

  @override
  void update() {}

  @override
  void resize(Size size) {
    _bgSprite.width = size.width;
    _bgSprite.height = size.height;
  }
}
