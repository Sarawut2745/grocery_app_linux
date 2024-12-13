import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  // ประกาศตัวแปรที่จำเป็น
  final String text;
  final Color color;
  final double textSize;
  final bool isTitle;
  final int maxline;

  // Constructor
  const TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textSize,
    this.isTitle = false, // Default value
    this.maxline = 10, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      maxLines: maxline,
      overflow: TextOverflow
          .ellipsis, // ถ้าข้อความยาวเกินจะทำการตัดข้อความและแสดง '...'
    );
  }
}
