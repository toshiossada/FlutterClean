import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final Color color;
  CircularProgressIndicatorWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                  color != null ? color : Theme.of(context).primaryColor))),
    );
  }
}
