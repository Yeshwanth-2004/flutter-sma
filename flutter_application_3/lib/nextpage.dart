
import 'package:flutter/material.dart';

class log extends StatefulWidget {
  const log({super.key});

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  width: 300,
                  child:Image.asset("asset/images/img.png")
                ),

                Container(
                  height: 200,
                  width: 300,
                  child:Image.asset("asset/images/i"),
                )
              ],
            )
          ],
        )
      
    );
  }
}

