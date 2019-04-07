import 'package:flutter/material.dart';
import 'package:chatevent/main.dart';
import 'dart:async';

class ChatEventItem {
  String name;
  DateTime start;
  DateTime end;
  List<String> peeps;

  ChatEventItem(
      this.name,
      this.start,
      this.end,
      this.peeps
      );
}

class ChatEventBuilder extends StatefulWidget {

  @override
  CreateChatEvent createState() => CreateChatEvent();
}

class CreateChatEvent extends State<ChatEventBuilder> {
  static var chats = [
    ChatEventItem("Mom's Birthday", DateTime(2019), DateTime(2020), ["Dad, Mike, Amily"]),
  ];
  static ChatEventItem getChatItem(int position) {
    return chats[position];
  }

  static var itemCount = chats.length;

  String _name = "";
  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  DateTime _endDate = DateTime.now();
  TimeOfDay _endTime = TimeOfDay.now();
  List<String> _participants = [];

  Future<Null> _selectDate(BuildContext context, DateTime _date, TimeOfDay _time) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2020)
    );
    if(pickedDate != null && pickedDate != _date)
    {
      setState(() {
        _date = pickedDate;
      });
    }
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: _time
    );
    if(pickedTime != null && pickedTime != _time)
    {
      setState(() {
        _time = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Create a ChatEvent'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
        TextField(
        decoration:  InputDecoration.collapsed(
            hintText: 'Enter ChatEvent Name...'
        ),
              onChanged: (text) {
                _name = text;
              },
            ),
        Divider(),
         DropdownButton<String>(
          hint: Text('Select Participents...'),
          items: <String>['Dad', 'Mom', 'Mike', 'Amily'].map((String value) {
            return  DropdownMenuItem<String>(
              value: value,
              child:  Text(value),
            );
          }).toList(),
          onChanged: (text) {
            _participants.add(text);
          },
        ),
        Divider(),
        RaisedButton(child: Text('ChatEvent From'),
                onPressed: (){_selectDate(context, _startDate, _startTime);}),
            Divider(),
            RaisedButton(child: Text('ChatEvent To'),
                onPressed: (){_selectDate(context, _endDate, _endTime);}),
            Divider(),
            RaisedButton(
                child: Text('Create ChatEvent'),
                onPressed: (){
                  chats.add(ChatEventItem(_name, _startDate, _endDate, _participants));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                ),
          ],
        ),
      ),
    );
  }
}
