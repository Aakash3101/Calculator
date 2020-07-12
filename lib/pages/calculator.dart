import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String text, BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color color = Theme.of(context).accentColor;
    Color splashcolor = Theme.of(context).splashColor;
    return Expanded(
      child: MaterialButton(
        splashColor: splashcolor,
        shape: CircleBorder(side: BorderSide(width: 2.0)),
        onPressed: () {
          buttonPressed(text);
        },
        elevation: 7.0,
        height: 70.0,
        color: color,
        child: Text(
          '$text',
          style: textTheme.headline2,
        ),
      ),
    );
  }

  Widget buttonExt(String text, BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color color = Theme.of(context).accentColor;
    Color splashcolor = Theme.of(context).splashColor;
    return Expanded(
      child: MaterialButton(
        splashColor: splashcolor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () {
          buttonPressed(text);
        },
        elevation: 7.0,
        padding: const EdgeInsets.all(10.0),
        height: 70.0,
        color: color,
        child: Text(
          '$text',
          style: textTheme.headline2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Calculator',
          style: theme.headline3,
        ),
      ),
      body: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
                child: Align(
                  child: Text(
                    output,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              SizedBox(
                child: Divider(
                  thickness: 2.0,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 8.0, top: 10.0),
                child: Row(
                  children: <Widget>[
                    button('7', context),
                    button('8', context),
                    button('9', context),
                    button('/', context),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    button('4', context),
                    button('5', context),
                    button('6', context),
                    button('*', context),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    button('1', context),
                    button('2', context),
                    button('3', context),
                    button('-', context),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    button('.', context),
                    button('0', context),
                    button('00', context),
                    button('+', context),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 2.0),
                child: Row(
                  children: <Widget>[
                    buttonExt('CLEAR', context),
                    SizedBox(
                      width: 12.0,
                    ),
                    buttonExt('=', context),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
