// chat_page.dart

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'BINI Aiah',
      'lastMessage': 'Hello! How are you?',
      'time': '12:00 PM',
      'avatar': 'assets/bini/aiah.jpg'
    },
    {
      'name': 'BINI Colet',
      'lastMessage': 'Are you available for a meeting?',
      'time': '11:30 AM',
      'avatar': 'assets/bini/colet.jpg'
    },
    // Add more chats here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: Colors.green[700], 
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chats[index]['avatar']),
            ),
            title: Text(chats[index]['name']),
            subtitle: Text(chats[index]['lastMessage']),
            trailing: Text(chats[index]['time']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(chat: chats[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to ComposeMessagePage to start a new message
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComposeMessagePage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ChatDetailPage extends StatefulWidget {
  final Map<String, dynamic> chat;

  ChatDetailPage({required this.chat});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat['name']),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComposeMessagePage extends StatefulWidget {
  @override
  _ComposeMessagePageState createState() => _ComposeMessagePageState();
}

class _ComposeMessagePageState extends State<ComposeMessagePage> {
  final TextEditingController _messageController = TextEditingController();

  void _sendNewMessage() {
    if (_messageController.text.isNotEmpty) {
      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                border: OutlineInputBorder(),
              ),
              maxLines: null, 
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendNewMessage,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
