import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#FFFFFF"),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: HexColor("#303E65"),
                    ),
                    hintText: 'Write a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: HexColor("#F2F7FF"),
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.image_outlined,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: HexColor("#267ebd"),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.mic,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
