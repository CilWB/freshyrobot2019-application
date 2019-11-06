import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  int score_manual = 0;
  int num_man_retry = 0;
  int group=0;
  int match=0;
  String team = 'a';
  List<String> _mode = ['Maual','Auto'];
  List<String> _group = ["G1", "G2", "G3","G4"].toList();
  List<String> _match = ["M1", "M2", "M3","M4","M5","M6","M7","M8","M9","M10"].toList();
  List<String> _team = ["T1", "T2", "T3","T4","T5","T6","T7","T8","T9","T10"].toList();
  String _selectedGroup,_selectedMatch,_selectedTeam;
  void _chageScore(int score){
    setState(() {
     score_manual += score; 
    });
  }
  void _retry(){
    setState(() {
     num_man_retry += 1; 
    });
  // FirebaseDatabase.instance.reference().child('hi').set({
  //   'title':'I am CIL'
  // });

  
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      score_manual = 0;
      num_man_retry = 0;
    });
  }
  
void onGroupChange(String item){
  setState(() {
    _selectedGroup = item;   
    print(_selectedGroup);     
  });
}
void onMatchChange(String item){
  setState(() {
    _selectedMatch = item;   
    print(_selectedMatch);     
  });
}
void onTeamChange(String item){
  setState(() {
    _selectedTeam = item;   
    print(_selectedTeam);     
  });
}
void _showDialog(){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: new Text("Check committee"),
        content: new Text(_selectedGroup+" "+_selectedMatch+" "+_selectedTeam+" "+_mode[_selectedIndex]),

      );
    }
  );
}

//////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    String titlePage;
    if ( _selectedIndex == 0){
      titlePage = 'Manual';
    }
    else if (_selectedIndex == 1){
      titlePage = 'Auto';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          
          <Widget>[
            Text(
              'Number of Manual Retry:',
            ),
            Text(
              '$num_man_retry',
              style: Theme.of(context).textTheme.display1,
            ),
            
            Text(
              'Score of Manual:',
            ),
            Text(
              '$score_manual',
              style: Theme.of(context).textTheme.display1,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[      
              FlatButton(
                child: Text("+5"),
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _chageScore(5);
                  },
                ),
                   FlatButton(
                child: Text("+10"),
                color: Colors.black,
                textColor: Colors.white,  
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _chageScore(10);
                  },
                ),
              ]
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[   
                   FlatButton(
                child: Text("-5"),
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _chageScore(-5);
                  },
                ),
                   FlatButton(
                child: Text("-10"),
                color: Colors.black,
                textColor: Colors.white,  
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _chageScore(-10);
                  },
                ),
              ]
                ),

            FlatButton(
                child: Text("Retry"),
                color: Colors.black,
                textColor: Colors.white,  
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _retry();
                  },
                ),
                ////////////////////////
                
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                      DropdownButton<String>(
                        hint: Text("Group"),
                        style: new TextStyle(color: Colors.black  ),
                        value: _selectedGroup,
                        items: _group.map((String value){
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text("${value}")
                          );
                        }).toList(),
                        onChanged: (String value){
                          onGroupChange(value);
                        }
                ),
                      DropdownButton<String>(
                        hint: Text("Match"),
                        style: new TextStyle(color: Colors.black  ),
                        value: _selectedMatch,
                        items: _match.map((String value){
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text("${value}")
                          );
                        }).toList(),
                        onChanged: (String value){
                          onMatchChange(value);
                        }
                ),
                      DropdownButton<String>(
                        hint: Text("Team"),
                        style: new TextStyle(color: Colors.black  ),
                        value: _selectedTeam,
                        items: _team.map((String value){
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text("${value}")
                          );
                        }).toList(),
                        onChanged: (String value){
                          onTeamChange(value);
                        }
                ),
              ]
                

                ),
              FlatButton(
                child: Text("Check preparation"),
                color: Colors.black,
                textColor: Colors.white,  
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  _showDialog();
                  },
                ),
            ////////////////////////
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            title: Text('Manual'),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Auto'),  
          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }
}
