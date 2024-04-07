 import 'package:flutter/material.dart';

class CurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Điểm bắt đầu ở góc dưới bên trái
    path.lineTo(0, size.height - 25);

    // Điểm điều khiển của đường cong đầu tiên
    final firstControlPoint = Offset(size.width / 5, size.height);
    // Điểm kết thúc của đường cong đầu tiên
    final firstEndPoint = Offset(size.width / 2, size.height - 20);
    // Vẽ đường cong từ điểm hiện tại đến điểm kết thúc, sử dụng firstControlPoint làm điểm điều khiển
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    // Điểm điều khiển của đường cong thứ hai
    final secondControlPoint = Offset(size.width * 3 / 4, size.height - 40);
    // Điểm kết thúc của đường cong thứ hai
    final secondEndPoint = Offset(size.width, size.height - 20);
    // Vẽ đường cong từ điểm hiện tại đến điểm kết thúc, sử dụng secondControlPoint làm điểm điều khiển
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    // Kết thúc đường vẽ ở góc dưới bên phải
    path.lineTo(size.width, 0);

    // Đóng path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

