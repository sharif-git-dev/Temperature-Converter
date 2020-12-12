import 'package:flutter/material.dart';

void main() => runApp(Convetor());

class Convetor extends StatefulWidget {
  @override
  _ConvetorState createState() => _ConvetorState();
}

class _ConvetorState extends State<Convetor> {
  double fahTemp = 0.0; double celTemp = 0.0;
  bool isFah = true; 
  var fahController = TextEditingController();
  var celController = TextEditingController();
  @override
  initState(){
    super.initState();
    fahController.addListener(fahListener);
    celController.addListener(celListener); 
  }
  fahListener() {
    fahTemp = double.parse(fahController.text);
    celTemp = convert(fahTemp, true);
    if(isFah)
    celController.text = celTemp.toString();
    isFah = true;
  }
  celListener() {
    setState(() {
      celTemp = double.parse(celController.text);
      fahTemp = convert(celTemp, false);
      if(!isFah)
      fahController.text = fahTemp.toString();
      isFah = false;
    });
  }
  
  double convert(double temp , bool isF){
   return isF ? (temp - 32) * (5 / 9): (temp * 9 / 5 ) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    'Celsius',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                   TextField(
                     controller: celController,
                     keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     suffixText: 'C'
                   ),),
                ],
              )),
              SizedBox(width: 40,),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    'Fahrenheit',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                   TextField(
                     controller: fahController,
                     keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     suffixText: 'F'
                   ),),
                ],
              )), 
            ],
          ),
        ),
      ),
    );
  }
}
