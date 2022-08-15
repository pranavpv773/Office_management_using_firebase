import 'dart:io';

import 'package:flutter/widgets.dart';

class ImageServices with ChangeNotifier {
  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }
}
