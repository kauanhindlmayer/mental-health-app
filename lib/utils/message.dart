import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class Message extends StatelessWidget {
  final bool isMe;
  final String text;

  const Message({super.key, required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
      bottomLeft: isMe ? const Radius.circular(16.0) : Radius.zero,
      bottomRight: isMe ? Radius.zero : const Radius.circular(16.0),
    );

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: isMe ? HexColor("#267ebd") : HexColor("#F2F7FF"),
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isMe ? HexColor("#FFFFFF") : HexColor("#303E65"),
            ),
          ),
        ),
      ),
    );
  }
}
