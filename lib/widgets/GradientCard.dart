// based on original GradientContainer class by Felix Angelov
// https://gist.github.com/felangel/96b231de636173a44e4787fb52614130#file-gradient_container-dart

import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class GradientCard extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const GradientCard({
    Key key,
    @required this.color,
    @required this.child,
  })  : assert(color != null, child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.7, 1.0],
          colors: [
            color[900],
            color[700],
            color[300],
          ],
        ),
      ),
      child: child,
    );
  }
}