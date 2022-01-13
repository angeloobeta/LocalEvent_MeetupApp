import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';

class EventDetailBackground extends StatelessWidget {
  const EventDetailBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final event = Provider.of<Event>(context);

    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: Clipper(),
        child: Image.asset(
          event.imagePath,
          fit: BoxFit.cover,
          width: screenWidth,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.luminosity,
          height: screenHeight * .5,
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, 0);
    Offset curveEndPoint = Offset(size.width, size.height * .95);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy + 20);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.90,
        curveEndPoint.dx - 85, curveEndPoint.dy + 20);
    path.quadraticBezierTo(curveEndPoint.dx - 40, curveEndPoint.dy + 20,
        curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
