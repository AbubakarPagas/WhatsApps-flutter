import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/page/call_screen.dart';
import 'package:whatsapp_flutter/page/camera_screen.dart';
import 'package:whatsapp_flutter/page/chat_screen.dart';
import 'package:whatsapp_flutter/page/status_screen.dart';
import 'package:camera/camera.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});
  

  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          )
        ],
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        CameraScreen(widget.cameras),
        ChatScreen(),
        StatusScreen(),
        CallsScreen(),
      ],),
        floatingActionButton: showFab
        ? FloatingActionButton(
          elevation: 1.9,
          backgroundColor: Theme.of(context).accentColor,
           child: Icon(Icons.message,
           color: Colors.white,),
            onPressed: () => print("open Chat"),
        ): null
        
    );
  }
}
