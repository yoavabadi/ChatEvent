import 'package:flutter/material.dart';
import 'package:chatevent/ChatEventBuilder.dart';
import 'package:chatevent/ChatEvent.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabCtr;

  @override
  void initState() {
    super.initState();

    tabCtr = TabController(vsync: this, length: 4);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("ChatEvent",
          style: TextStyle(
              color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding:  EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(child: Text('ONGOING'),),
            Tab(child: Text('UPCOMING'),),
            Tab(child: Text('INVITATIONS'),),
          ],
          indicatorColor: Colors.white,
          controller: tabCtr,
        ),
        backgroundColor: Colors.blue,
      ),
      body: TabBarView(
        controller: tabCtr,
        children: [
          ListView.builder(
            itemBuilder: (context, position) {
              ChatEventItem chatItem = CreateChatEvent.getChatItem(position);
              return Column(
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Row(
                      children: <Widget>[
                        CircleAvatar(child:  Text(chatItem.name[0])),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.all(5.5),
                                  child: Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        chatItem.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                          Padding(
                            padding:  EdgeInsets.all(5.5),
                            child: Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.peeps.toString().substring(1,
                                          chatItem.peeps.toString().length-1),
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                          ),
                              ],
                            ),

                        )
                      ],
                    ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatEvent()),
                        );
                      },
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: CreateChatEvent.chats.length,
          ),
          Center(
              child: Text("No Chats Just Yet..."),
          ),
          Center(
            child: Text("No Invitations Just Yet..."),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatEventBuilder()),
          );
        },
        child: ImageIcon(
          AssetImage('assets/icon.png'),
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
