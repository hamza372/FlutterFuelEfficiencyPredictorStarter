import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Interpreter interpreter;
  var result = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  performAction() {
    double cylinders = double.parse(cylindersController.text);
    double displacement = double.parse(displacementController.text);
    double horsePower = double.parse(horsepowerController.text);
    double weight = double.parse(weightController.text);
    double accelration = double.parse(accelrationController.text);
    double modelYear = double.parse(modelController.text);
    double originA = 1;
    double originB = 0;
    double originC = 0;
    if(originValue == "USA"){
      originA = 1;
      originB = 0;
      originC = 0;
    }else if(originValue == "Europe"){
      originA = 0;
      originB = 1;
      originC = 0;
    }else if(originValue == "Japan"){
      originA = 0;
      originB = 0;
      originC = 1;
    }



  }

  TextEditingController displacementController = TextEditingController();
  TextEditingController cylindersController = TextEditingController();
  TextEditingController horsepowerController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController accelrationController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController originController = TextEditingController();
  String originValue = 'USA';
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            // margin: EdgeInsets.only(left: 40,right: 40),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 250,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${result}MPG',
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 150,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: displacementController,
                          decoration: const InputDecoration(
                              hintText: 'Displacement',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.red,
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cylindersController,
                          decoration: const InputDecoration(
                              hintText: 'Cylinders',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: horsepowerController,
                          decoration: const InputDecoration(
                              hintText: 'Horsepower',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: weightController,
                          decoration: const InputDecoration(
                              hintText: 'Weight',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.deepOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: accelrationController,
                          decoration: const InputDecoration(
                              hintText: 'Acceleration',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.greenAccent,
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: modelController,
                          decoration: const InputDecoration(
                              hintText: 'Model Year',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                        ),
                      ),

                      DropdownButton(
                          // Initial Value
                          value: originValue,
                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),

                          // Array list of items
                          items: ['USA', 'Europe', 'Japan'].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              originValue = newValue!;
                            });
                          }),
                    ],
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      scrollController.jumpTo(0);
                      performAction();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      'Get',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
