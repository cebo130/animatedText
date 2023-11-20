import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:text_animate/animationPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _nameController = TextEditingController();
  String _displayName = '';
  double selectedValue = 100.0; // Default selected value
  Color? myColor = Colors.green;
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Name Display App'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                    border: Border.all(color: Colors.teal),
                  color: Colors.teal,
                ),
                width: myWidth,
                child: Center(child: Text("Text Animate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: isEmpty ? Colors.red : Colors.teal)
                    ),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: isEmpty ? 'Please enter message:': 'Enter message:',
                        labelStyle: TextStyle(color: isEmpty ? Colors.red : Colors.teal),
                        border: InputBorder.none,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Spacer(),
                  //SizedBox(width: 20.0),
                  Column(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                            border: Border.all(color: Colors.teal),
                          color: Colors.teal,
                        ),
                        child: Center(child: Text("Speed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                      DropdownButton<double>(
                        value: selectedValue,
                        items: [
                          DropdownMenuItem<double>(
                            value: 100.0,
                            child: Text('Slow'),
                          ),
                          DropdownMenuItem<double>(
                            value: 600.0,
                            child: Text('Fast'),
                          ),
                          DropdownMenuItem<double>(
                            value: 990.0,
                            child: Text('Super Fast'),
                          ),
                          DropdownMenuItem<double>(
                            value: 1500.0,
                            child: Text('Extreme'),
                          ),
                        ],
                        onChanged: (double? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  //SizedBox(width: 20.0),
                  Column(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                          border: Border.all(color: Colors.teal),
                          color: Colors.teal,
                        ),
                        child: Center(child: Text("Text Color",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                      DropdownButton<Color?>(
                        value: myColor,
                        items: [
                          DropdownMenuItem<Color?>(
                            value: Colors.green,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 13,
                                ),
                                SizedBox(width: 5,),
                                Text('Green'),
                              ],
                            ),
                          ),
                          DropdownMenuItem<Color?>(
                            value: Colors.red,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 13,
                                ),
                                SizedBox(width: 5,),
                                Text('Red'),
                              ],
                            ),
                          ),
                          DropdownMenuItem<Color?>(
                            value: Colors.blue,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 13,
                                ),
                                SizedBox(width: 5,),
                                Text('Blue'),
                              ],
                            ),
                          ),
                          DropdownMenuItem<Color?>(
                            value: Colors.orange,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  radius: 13,
                                ),
                                SizedBox(width: 5,),
                                Text('Orange'),
                              ],
                            ),
                          ),
                          DropdownMenuItem<Color?>(
                            value: Colors.pink,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 13,
                                ),
                                SizedBox(width: 5,),
                                Text('Pink'),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (Color? newColor) {
                          setState(() {
                            myColor = newColor!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // Set the background color here
                ),
                onPressed: isEmpty ? null : () {
                  setState(() {
                    _displayName = _nameController.text;
                    print("------------------############@@@@@@@***************-__------------");
                    print(_displayName);
                    print(selectedValue);

                    _displayName.isNotEmpty ? Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimationPage(message: _displayName!,speed: selectedValue,myColor: myColor,))):
                        isEmpty = true;
                  });
                  isEmpty = false;
                } ,
                child: Text('Next'),
              ),
              SizedBox(height: 20,),
              Text("double tap anywhere on next screen to get back to this page ",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),)
              // SizedBox(height: 16.0),
              // _displayName.isNotEmpty
              //     ? Text(
              //   'Hello, $_displayName!',
              //   style: TextStyle(fontSize: 24.0),
              // )
              //     : Container(),
              // Text("$selectedValue"),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
