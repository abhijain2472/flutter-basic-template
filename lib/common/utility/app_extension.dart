import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension dateConversion on DateTime {
  String get toAPIString {
    return DateFormat('yyyy-MM-dd HH:mm').format(this);
  }

  String get toEventFormattedTime {
    return DateFormat('MMM dd yyyy, hh:mm a').format(this);
  }


}

extension stringConversion on String {


  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
  DateTime get eventDateFromResponse {
    return DateFormat('yyyy-MM-dd HH:mm').parse(this);
  }

  DateTime get getDateTimeFromAPIString {
    if (this.trim().isNotEmpty) {
      return DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(
        this,
        true,
      );
    } else {
      return DateTime.now();
    }
  }

  Color get fromHex {
    String mainCode = this.substring(1, 7);
    String data = "0xff" + mainCode;
    return Color(
      int.parse(
        data.toString(),
      ),
    );
  }


}

