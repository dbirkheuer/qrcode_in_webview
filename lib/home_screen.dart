import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leitor de QRCode'),
        backgroundColor: Color(0xff000a12),
        centerTitle: true,
        elevation: 5.0,
        bottomOpacity: 5.0,
        titleSpacing: 2,
      ),
      backgroundColor: Color(0xff263238),
      body: Center(
        child: MaterialButton(
          child: Text("Ler QRCode"),
          onPressed: () async {
            String url = await scanner.scan();



          },
          color: Color(0xffeeeeee),
        ),
      ),
    );
  }
}
