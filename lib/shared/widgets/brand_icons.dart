import 'package:flutter/material.dart';

class GithubBrandIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GithubBrandIcon({
    super.key,
    this.size = 22,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.textTheme.bodyLarge?.color ?? Colors.white;

    return CustomPaint(
      size: Size(size, size),
      painter: _GithubPainter(iconColor),
    );
  }
}

class _GithubPainter extends CustomPainter {
  final Color color;
  _GithubPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scaleX = size.width / 24.0;
    final scaleY = size.height / 24.0;
    canvas.scale(scaleX, scaleY);

    final path = Path();
    path.moveTo(12, 0.3);
    path.cubicTo(5.37, 0.3, 0, 5.67, 0, 12.3);
    path.cubicTo(0, 17.6, 3.438, 22.097, 8.205, 23.685);
    path.cubicTo(8.805, 23.795, 9.025, 23.425, 9.025, 23.105);
    path.cubicTo(9.025, 22.815, 9.015, 22.055, 9.01, 21.035);
    path.cubicTo(5.675, 21.76, 4.97, 19.425, 4.97, 19.425);
    path.cubicTo(4.425, 18.04, 3.64, 17.67, 3.64, 17.67);
    path.cubicTo(2.55, 16.925, 3.72, 16.94, 3.72, 16.94);
    path.cubicTo(4.925, 17.025, 5.56, 18.18, 5.56, 18.18);
    path.cubicTo(6.63, 20.01, 8.365, 19.48, 9.05, 19.175);
    path.cubicTo(9.16, 18.4, 9.47, 17.87, 9.81, 17.57);
    path.cubicTo(7.145, 17.27, 4.34, 16.235, 4.34, 11.635);
    path.cubicTo(4.34, 10.325, 4.81, 9.255, 5.575, 8.415);
    path.cubicTo(5.45, 8.115, 5.04, 6.895, 5.69, 5.245);
    path.cubicTo(5.69, 5.245, 6.7, 4.925, 8.995, 6.475);
    path.cubicTo(9.955, 6.21, 10.985, 6.075, 12, 6.07);
    path.cubicTo(13.015, 6.075, 14.045, 6.21, 15.01, 6.475);
    path.cubicTo(17.305, 4.925, 18.31, 5.245, 18.31, 5.245);
    path.cubicTo(18.96, 6.895, 18.55, 8.115, 18.425, 8.415);
    path.cubicTo(19.195, 9.255, 19.66, 10.325, 19.66, 11.635);
    path.cubicTo(19.66, 16.245, 16.85, 17.265, 14.175, 17.56);
    path.cubicTo(14.605, 17.93, 14.99, 18.665, 14.99, 19.79);
    path.cubicTo(14.99, 21.4, 14.975, 22.7, 14.975, 23.105);
    path.cubicTo(14.975, 23.43, 15.19, 23.805, 15.8, 23.685);
    path.cubicTo(20.56, 22.09, 24, 17.595, 24, 12.3);
    path.cubicTo(24, 5.67, 18.63, 0.3, 12, 0.3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinkedinBrandIcon extends StatelessWidget {
  final double size;
  final Color color;

  const LinkedinBrandIcon({
    super.key,
    this.size = 22,
    this.color = const Color(0xFF0A66C2),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _LinkedinPainter(color),
    );
  }
}

class _LinkedinPainter extends CustomPainter {
  final Color color;
  _LinkedinPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scaleX = size.width / 24.0;
    final scaleY = size.height / 24.0;
    canvas.scale(scaleX, scaleY);

    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(0, 0, 24, 24), const Radius.circular(4)));

    final textPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
    canvas.drawCircle(const Offset(5.5, 6), 1.8, textPaint);
    canvas.drawRect(const Rect.fromLTWH(4, 9.5, 3, 10.5), textPaint);
    canvas.drawRect(const Rect.fromLTWH(10, 9.5, 3, 10.5), textPaint);

    final nArch = Path();
    nArch.moveTo(13, 9.5);
    nArch.lineTo(17, 9.5);
    nArch.cubicTo(19, 9.5, 20, 11, 20, 13);
    nArch.lineTo(20, 20);
    nArch.lineTo(17, 20);
    nArch.lineTo(17, 13.5);
    nArch.cubicTo(17, 12.5, 16.5, 12, 15.5, 12);
    nArch.cubicTo(14.5, 12, 14, 12.5, 14, 13.5);
    nArch.lineTo(14, 20);
    nArch.lineTo(11, 20);
    nArch.close();

    canvas.drawPath(nArch, textPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WhatsappBrandIcon extends StatelessWidget {
  final double size;
  final Color color;

  const WhatsappBrandIcon({
    super.key,
    this.size = 22,
    this.color = const Color(0xFF25D366),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _WhatsappPainter(color),
    );
  }
}

class _WhatsappPainter extends CustomPainter {
  final Color color;
  _WhatsappPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scaleX = size.width / 24.0;
    final scaleY = size.height / 24.0;
    canvas.scale(scaleX, scaleY);

    final path = Path();
    path.addOval(const Rect.fromLTWH(2, 2, 20, 20));

    final tail = Path();
    tail.moveTo(4, 17);
    tail.lineTo(1, 23);
    tail.lineTo(8, 21);
    tail.close();

    final phonePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
    canvas.drawPath(tail, paint);

    final phone = Path();
    phone.moveTo(8.5, 7.5);
    phone.cubicTo(8, 7.5, 7.5, 8, 7.5, 8.5);
    phone.cubicTo(7.5, 13, 11, 16.5, 15.5, 16.5);
    phone.cubicTo(16, 16.5, 16.5, 16, 16.5, 15.5);
    phone.lineTo(15, 13);
    phone.lineTo(13.5, 13.5);
    phone.cubicTo(11.5, 12.5, 10.5, 11.5, 9.5, 9.5);
    phone.lineTo(10, 8);
    phone.close();

    canvas.drawPath(phone, phonePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
