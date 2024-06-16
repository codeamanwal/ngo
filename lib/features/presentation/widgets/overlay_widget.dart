import 'package:flutter/material.dart';

class OverlayWidget {
  OverlayEntry? _overlay;
  BuildContext context;
  OverlayState? _overlayState;
  OverlayWidget({required this.context}) {
    _overlayState = Overlay.of(context);
  }

  void show({required Widget widget}) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) =>
            ColoredBox(color: Colors.black.withOpacity(0.5), child: widget),
      );
      _overlayState!.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}
