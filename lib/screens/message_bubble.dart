import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  MessageBubble({this.text, this.sender,this.isMe});

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 8.0
            ),
          ),
          Material(
              elevation: 8.0,
              borderRadius: BorderRadius.only(topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0), bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0), topRight: isMe? Radius.circular(0.0):  Radius.circular(30.0)),
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: isMe ? Colors.white : Colors.black
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}