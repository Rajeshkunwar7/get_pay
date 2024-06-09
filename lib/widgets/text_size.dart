import 'package:flutter/material.dart';


class SizedText extends StatelessWidget {
  final String text;

  final Color color;

  const SizedText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);

    return Column(
      children: [
        Text(
          text,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            for (int i = 0; i < textSize.width / 5; i++)
              Container(
                width: 5,
                color: i.isEven ? color : Colors.white,
                height: 2,
              )
          ],
        )
      ],
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }
}
