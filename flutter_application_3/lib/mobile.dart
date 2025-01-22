
import 'package:flutter/material.dart';
import 'package:flutter_application_3/my_courses.dart';
import 'package:flutter_application_3/myown.dart';
import 'package:flutter_application_3/nextpage.dart';
import 'package:flutter_application_3/play%20courses.dart';
Color? clr=Colors.amber;
Color? clrs=Colors.amber;
bool tap=true;
TextEditingController scontroller=new TextEditingController();
TextEditingController scontrol=new TextEditingController();
class loginmob extends StatefulWidget {
  const loginmob({super.key});

  @override
  State<loginmob> createState() => loginmobState();
}

class loginmobState extends State<loginmob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
      children: [
      
      
        
           Container(
                     height: 500,
                     width: 375,
                     color: clrs,
                     child:Stack(
                     children:[ Image.asset("asset/images/imgs.jpeg",
                     width:400,
                     height:75 ,
                     fit: BoxFit.cover),
                     Center(child: Image.asset("asset/images/img.png"))
                     ]
                     )
                  ),
        
      
      
      
        
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0,20, 0),
          child: Text('Sign in to SMA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
        ),
      
      
      
      Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        child: Text('welcome to SMA!',
        style: TextStyle(
          fontSize: 15,
          color:Colors.black
        ),),
      ),
      
      
      Padding(
        padding: const EdgeInsets.fromLTRB(15,0,15,10),
        child: Text('Your trusted school management solution',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black
        ),),
      ),
      
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10,10,10),
        child: TextField(
          controller: scontroller,
          decoration: InputDecoration(
            hintText: 'enter here',
            labelText: 'user id',
            border: OutlineInputBorder()
          ),
        ),
      ),
      
      Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,10),
        child: TextField(
           controller: scontrol,
          obscureText: tap,
          decoration: InputDecoration(
            hintText: 'enter here',
            labelText: 'paasword',
            border: OutlineInputBorder(),
            suffixIcon: InkWell(
              child: Icon(
                tap?Icons.visibility_off:Icons.visibility,  
              ),
              onTap: () {
                setState(() {
                  tap=!tap;
                });
              },
            )
          ),
        ),
      ),
      
       InkWell(
      child:Padding(
        padding: const EdgeInsets.fromLTRB(280,10,5,0),
        child: Text('forgot password',
        style: TextStyle(
          fontSize: 12,
          color: Colors.black
        ),),
      ),
         onTap: () {
           setState(() {
             ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('please contact the admin'),
                      duration:Duration(milliseconds: 1000),)
                    );
                  
           });
         },
       ),
      InkWell(
         child:Padding(
           padding: const EdgeInsets.fromLTRB(20,5,20,0),
           child: Container(
            height: 40,
            width: 100,
            color: clr,
                    child: Center(
           child: GestureDetector(
             child: Text('Log In',
             style: TextStyle(
              fontSize: 15,
              color: Colors.black
             ),),
             onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) =>MyCourses()),);
             },
           ),
                    ),
                   ),
         ),
      onTap: () {
        if(scontroller.text=='yeshwanth'&&scontrol.text=='yesh2024'){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>log()));
      }
        /*setState(() {
          if(scontroller!='yeshwanth'||scontrol!='yesh2024'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('incorrect id or password'),
          duration: Duration(milliseconds:1000 )
          
          )
        );
          }
        });*/
      },
      ),


      
      ],
            )
    );
  }
}