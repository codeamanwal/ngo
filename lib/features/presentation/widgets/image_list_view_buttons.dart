import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ngo/features/data/model/picture.dart';

class ImageListViewWithButtons extends StatefulWidget {
  final List<PictureModel>? imageUrls;
  final List<File>? imageFiles;
  final bool isFile;
  final double width;
  final double height;
  final bool isButtonVisible;

  const ImageListViewWithButtons(
      {Key? key,
      this.imageUrls,
      this.imageFiles,
      required this.isFile,
      required this.width,
      required this.height,
      required this.isButtonVisible})
      : super(key: key);

  @override
  State<ImageListViewWithButtons> createState() =>
      _ImageListViewWithButtonsState();
}

class _ImageListViewWithButtonsState extends State<ImageListViewWithButtons> {
  int _currentIndex = 0;
  bool _buttonClicked = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _onRightButtonClick();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _onLeftButtonClick() {
    if (_buttonClicked) {
      _timer.cancel();
    }
    setState(() {
      if (widget.isFile) {
        _currentIndex = (_currentIndex - 1) % widget.imageFiles!.length;
      } else {
        _currentIndex = (_currentIndex - 1) % widget.imageUrls!.length;
      }
    });
  }

  void _onRightButtonClick() {
    if (_buttonClicked) {
      _timer.cancel();
    }
    setState(() {
      if (widget.isFile) {
        _currentIndex = (_currentIndex + 1) % widget.imageFiles!.length;
      } else {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls!.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFile ? fromFiles(context) : fromUrl(context);
  }

  Widget fromUrl(BuildContext context) {
    if (widget.imageUrls!.isNotEmpty) {
      return Row(
        children: [
          if (widget.isButtonVisible)
            Expanded(
              flex: 2,
              child: IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () async {
                  setState(() {
                    _buttonClicked = true;
                  });
                  _onLeftButtonClick();
                },
              ),
            ),
          Expanded(
            flex: 8,
            child: Image.network(
              widget.imageUrls![_currentIndex].url!,
              width: widget.width,
              height: widget.height,
            ),
          ),
          if (widget.isButtonVisible)
            Expanded(
              flex: 2,
              child: IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () async {
                  setState(() {
                    _buttonClicked = true;
                  });
                  _onRightButtonClick();
                },
              ),
            ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget fromFiles(BuildContext context) {
    if (widget.imageFiles!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: _onLeftButtonClick,
          ),
          Image.file(
            widget.imageFiles![_currentIndex],
            width: widget.width,
            height: widget.height,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: _onRightButtonClick,
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
