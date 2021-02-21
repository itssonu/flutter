import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
User loggedInUser;

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String messageText;

  TextEditingController messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    loggedInUser = user;
    print(loggedInUser.email);
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for (var msg in messages.docs) {
  //     print(msg.data());
  //   }
  // }

  void messageStrean() async {
    // final messages = _firestore.collection('messages').snapshots();
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/chat/logo.png',
              height: 25.0,
            ),
            Text('Chat'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
              // messageStrean();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessageStream(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (v) {
                        messageText = v;
                      },
                      decoration: InputDecoration(hintText: 'Message'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // print(messageText);
                    messageTextController.clear();
                    Map<String, dynamic> data = {
                      'text': messageText,
                      'sender': loggedInUser.email
                    };
                    _firestore.collection('messages').add(data);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final message = snapshot.data.docs.reversed;

        List<MessageBubble> messagewidgets = [];
        for (var msg in message) {
          // print(msg.data());
          String text = msg.data()['text'];
          String sender = msg.data()['sender'];

          final messagewidget = MessageBubble(
            text: text,
            sender: sender,
            isMe: loggedInUser.email == sender,
          );
          messagewidgets.add(messagewidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messagewidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    @required this.text,
    @required this.sender,
    this.isMe,
  });

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.black54),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
                topRight: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            color: isMe ? Colors.white : Colors.lightBlueAccent[200],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.0, color: isMe ? Colors.black : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
