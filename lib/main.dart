import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class Chat {
  final String avatarUrl;
  final String name;
  final String message;
  final String count;

  Chat({this.avatarUrl, this.name, this.message, this.count});
  static final List<Chat> Data = [
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Salem Ali",
        message: "How are you?",
        count:"4"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Ahmed Khaled",
        message: "Nice to meet you",
        count:"1"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Hassan Ibrahim",
        message: "??",
        count:"8"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Abdullah Al-Ali",
        message: "can we meet tonight",
        count:"3"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Hossam Yassen",
        message: "ok",
        count:"10"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Saeed",
        message: "Good bye",
        count:"1"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Abdulrahman Jassem",
        message: "ok",
        count:"6"
    ),
    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "Salem Ali",
        message: "How are you?",
        count:""
    ),    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "asam",
        message: "I'm Fine.",
        count:"6"
    ),    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "asam",
        message: "Good bye",
        count:""
    ),    Chat(
        avatarUrl: "https://www.pinclipart.com/picdir/big/155-1559316_male-avatar-clipart.png",
        name: "asam",
        message: "Hi",
        count:""
    ),
  ];
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

          leading:  IconButton(
            icon: Icon(Icons.menu, size: 35),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SettingScreen()));},
          ),
          title: Text('My Conversation',style: TextStyle(fontSize: 25,fontFamily: 'Nanumgothic'))  ,
          backgroundColor: Color.fromRGBO(28, 40, 52, 1.0),
          actions: const [Icon(Icons.search, size: 35,)]
       ),
      body: Container(
        color: Color.fromRGBO(24, 30, 42, 1.0),
        child: ListView.builder(
          itemCount: Chat.Data.length,
          itemBuilder: (context, index) {Chat model = Chat.Data[index];
            try{
          double size_count =double.parse( model.count);} on FormatException {}
            return  Column(
              children: <Widget>[
                Divider(height: 16,),
            Material(
              color: Color.fromRGBO(24, 30, 42, 1.0),
               child: ListTile(
                   onTap: (){},
                    leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(model.name,
                        style: TextStyle(fontSize: 21.0, color: Colors.white,    fontFamily: 'NanumGothic'),
                      ),
                     ],
                  ),
                  subtitle: Text(model.message,
                  style:TextStyle( color:  Color.fromRGBO(129, 139, 149, 1.0),fontFamily: 'NanumGothic',fontSize: 15 ),),
                  trailing:
                  model.count != "" ? Card(
                      color: Color.fromRGBO(129, 139, 149, 1.0),
                      shape:   RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SizedBox(
                        width: 20+double.parse( model.count.length.toString()+'0'),
                        height: 30,
                        child:  Center(child: Text(model.count, style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'NanumGothic')),
                        ), )
                  ): null
                ),)
              ],
            );
          },
        ),
      ),

      floatingActionButton: SizedBox(
    width: 65.0,
    height: 65.0,
    child: FloatingActionButton(
      backgroundColor:Color.fromRGBO(28, 40, 50, 1.0),
      child: Icon(Icons.edit, size: 30),
      onPressed: (){},
    ),
    )
    );
  }
}
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final titles = ['Notification and Sounds', 'Privacy and Security', 'Data and Storage', 'Chat Settings',
      'Folders', 'Devices', 'Language'];

    final icons = [Icons.add_alert, Icons.lock_open,
      Icons.data_usage, Icons.chat, Icons.folder_open,
      Icons.devices, Icons.alternate_email];
    return Scaffold(
        appBar: AppBar(
            leading:  IconButton(
              icon: Icon(Icons.arrow_back, size: 35),
              onPressed: () {
                Navigator.pop(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
            ),
            title: Text('Settings',style: TextStyle(fontSize: 25, fontFamily: 'NanumGothic'))  ,
            backgroundColor: Color.fromRGBO(28, 40, 52, 1.0),
            actions: const   [Icon(Icons.search, size: 35)]
        ),
        body:  Container(
          color: Color.fromRGBO(24, 30, 42, 1.0),
        child: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
            Divider(height: 16,),
                ListTile(
                  leading: Icon(icons[index],color: Color.fromRGBO(129, 139, 149, 1.0), size: 30,),
                  title: Text(titles[index], style: TextStyle(color: Colors.white , fontSize: 25, fontFamily: 'NanumGothic'  ),)
                ),
              ],
          );
        },),
                ),
        floatingActionButton: SizedBox(
          width: 60.0,
          height: 65.0,
          child: FloatingActionButton(
            backgroundColor:Color.fromRGBO(28, 40, 50, 1.0),
            child: Icon(Icons.edit, size: 30),
            onPressed: (){},
          ),
        )
    );
  }
}