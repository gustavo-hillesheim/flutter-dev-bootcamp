import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender, this.isFromLoggedUser});

  final String text;
  final String sender;
  final bool isFromLoggedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isFromLoggedUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: _borderRadius,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: isFromLoggedUser ? Colors.white : Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
            color: isFromLoggedUser ? Colors.lightBlueAccent : Colors.white,
          ),
        ],
      ),
    );
  }

  BorderRadius get _borderRadius => BorderRadius.only(
    topLeft: isFromLoggedUser == true ? Radius.circular(30) : Radius.zero,
    topRight: isFromLoggedUser == true ? Radius.zero : Radius.circular(30),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );
}
