import 'dart:ui';

import 'package:flame/animation.dart' as fAnimation;
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testGame/screens/baseTimedWidget.dart';
import 'package:testGame/screens/game/bullet.dart';

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

    shotCreator = Timer(0.2, repeat: true, callback: () {
      shots.add(Bullet(color: _orange)
        ..position = Rect.fromLTWH(_player.x + 15, _player.y, 20, 20));
    });
  }

  @override
  resize(Size size) {
    _player.width = size.width * 0.25;
    _player.height = size.height * 0.25;
  }

  @override
  render(Canvas canvas) {
    _player.render(canvas);
    canvas.restore();
  }

  @override
  update(double t) {
    _player.update(t);

    shots.forEach((e) {
      e.position = e.position.translate(0, 10 * t);
    });
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    print('DRAG');

    shotCreator.start();
    // _speed = - _maxSpeed * 2;
    _player.x += details.delta.dx;
    _player.y += details.delta.dy;
  }

  void _updateSpeed(double t) {
    _speed += t * _maxSpeed * 5;
    if (_speed > _maxSpeed) _speed = _maxSpeed;
  }
}
