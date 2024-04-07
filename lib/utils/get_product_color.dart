import 'package:flutter/material.dart';

Color getColorFromString(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'grey':
      return Colors.grey;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'white':
      return Colors.white;
    // Thêm các màu khác tương ứng
    default:
      return Colors.black; // Mặc định màu đen nếu không khớp
  }
}