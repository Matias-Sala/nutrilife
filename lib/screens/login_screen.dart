import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:nutrilife/widgets/delayed_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF8185E2),
          body: Stack(
            children: <Widget>[
              Image.asset(
                "assets/FondoLog.png",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Center(
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  child: SizedBox.expand(
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 300,
                            padding: EdgeInsets.all(30),
                            child: Image.asset(
                              "assets/ALcobiLogo.jpeg",
                              fit: BoxFit.fill,
                            )),
                        DelayedAnimation(
                          child: Text(
                            "Hola!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: color),
                          ),
                          delay: delayedAmount + 1000,
                        ),
                        DelayedAnimation(
                          child: Text(
                            "Somos ALCOBI",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: color),
                          ),
                          delay: delayedAmount + 2000,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: DelayedAnimation(
                            child: Text(
                              "Y queremos ayudarte",
                              style: TextStyle(fontSize: 20.0, color: color),
                            ),
                            delay: delayedAmount + 3000,
                          ),
                        ),
                        DelayedAnimation(
                          child: Text(
                            "Con tu nutrición personal",
                            style: TextStyle(fontSize: 20.0, color: color),
                          ),
                          delay: delayedAmount + 3000,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: DelayedAnimation(
                            child: GestureDetector(
                              onTapDown: _onTapDown,
                              onTapUp: _onTapUp,
                              child: Transform.scale(
                                scale: _scale,
                                child: _animatedButtonUI,
                              ),
                            ),
                            delay: delayedAmount + 4000,
                          ),
                        ),
                        DelayedAnimation(
                          child: FlatButton(
                            child: Text(
                              "Estoy listo para tener una cuenta".toUpperCase(),
                              style: TextStyle(fontSize: 12.0, color: color),
                            ),
                            onPressed: () {},
                          ),
                          delay: delayedAmount + 5000,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ],
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Ingresar',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
