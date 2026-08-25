import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    final files = await FilePicker.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    for (final file in files) {
      if (file.path != null) {
        images.add(File(file.path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return images;
}
