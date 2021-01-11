import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/flash-chat/components/message_bubble.dart';
import 'package:flutter_dev_bootcamp/flash-chat/constants.dart';
import 'package:flutter_dev_bootcamp/flash-chat/screens/welcome_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    loggedInUser = _auth.currentUser;
  }

  Stream<List<Map<String, dynamic>>> getMessagesStream() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map(
            (docs) => docs.map((doc) => doc.data()).toList().reversed.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth
                    .signOut()
                    .then(
                      (_) => Navigator.pushReplacementNamed(
                          context, WelcomeScreen.route),
                    )
                    .catchError(print);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(
              messagesStream: getMessagesStream(),
              loggedInUser: loggedInUser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (messageText != null && loggedInUser != null) {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                        });
                        messageTextController.clear();
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  MessagesStream({@required this.messagesStream, @required this.loggedInUser});

  final Stream<List<Map<String, dynamic>>> messagesStream;
  final User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: messagesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: ListView.builder(
            reverse: true,
            padding: EdgeInsets.all(10),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final text = snapshot.data[index]['text'];
              final sender = snapshot.data[index]['sender'];
              return MessageBubble(
                text: text,
                sender: sender,
                isFromLoggedUser: loggedInUser.email == sender,
              );
            },
          ),
        );
      },
    );
  }
}
