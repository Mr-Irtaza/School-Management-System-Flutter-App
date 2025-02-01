import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart'; // Import the new random color package

class SubjectCard extends StatelessWidget {
  final String subjectname;
  final String chapter;
  final String date;
  final String time;
  final String grade;
  final String mark;

  // Use required keyword for non-nullable parameters
  SubjectCard({
    Key? key, // Use Key? for null safety
    required this.subjectname,
    required this.chapter,
    required this.date,
    required this.time,
    required this.grade,
    required this.mark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // Generate a random color using flutter_randomcolor
    Color randomColor = RandomColor.getColorObject(Options(
      colorType: ColorType.random, // You can specify the color type here
      luminosity: Luminosity.light, // You can specify luminosity here
    ));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 13,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: randomColor, // Use the generated random color
                  ),
                  height: height * 0.1,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        subjectname,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "$chapter chapters",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Marks: $mark",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Grade: $grade",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:randomizer/randomizer.dart';

class SubjectCard extends StatelessWidget {
  Randomizer randomcolor = Randomizer();
  final String subjectname;
  final String chapter;
  final String date;
  final String time;
  final String grade;
  final String mark;

  SubjectCard({Key key, this.subjectname, this.chapter, this.date, this.time, this.grade, this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 13,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: randomcolor.getrandomcolor(),
                  ),
                  height: height * 0.1,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${subjectname}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "${chapter} chapters",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "${date}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "${time}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Marks:${mark}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Grade:${grade}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/