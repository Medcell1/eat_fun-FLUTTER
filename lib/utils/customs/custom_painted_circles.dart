import '../utils.dart';
class CustomCircles extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final firstCirclePaint = Paint()
      ..color = primaryColor.withOpacity(0.7)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    final secondCirclePaint = Paint()
      ..color = const Color(0xffF13A21).withOpacity(0.7)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.srcOver;

    final firstCircleCenter = Offset(
      size.width / 2.7,
      size.height / 12,
    );
    final secondCircleCenter = Offset(
      size.width / 2.5,
      size.height / 8,
    );

    final firstCircleRadius = size.width / 1.7;
    final secondCircleRadius = size.width / 1.6;

    canvas.drawCircle(firstCircleCenter, firstCircleRadius, firstCirclePaint);

    canvas.drawCircle(
        secondCircleCenter, secondCircleRadius, secondCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
