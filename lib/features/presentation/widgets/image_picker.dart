import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo/features/presentation/widgets/image_list_view_buttons.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key, required this.onImagesSelected})
      : super(key: key);
  final Function(List<File> imageFiles) onImagesSelected;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FilledButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white)),
            onPressed: () async {
              List<XFile>? picked = await _picker.pickMultiImage();
              setState(() {
                imageFiles = picked!.map((e) => File(e.path)).toList();
              });
              widget.onImagesSelected(imageFiles);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    "Pick Product Images",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            )),
        ImageListViewWithButtons(
          isFile: true,
          width: size.width * 0.6,
          height: size.height / 5,
          imageFiles: imageFiles,
          isButtonVisible: true,
        )
      ],
    );
  }
}
