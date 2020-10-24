import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeActivity(),
));

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  //create ui of the app lets start conding out calculator
  //first we need declare some variables

  String output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressedButton(String val){
    print(val);

    //add some condition
    if(val == "C"){
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    }else if(val == "+" || val == "-" || val == "*" || val == "/" ){
      num1 = double.parse(output);
      operand = val ;
      _out = "0";
      output = output + val;
    }else if(val == "."){
      if(_out.contains(".")){
        return;
      }else{
        _out = _out + val ;
      }
    }else if(val == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _out = (num1+num2).toString();
      }
      if(operand == "-"){
        _out = (num1-num2).toString();
      }
      if(operand == "*"){
        _out = (num1 * num2).toString();
      }
      if(operand == "/"){
        _out = (num1 / num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;
    }else{
      _out = _out + val;
    }
    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  // create our button widget

  Widget CalcBtn(String Btnval){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(2.0,2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0,-2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
          ]
        ),
        child: MaterialButton(
          onPressed: ()=>PressedButton(Btnval),
          padding: EdgeInsets.all(30.0),
          child: Text(Btnval,
          style: TextStyle(
            fontSize: 24.0,
          ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xFFC2B791),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
                child: Text(output ,
                style: TextStyle(
                  fontSize: 60,
                ),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CalcBtn("."),
                      CalcBtn("C"),
                      CalcBtn("<"),
                      CalcBtn("*"),
                    ]
                    ,),
                  Row(
                    children: [
                      CalcBtn("7"),
                      CalcBtn("8"),
                      CalcBtn("9"),
                      CalcBtn("/"),
                    ]
                    ,),
                  Row(
                    children: [
                      CalcBtn("4"),
                      CalcBtn("5"),
                      CalcBtn("6"),
                      CalcBtn("+"),
                    ]
                    ,),
                  Row(
                    children: [
                      CalcBtn("1"),
                      CalcBtn("2"),
                      CalcBtn("3"),
                      CalcBtn("-"),
                    ]
                    ,),
                  Row(
                    children: [
                      CalcBtn("0"),
                      CalcBtn("="),
                    ]
                    ,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

