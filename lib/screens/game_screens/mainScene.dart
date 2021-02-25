import 'dart:ui';

import 'package:testGame/screens/baseTimedWidget.dart';
import 'package:testGame/screens/game/player.dart';
import 'package:testGame/screens/utils/background.dart';
import 'package:flutter/gestures.dart';

class MainScene extends BaseTimedWidget {
  Background _background;
  BaseTimedWidget _player;
  // Bullet _bullet;

  MainScene () {
    _background = new Background('9.png');
    _player = Player();
    // _bullet = Bullet();
  }

  @override
  resize(Size size) {
    _background?.resize(size);
    _player?.resize(size);
    // _bullet?.resize(size);
  }

  @override
  render(Canvas canvas) {
    _background?.render(canvas);
    _player?.render(canvas);
    // _bullet?.render(canvas);
  }

  @override
  update(double t) {
    _background?.update();
    _player?.update(t);
    // _bullet?.update(t);
  }

  @override
  onTapDown(TapDownDetails details) {
    _player.onTapDown(details);
  }

  @override
  onPanUpdate(DragUpdateDetails details) {
    _player.onPanUpdate(details);
  }
}