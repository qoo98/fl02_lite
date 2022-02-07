import 'package:fl02_lite/screens/ex0/third_screen.dart';
import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 90,
        leading: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.blue,
            ),
            TextButton(
              child: Text(
                "Root",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Two"),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdScreen())),
                child: Text("Hello World #2!"))
          ],
        ),
      ),
    );
  }
}
