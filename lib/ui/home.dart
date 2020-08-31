import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _BmiData {
  int age;
  double height;
  double weight;
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  _BmiData _data = new _BmiData();
  double _finalValue = 0.0;

  double calculateBMI(){
    setState(() {
      _finalValue = _data.weight/(_data.height*_data.height);
    });
    return _finalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Image.asset(
                "images/bmilogo.png",
                height: 0.3*MediaQuery.of(context).size.width,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Container(
                color: Colors.grey.shade200,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Age",
                            icon: Icon(Icons.person_outline),
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return "Please enter Age";
                            }
                            else{
                              _data.age = int.parse(value);
                              return null;
                            }
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Height (m)",
                            icon: Icon(Icons.assessment),
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return "Please enter Height";
                            }
                            else{
                              _data.height = double.parse(value);
                              return null;
                            }
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Weight (Kg)",
                            icon: Icon(Icons.line_weight),
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return "Please enter Weight";
                            }
                            else{
                              _data.weight = double.parse(value);
                              return null;
                            }
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: RaisedButton(
                          child: Text("Calculate"),
                          onPressed: () {
                            if (_formKey.currentState.validate()){
                              calculateBMI();
                            }
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  _finalValue > 0 ? "Your BMI is: ${_finalValue.toStringAsFixed(1)}" : "Calculate Your BMI",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
