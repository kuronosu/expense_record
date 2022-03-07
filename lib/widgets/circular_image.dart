import 'package:flutter/material.dart';
import 'package:expense_record/app_color_scheme.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.size,
    required this.text,
    this.img,
    this.bgColor,
  }) : super(key: key);

  final double size;
  final String text;
  final String? img;
  final Color? bgColor;

  Widget placeholderText() {
    final text = this.text.trim();
    String newTxt = text.isEmpty ? '' : text[0];
    if (text.contains(" ")) {
      final tmp = text.split(" ");
      if (tmp.length >= 2) {
        newTxt = tmp[0][0] + tmp[1][0];
      }
    }
    newTxt = newTxt.toUpperCase();
    return Text(newTxt,
        style: TextStyle(color: Colors.white, fontSize: size / 2));
  }

  Widget placeholderStack(BuildContext context) => Stack(
        children: [
          Container(
            color: bgColor ?? Theme.of(context).colorScheme.defaultCircularImg,
          ),
          Center(child: placeholderText())
        ],
      );

  Widget placeholder(BuildContext context) => SizedBox(
      height: size,
      width: size,
      child: ClipOval(child: placeholderStack(context)));

  @override
  Widget build(BuildContext context) {
    if (img == null) {
      return placeholder(context);
    }
    return SizedBox(
        height: size,
        width: size,
        child: ClipOval(
            child: Image.network(
          img!,
          errorBuilder: (context, e, st) => placeholderStack(context),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            );
          },
        )));
  }
}
