import 'package:flutter/material.dart';
import 'package:flutterapp/view/details.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  final String imageUrl = 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          title: Text(
            'HALODEK',
            style: GoogleFonts.dmSans(
              color: Color(0xFFF86320),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF86320).withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9, // Width for the TabBar
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xFFF86320),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  indicatorWeight: 5, // Control the thickness of the indicator
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xFFF86320),
                  labelStyle: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: 'Chat'),
                    Tab(text: 'Status'),
                    Tab(text: 'Calls'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ChatList(imageUrl: imageUrl),
            Center(child: Text("Status")),
            Center(child: Text("Calls")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFF86320),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final String imageUrl;

  ChatList({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: List.generate(10, (index) {
        return ChatItem(
          name: 'User $index',
          message: 'Last message from user $index',
          time: '14:${index}0',
          isTyping: index == 0,
          imageUrl: imageUrl,
          unreadCount: index % 3, // Example unread messages count
        );
      }),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isTyping;
  final String imageUrl;
  final int unreadCount; // Added field for unread messages count

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.isTyping,
    required this.imageUrl,
    this.unreadCount = 0, // Default to 0
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreenDetails(
              userName: name,
              userImage: imageUrl,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 24,
              backgroundColor: Colors.grey[200], // Placeholder color
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    isTyping ? 'Typing...' : message,
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: Color(0xFF333333),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  time,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                ),
                if (!isTyping && unreadCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFFF86320),
                      child: Text(
                        '$unreadCount', // Display unread count
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


