import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/proxy_box.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;
  const HomePageBackground({Key? key, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: screenHeight * .5,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * .8);
    Offset curveEndPoint = Offset(size.width, size.height * .8);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width * .5, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
