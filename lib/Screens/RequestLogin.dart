import 'package:flutter/material.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:school_management/Widgets/BouncingButton.dart';
import 'RequestProcessing.dart';

class RequestLogin extends StatefulWidget {
  @override
  _RequestLoginState createState() => _RequestLoginState();
}

class _RequestLoginState extends State<RequestLogin>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, leftCurve;
  late AnimationController animationController;

  late String email, phno, className, name, rollno; // Renamed _class to className
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    leftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Request',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(70.0, 35.0, 0, 0),
                            child: Text(
                              'ID',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(105.0, 0.0, 0, 30),
                          child: Container(
                            child: Text(
                              '.',
                              style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform: Matrix4.translationValues(leftCurve.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$'); // Allow spaces
                                    if (value?.isEmpty ?? true) {
                                      return 'You must enter your name!';
                                    } else if (nameRegExp.hasMatch(value!)) {
                                      return null;
                                    } else {
                                      return 'Enter a valid name';
                                    }
                                  },
                                  onSaved: (val) {
                                    name = val!;
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onSaved: (val) {
                                    rollno = val!;
                                  },
                                  validator: (val) {
                                    if (val?.isEmpty ?? true) {
                                      return 'Enter your roll number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Roll Number',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onSaved: (val) {
                                    className = val!; // Renamed _class to className
                                  },
                                  validator: (value) {
                                    RegExp classRegExp = RegExp(r'^[A-Za-z0-9]+$'); // Allow alphanumeric
                                    if (value?.isEmpty ?? true) {
                                      return 'You must enter your class!';
                                    } else if (classRegExp.hasMatch(value!)) {
                                      return null;
                                    } else {
                                      return 'Enter a valid class';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Class',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email cannot be empty"; // Handle empty case
                                    } else if (!Fzregex.hasMatch(value, FzPattern.email)) {
                                      return "Enter a valid email address"; // Handle invalid email format
                                    } else {
                                      return null; // Valid email
                                    }
                                  },
                                  onSaved: (value) {
                                    email = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'E-Mail',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    RegExp regExp = RegExp(pattern);
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter a valid mobile number';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    phno = val!;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green))),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                child: Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Bouncing(
                          onPress: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ProcessingRequest(),
                                  ));
                            }
                          },
                          child: MaterialButton(
                            elevation: 0.0,
                            minWidth: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            onPressed: () {  },
                            child: Text(
                              "Request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:school_management/Widgets/BouncingButton.dart';

import 'RequestProcessing.dart';

class RequestLogin extends StatefulWidget {
  @override
  _RequestLoginState createState() => _RequestLoginState();
}

class _RequestLoginState extends State<RequestLogin>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    LeftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  late String email, phno, className, name, rollno;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Request',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(70.0, 35.0, 0, 0),
                            child: Text(
                              'ID',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(105.0, 0.0, 0, 30),
                          child: Container(
                            child: Text(
                              '.',
                              style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform:
                      Matrix4.translationValues(LeftCurve.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    RegExp nameRegExp = RegExp('[a-zA-Z]');
                                    RegExp numberRegExp = RegExp(r'\d');
                                    if (value?.isEmpty ?? true) {
                                      return 'You Must enter your Name!';
                                    } else if (nameRegExp.hasMatch(value!)) {
                                      return null;
                                    } else {
                                      return 'Enter Vaild Name';
                                    }
                                  },
                                  onSaved: (val) {
                                    name = val!;
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onSaved: (val) {
                                    rollno = val!;
                                  },
                                  validator: (val) {
                                    if (val?.isEmpty ?? true) {
                                      return 'Enter your Roll Number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Roll Number',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onSaved: (val) {
                                    className = val!;
                                  },
                                  validator: (value) {
                                    RegExp nameRegExp = RegExp('[0-9]');
                                    RegExp numberRegExp = RegExp(r'\d');
                                    if (value?.isEmpty ?? true) {
                                      return 'You Must enter your class!';
                                    } else if (nameRegExp.hasMatch(value!)) {
                                      return null;
                                    } else {
                                      return 'Enter Vaild class';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Class',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email cannot be empty"; // Handle empty case
                                    } else if (!Fzregex.hasMatch(value, FzPattern.email)) {
                                      return "Enter Valid Email address"; // Handle invalid email format
                                    } else {
                                      return null; // Valid email
                                    }
                                  },
                                  onSaved: (value) {
                                    email = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'E-Mail',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    String pattern =
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    RegExp regExp = new RegExp(pattern);
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    phno = val!;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                child: Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Bouncing(
                          onPress: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ProcessingRequest(),
                                  ));
                            }
                            ;
                          },
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 0.0,
                            minWidth: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Text(
                              "Request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
*/