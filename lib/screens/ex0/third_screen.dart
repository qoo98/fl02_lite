import 'package:fl02_lite/screens/ex0/ex0.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
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
                  "Two",
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
            Text("Three"),
            Text("Hello,World #3!"),
            TextButton(
                onPressed: () => Navigator.popUntil(
                    context, (route) => route.isFirst),
                child: Text("Pop to root"))
          ],
        ),
      ),
    );
  }
}
