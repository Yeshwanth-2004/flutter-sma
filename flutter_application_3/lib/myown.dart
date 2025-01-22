
import 'package:flutter/material.dart';
import 'package:flutter_application_3/nextpage.dart';
Color? Clr=Colors.amber;
Color? clrs=Colors.amber;
bool tap=true;
TextEditingController scontroller=new TextEditingController();
TextEditingController scontrol=new TextEditingController();
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => loginpageState();
}

class loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(

        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Expanded(
          child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,

            children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 100, 150,0),
                child: Text('Sign In to SMA',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(200,5,200,0),
                child: Text('Welcome Back To SMA!',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(150,5,150,50),
                child:InkWell(
                child: Text('Your Trusted School Management Solution.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                  )
                  ),
                  
                )
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(100, 30, 100, 10),
                child: TextField(
                  controller: scontroller,
                  decoration: InputDecoration(
                    hintText: 'enter here',
                    labelText: 'user id',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(100,0,100, 10),
                child: TextField(
                  controller: scontrol,
                  obscureText: tap,
                  decoration: InputDecoration(
                    hintText: 'enter here',
                    labelText: 'password',
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell( 

                      child: Icon(
                        tap?Icons.visibility_off:Icons.visibility
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

              Padding(
                padding: const EdgeInsets.fromLTRB(500,10,5, 10),
                child:InkWell(
                child: Text('forgot password',
                style: TextStyle(
                  fontSize: 10,
                  color:Colors.black
                ),),
                onTap: () {
                    setState(() {
                    
                  
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('please contact the admin'),
                      duration:Duration(milliseconds: 1000),)
                    );
                  
                    }
                    );
                  },
                )
                
              ),
            

              InkWell(
              child:Container(
               height: 30,
               width: 200,
               color: clrs,
               child: Center(
                 child: Text('Log In',
                 style: TextStyle(
                  color: Colors.black
                 ),),
               )
              ),
              onTap: () {
                if(scontroller.text=='yeshwanth'&&scontrol.text=='yesh2024')
                {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>log()));
                }
                /*setState(() {
                  if(scontroller!='yeshwanth'||scontrol!='yesh2024')
                  {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('incorrect id or password'),
                      duration:Duration(milliseconds: 1000),)
                    );
                  }
                });
                */
              },
              )
            ],
          ),
          ),

          Expanded(
          child:Container(
            height:750,
            width:1000,
            color:Clr,
            child:Stack(
            children:[
              Image.asset("asset/images/imgs.jpeg",
              width: 1000,
              fit: BoxFit.fill,),
            Center(child: Image.asset("asset/images/img.png"))
            ]
            )      
           ) 
          )
        

        ],
      )
    );
  }
}

