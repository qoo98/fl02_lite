import 'package:fl02_lite/screens/ex0/two_screen.dart';
import 'package:flutter/material.dart';

class ex0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Root"),
            TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TwoScreen())),
                child: Text("Hello World!"))
          ],
        ),
      ),
    );
  }
}
