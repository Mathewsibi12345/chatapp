

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreenDetails extends StatelessWidget {
  final String userName;
  final String userImage;

  // Constructor to accept userName and userImage parameters
  ChatScreenDetails({
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF), 
        elevation: 0.5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage), // Use userImage here
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName, // Use userName here
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333), // Dark grey
              ),
            ),
            Text(
              'Typing...',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call, color: Color(0xFF333333)), 
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, color: Color(0xFF333333)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFF333333)), 
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Center(
                  child: Text(
                    'Today',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFF86320), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ChatBubble(
                  text: 'Hi $userName, please give me feedback about my new shot?',
                  isSender: false,
                  time: '14:05',
                ),
                ChatBubble(
                  text: 'My pleasure, please send me the link or image',
                  isSender: true,
                  time: '14:15',
                ),
                SizedBox(height: 8),
                // Image.network(
                //   'https://randomuser.me/api/portraits/men/46.jpg',
                // ),
                SizedBox(height: 8),
                ChatBubble(
                  text: 'Here it is! Hope you like it!',
                  isSender: false,
                  time: '14:25',
                ),
                ChatBubble(
                  text: 'Great work! Let’s schedule it tomorrow',
                  isSender: true,
                  time: '14:28',
                ),
                SizedBox(height: 12),
                EmojiRow(),
              ],
            ),
          ),
          MessageInputBox(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  ChatBubble({
    required this.text,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: isSender ? Color(0xFFF86320) : Color(0xFFFFFFFF), // Colors
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                color: isSender ? Colors.white : Color(0xFF333333), // Dark grey
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: GoogleFonts.dmSans(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class EmojiRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF86320), // Hex orange color
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF86320).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EmojiButton(emoji: '👍'),
          EmojiButton(emoji: '❤️'),
          EmojiButton(emoji: '🔥'),
          EmojiButton(emoji: '+'),
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String emoji;

  EmojiButton({required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MessageInputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF), // White
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.emoji_emotions_outlined, color: Color(0xFF333333)), // Dark grey
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
              style: GoogleFonts.dmSans(), 
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFFF86320)), 
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
