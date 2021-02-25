import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:testGame/screens/baseTimedWidget.dart';
import 'package:testGame/screens/game_screens/mainScene.dart';
import 'package:flutter/gestures.dart';

ScreenManager screenManager = ScreenManager();

class ScreenManager extends Game with TapDetector, PanDetector {
  Function _fn;

  Size size = Size(0, 0);

  BaseTimedWidget _mainScreen;

  ScreenManager() {
    _fn = _init;
  }

  Future<void> _init(double t) async {
    _fn = _update;
    _mainScreen = new MainScene();

    Util flameUtils = Util();
    await flameUtils.fullScreen();
    await flameUtils.setOrientation(DeviceOrientation.portraitUp);
  }

  @override
  void render(Canvas canvas) {
    _mainScreen?.render(canvas);
  }

  @override
  void resize(Size size) {
    this.size = size;
    _mainScreen.resize(size);
  }

  @override
  void update(double t) {
    _fn(t);
  }

  void _update(double t) {
    _getActiveScreen()?.update(t);
  }

  void onPanDown(DragDownDetails details) {
    _getActiveScreen()?.onPanDown(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    _getActiveScreen()?.onPanUpdate(details);
  }

  void onPanStart(DragStartDetails details) {
    _getActiveScreen()?.onPanStart(details);
  }

  void onPanEnd(DragEndDetails details) {
    _getActiveScreen()?.onPanEnd(details);
  }

  void onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    _getActiveScreen()?.onLongPressMoveUpdate(details);
  }

  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details);
  }

  BaseTimedWidget _getActiveScreen() {
    return _mainScreen;
  }
}
