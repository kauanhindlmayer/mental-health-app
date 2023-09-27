import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';
import 'package:mentalhealthapp/utils/message.dart';
import 'package:mentalhealthapp/utils/message_input_text.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  void _handleRedirectToHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#267ebd"),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 25.0,
                right: 25.0,
                bottom: 0.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _handleRedirectToHome(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("#408dc5"),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Bobby Singer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("#408dc5"),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor("#FFFFFF"),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                padding: const EdgeInsets.all(25.0),
                child: ListView(
                  children: const [
                    Message(
                      isMe: false,
                      text: 'Hi Jason! How are you?',
                    ),
                    Message(
                      isMe: true,
                      text: 'I\'m good, thanks! How are you?',
                    ),
                    Message(
                      isMe: false,
                      text: 'I\'m great. Are you free today?',
                    ),
                    Message(
                      isMe: true,
                      text: 'Yes, I\'m free today.',
                    ),
                    Message(
                      isMe: false,
                      text: 'Great! Let\'s meet at 5pm.',
                    ),
                    Message(
                      isMe: true,
                      text: 'Sure, see you then.',
                    ),
                  ],
                ),
              ),
            ),
            const MessageInputText()
          ],
        ),
      ),
    );
  }
}
