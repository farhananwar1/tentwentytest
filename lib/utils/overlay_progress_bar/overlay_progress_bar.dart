import 'package:flutter/material.dart';
import 'package:tentwenty_test/utils/theme/color_const.dart';

class ProgressBar {
  OverlayEntry? _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    Overlay.of(context)!.insert(_progressOverlayEntry!);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry!.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Stack(
            children: <Widget>[
              Container(
                color: MyColors.bottomNavBarColor.withOpacity(0.5),
              ),
              Positioned(
                top: screenHeight(context) / 2,
                left: screenWidth(context) / 2.2,
                child: const CircularProgressIndicator(),
              )
            ],
          ));

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
