import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isMe;
  final String text;

  const Message({super.key, required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(12.0),
      topRight: const Radius.circular(12.0),
      bottomLeft: isMe ? const Radius.circular(12.0) : Radius.zero,
      bottomRight: isMe ? Radius.zero : const Radius.circular(12.0),
    );

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue[800] : Colors.white,
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
