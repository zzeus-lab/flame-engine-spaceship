import 'dart:ui';

import 'package:flame/animation.dart' as fAnimation;
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testGame/screens/baseTimedWidget.dart';
import 'package:testGame/screens/game/bullet.dart';

import 'bullet.dart';

Paint _orange = Paint()..color = Colors.orange[800];

class Player extends BaseTimedWidget {
  AnimationComponent _player;

  double _speed;
  double _maxSpeed;

  List<Bullet> shots = [];

  Timer shotCreator;

  Player() {
    List<Sprite> sprites =
        [1, 2, 3, 4].map((e) => Sprite('player/$e.png')).toList();

    _player = AnimationComponent(
        0, 0, fAnimation.Animation.spriteList(sprites, stepTime: 0.1));

    shotCreator = Timer(0.1, repeat: true, callback: () {
      Bullet bullet = Bullet(color: _orange);
      bullet.position = Rect.fromLTWH(52, -10, 5, 20);
      shots.add(bullet);
    });
  }

  @override
  resize(Size size) {
    _player.width = size.width * 0.25;
    _player.height = size.height * 0.25;

    _player.x = (size.width / 2) - (_player.width / 2);
    _player.y = (size.height / 2) + (_player.height / 2);
  }

  @override
  render(Canvas canvas) {
    _player.render(canvas);

    shots.forEach((Bullet bullet) => {bullet.render(canvas)});
    canvas.restore();
  }

  @override
  update(double t) {
    shotCreator.update(t);
    _player.update(t);

    shots.forEach((e) {
      e.position = e.position.translate(0, -1500 * t);
    });
  }

  @override
  void onPanStart(DragStartDetails details) {
    shotCreator.start();
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    // _speed = - _maxSpeed * 2;
    _player.x += details.delta.dx;
    _player.y += details.delta.dy;
  }

  @override
  void onPanEnd(DragEndDetails details) {
    if (shotCreator.isRunning()) {
      shotCreator.pause();
    }
  }

  @override
  onPanDown(DragDownDetails details) {}

  void _updateSpeed(double t) {
    _speed += t * _maxSpeed * 5;
    if (_speed > _maxSpeed) _speed = _maxSpeed;
  }
}
