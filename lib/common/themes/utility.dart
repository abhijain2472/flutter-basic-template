import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'app_colors.dart';
import 'context_global_method.dart';
import 'enums.dart';

/// utils class which contains all utility methods
class Utility {

  /// common print method for all page
  static void log(object) {
    // print("=========== AppLog Start =================");
    print(object.toString());
  }

  /// to change the status bar color white
  static statusBarColorWhiteBackGround() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.whiteColor, //Android
        statusBarBrightness:
            Brightness.light, // Dark == white status bar -- for IOS.
      ),
    );
  }

  /// to change the status bar color primary pink
  static statusBarColorPrimaryBackGround() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primary, //Android
        statusBarBrightness:
            Brightness.dark, // Dark == white status bar -- for IOS.
      ),
    );
  }

  /// to change the status bar color black
  static statusBarColorBlackBackGround() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.blackColor, //Android
        statusBarBrightness:
            Brightness.dark, // Dark == white status bar -- for IOS.
      ),
    );
  }

  static void showAppToast(String msg, {Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: length,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.blackColor,
      textColor: AppColors.whiteTextColor,
      fontSize: 16.0,
    );
  }


  /// for pick the image from gallery or camera
  static Future<File?> getImagesFromImagePicker(
      {ImageSource source = ImageSource.camera,
      bool allowCrop = false,
  }) async {
    late File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      // finalImage = allowCrop
      //     ? (await cropImage(
      //         imagePath: _image.path,
      //         allowOnlySquare: aspectRatioPresets.length == 1,
      //       ))!
      //     : _image;
    } else {
      print('No image selected.');
    }
    return _image;
  }

  static double formatReadableNumber(num number) {
    String num = number.toString();
    int len = num.length;
    String result = num;
    if (number >= 1099 && number < 1000000) {
      result = num.substring(0, len - 3) +
          '.' +
          num.substring(len - 3, 1 + (len - 3));
    } else if (number >= 1000000 && number < 1000000000) {
      result = num.substring(0, len - 6) +
          '.' +
          num.substring(len - 6, 1 + (len - 6));
    } else if (number > 1000000000) {
      result = num.substring(0, len - 9) +
          '.' +
          num.substring(len - 9, 1 + (len - 9));
    } else {
      result = num.toString();
    }
    return double.parse(result);
  }

  static String? getNumberSuffix(num number) {
    String? prefix;
    String num = number.toString();
    int len = num.length;
    if (number >= 1099 && number < 1000000) {
      prefix = 'k';
    } else if (number >= 1000000 && number < 1000000000) {
      prefix = 'm';
    } else if (number > 1000000000) {
      prefix = 'b';
    }
    return prefix;
  }

}
