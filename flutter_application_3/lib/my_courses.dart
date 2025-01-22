import 'package:flutter/material.dart';
import 'package:flutter_application_3/play%20courses.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String? dropdown_text;
TextEditingController _search=TextEditingController();
List<String> courses=['All','Ongoing','Completed','Downloaded'];


class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  int selected=0;
  int? course_selected;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFA),
      
      //Appbar

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: const Color(0xFFF9FAFA),
        title:  Text('My Courses',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
            child: DropdownButton<String>(
              underline: Container(
                    height: 0,
                  ),
                  icon: Icon(Icons.keyboard_arrow_down,
                  color: Colors.black,),
                  hint: Text(
                    dropdown_text ?? '10th Std',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  items: <String>['10th Std','11th Std','12th Std']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value
                        ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdown_text=value;
                    });
                  },
                ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
        
            //Search bar

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: const Color.fromARGB(120, 144, 141, 141)
                    ),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: const Color.fromARGB(115, 144, 141, 141)
                    ),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  prefixIcon: Image.asset('asset/images/searchicon.png'),
                  //Icon(Icons.search_rounded,color: Colors.grey,),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 144, 142, 142),
                  )
                ),
                controller: _search,
              ),
            ),
            
            //Listview 

            Padding(
              padding: const EdgeInsets.only(left: 4,right: 4),
              child: Container(
                height: 50,
                child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          courses.length, 
                          
                          (index) => GestureDetector(
                            child: Container(

                              width: (courses[index].length*10)+20,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: index==selected?Colors.amber:Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    courses[index],
                                    style: TextStyle(
                                      color: index==selected?Colors.black:const Color.fromARGB(255, 110, 110, 110),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selected=index;
                              });
                            },
                          ),
                        ),
                      ),
              ),
            ),
        
            //Listview of courses

            Container(
              
              height: 580,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  10,
                  (index)=> Padding(
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                    child: SizedBox(
                      width: 200,
                      height: 120,
                      child: GestureDetector(
                        child: Card(
                          elevation: index==course_selected?4:16,
                          shadowColor: const Color.fromARGB(87, 211, 207, 207),
                          color: const Color.fromARGB(255, 255, 253, 253),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                                            
                                            
                         /*  decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 253, 253),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(46, 119, 118, 118), 
                              blurRadius: 6,
                            ),
                          ], 
                          ), */
                                            
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset('asset/images/micro.jpg',fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                  ),
                                ),
                              ),
                                
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10,bottom: 0),
                                    child: Text('Science : Microbiology',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4,top: 0),
                                    child: Text('Azamat Baimatov',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Text('2 hrs 53mins',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ),
                                  Text('38 / 50',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w600,
                                  ),)
                                ],
                              ),
                                
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 20,right: 14),
                                child: CircularPercentIndicator(
                                    radius: 30,
                                    lineWidth: 6.0,
                                    animation: true,
                                    percent: 0.75, 
                                    center: Text(
                                      "75%",
                                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.amber,
                                    backgroundColor: Colors.grey[300]!,
                                ),
                              )
                        
                              
                              /* Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80),
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 6
                                    ),
                                  ),
                                  child: Center(child: Text('75%',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                  ),)), 
                                ),
                              ), */
                        
                        
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            course_selected=index;
                             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Playcourses()),
            );
                          });
                        },
                      ),
                    ),
                  )),
              ),
            ),

            //Navigation icons

            /* Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.menu),
                  Icon(Icons.home),
                  Icon(Icons.arrow_back)
                ],
              ),
            ) */
          ],
        ),
      ),
      
    );
  }
}