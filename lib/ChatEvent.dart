import 'package:flutter/material.dart';

class ChatEvent extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return  MaterialApp(
      theme:  ThemeData(primarySwatch: Colors.blue),
      home:  Chat(),
    );
  }
}

class Chat extends StatefulWidget {
  @override
  State createState() =>  ChatWindow();
}

class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _msgs = <Msg>[];
  final TextEditingController _tc =  TextEditingController();
  bool _write = false;

  @override
  Widget build(BuildContext ctx) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("ChatEvent"),
        elevation: 6.0,
      ),
      body:  Column(children: <Widget>[
         Flexible(
            child:  ListView.builder(
              itemBuilder: (_, int index) => _msgs[index],
              itemCount: _msgs.length,
              reverse: true,
              padding:  EdgeInsets.all(6.0),
            )),
         Divider(height: 1.2),
         Container(
          child: _builder(),
          decoration:  BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }


  Widget _builder() {
    return  IconTheme(
      data:  IconThemeData(color: Theme.of(context).accentColor),
      child:  Container(
          margin:  EdgeInsets.symmetric(horizontal: 9.0),
          child:  Row(
            children: <Widget>[
               Flexible(
                child:  TextField(
                  controller: _tc,
                  onChanged: (String txt) {
                    setState(() {
                      _write = txt.length > 0;
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration:
                   InputDecoration.collapsed(hintText: "Type a Messege..."),
                ),
              ),
               Container(
                  margin:  EdgeInsets.symmetric(horizontal: 3.0),
                  child: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: _write
                        ? () => _submitMsg(_tc.text)
                        : null,
                  )
              )
            ]
          )
      )
    );
  }

  void _submitMsg(String txt) {
    _tc.clear();
    setState(() {
      _write = false;
    });
    Msg msg =  Msg(
      txt: txt,
      ac:  AnimationController(
          vsync: this,
          duration:  Duration(milliseconds: 500)
      ),
    );
    setState(() {
      _msgs.insert(0, msg);
    });
    msg.ac.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _msgs) {
      msg.ac.dispose();
    }
    super.dispose();
  }

}

class Msg extends StatelessWidget {
  Msg({this.txt, this.ac});
  final String txt;
  final AnimationController ac;

  @override
  Widget build(BuildContext ctx) {
    return  SizeTransition(
      sizeFactor:  CurvedAnimation(
          parent: ac, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child:  Container(
        margin:  EdgeInsets.symmetric(vertical: 8.0),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
              margin:  EdgeInsets.only(right: 18.0),
              child:  CircleAvatar(child:  Text('M')),
            ),
             Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text('Me', style: Theme.of(ctx).textTheme.subhead),
                   Container(
                    margin:  EdgeInsets.only(top: 6.0),
                    child:  Text(txt),
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