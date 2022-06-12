import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Count It',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Count It'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int total = 0;
  int left = 0;

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total = (prefs.getInt('total') ?? 0);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total = ((prefs.getInt('total') ?? 0) + 1);
      prefs.setInt('total', total);
    });
  }

  void _decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total = ((prefs.getInt('total') ?? 0) - 1);
      prefs.setInt('total', total);
    });
  }

  void loadCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      left = (prefs.getInt('left') ?? 0);
    });
  }

  void _incrementCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      left = ((prefs.getInt('left') ?? 0) + 1);
      prefs.setInt('left', left);
    });
  }

  void _decrementCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      left = ((prefs.getInt('left') ?? 0) - 1);
      prefs.setInt('left', left);
    });
  }

  void _reloadCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('left');
      prefs.remove('total');
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
    loadCounters();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _reloadCounters();
                  total = 0;
                  left = 0;
                });
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("How many times do you have to read?",style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff53a99a),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 27),
                          blurRadius: 33,
                          color: Color(0x3827ae96),
                        )
                      ],
                    ),
                    height: 200.0,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      alignment: Alignment.center,
                      child: Text("$total",
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 120,
                          color: Colors.white,
                        ),
                      )
                  ),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)
                            )
                        )
                    ),
                    onPressed: (){
                      setState(() {
                        _incrementCounter();
                      });
                    },
                    child: Text("+",style: TextStyle(color: Colors.red,fontSize: 50),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)
                            )
                        )
                    ),
                    onPressed: (){
                      setState(() {
                        _decrementCounter();
                      });
                    },
                    child: Text("-",style: const TextStyle(color: Colors.red,fontSize: 50),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Times Completed?",style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff53a99a),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 27),
                          blurRadius: 33,
                          color: Color(0x3827ae96),
                        )
                      ],
                    ),
                    height: 200.0,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      alignment: Alignment.center,
                      child: Text("$left",
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 120,
                          color: Colors.white,
                        ),
                      )
                  ),
                ],
              )
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)
                            ),
                        ),
                    ),
                    onPressed: (){
                      setState(() {
                        _incrementCounters();
                      });
                    },
                    child: Text("+",style: TextStyle(color: Colors.red,fontSize: 50),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)
                            )
                        )
                    ),
                    onPressed: (){
                      setState(() {
                        _decrementCounters();
                      });
                    },
                    child: Text("-",style: const TextStyle(color: Colors.red,fontSize: 50),),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
