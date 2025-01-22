import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Stack(
      children: [
          Image.asset("asset/images/imgwall.png",
          fit: BoxFit.fill,),


        Padding(
          padding: const EdgeInsets.fromLTRB(500, 200, 500, 200),
          child: Container(
             /* height: 20,
             width: 20, */
             color: const Color.fromARGB(31, 12, 3, 3),
            child: Column(
              children: [
                Center(
                  child: Text('LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  
                  ),),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,40,40,10),
                  child: TextField(
                    
                    decoration:InputDecoration(
                      hintText: 'enter here',
                      labelText: 'reg num',
                      border: OutlineInputBorder()
                    )
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,0,40,10),
                  child: TextField(
                    
                    decoration:InputDecoration(
                      hintText: 'enter here',
                      labelText: 'password',
                      border: OutlineInputBorder()
                    )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20,100,20),
                  child: Container(
                    height: 20,
                    width: 70,
                    color: Colors.yellow,
                    child: Center(
                      child: Text('submit',
                      style:TextStyle(
                        color: Colors.red
                      )
                      ),
                    )
                  ),
                )
              ],
            )
          ),
        )
      ],
     ),
     );
    
  }
}