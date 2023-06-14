
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';



const kTileHeight = 50.0;

const completeColor = Colors.deepOrange;
//const inProgressColor = Color(0xff5ec792);
const inProgressColor = Colors.deepOrange;
const todoColor = Color(0xffd1d2d7);

class ProgressBar extends StatefulWidget {
  ProgressBar({Key? key,required this.processindex}) : super(key: key);
  final int processindex;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}
class _ProgressBarState extends State<ProgressBar> {

  Color getColor(int index) {
    if (index == widget.processindex) {
      return inProgressColor;
    } else if (index < widget.processindex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 30.0,

            //LINE THICKNESS
            thickness: 3.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
          MediaQuery.of(context).size.width / _processes.length,

          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(
                _processes[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: getColor(index),
                  fontSize: 13,
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index == widget.processindex) {
              color = inProgressColor;
              child = Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,

                  //CHECK ICON SIZE
                  size: 20.0,
                ),
              );
            } else if (index < widget.processindex) {
              color = completeColor;
              child = Icon(
                Icons.check,
                color: Colors.white,

                //CHECK ICON SIZE
                size: 20.0,
              );
            } else {
              color = todoColor;
            }

            if (index <= widget.processindex) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(30.0, 30.0),
                    painter: _BezierPainter(
                      color: color,
                      drawStart: index > 0,
                      drawEnd: index < widget.processindex,
                    ),
                  ),
                  DotIndicator(
                    //CIRCLE SIZE WAS 30
                    size: 30.0,
                    color: color,
                    child: child,
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(15.0, 15.0),
                    painter: _BezierPainter(
                      color: color,
                      drawEnd: index < _processes.length - 1,
                    ),
                  ),
                  OutlinedDotIndicator(
                    borderWidth: 4.0,
                    color: color,
                  ),
                ],
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == widget.processindex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)!
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: _processes.length,
        ),
      ),

    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Choose Service',
  'Appointment',
  'Summary',
  'Payment',
];