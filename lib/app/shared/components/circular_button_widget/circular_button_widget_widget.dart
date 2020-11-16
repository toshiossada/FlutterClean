import 'package:flutter/material.dart';

class CircularButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color bordeColor;
  final double height;
  final double width;
  final Widget icon;
  final Function onTap;

  const CircularButtonWidget(
      {Key key,
      this.label = "",
      this.backgroundColor,
      this.textColor = Colors.white,
      this.bordeColor,
      this.height = 55,
      this.width,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: backgroundColor == null
            ? Theme.of(context).accentColor
            : backgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    bordeColor == null ? null : Border.all(color: bordeColor)),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon == null ? Container() : icon,
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
