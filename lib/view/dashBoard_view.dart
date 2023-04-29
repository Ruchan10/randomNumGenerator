import 'package:flutter/material.dart';

import '../model/dashBoard_model.dart';

class dashBoardView extends StatefulWidget {
  const dashBoardView({super.key});

  @override
  State<dashBoardView> createState() => _dashBoardViewState();
}

class _dashBoardViewState extends State<dashBoardView> {
  randNum rn = randNum();

  var gap = const SizedBox(width: 100, height: 100);
  int num0 = 0;
  int num = 0;
  int ca = 0;
  int ia = 0;
  int cAns = 0;
  int count = 0;
  String start = "Click on a button to start";

  // when user presses restart game button
  void restart() {
    ca = 0;
    ia = 0;
    count = 0;
    setState(() {
      ca = 0;
      ia = 0;
    });
  }

  // when user clicks any two of the answers
  void ans(choosenAns) {
    if (count == 0) {
      setState(() {
        num0 = rn.getRandNum();
        num = rn.getRandNum();
        while (num0 == num) {
          num = rn.getRandNum();
        }
        start = "";
      });
      count++;
      return;
    }
    // find the greatest one
    if (num > num0) {
      cAns = num;
    } else {
      cAns = num0;
    }
    if (choosenAns == cAns) {
      ca++;
    } else {
      ia++;
    }
    setState(() {
      // change values in buttons
      num0 = rn.getRandNum();
      num = rn.getRandNum();
      while (num0 == num) {
        num = rn.getRandNum();
      }
    });
    count++;
    if (ca + ia == 10) {
      setState(() {
        num0 = 0;
        num = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Guesser"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Choose the greatest number",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            gap,
            Text(start),
            const SizedBox(height: 25),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (ca + ia == 10) {
                      return;
                    } else {
                      ans(num);
                    }
                  },
                  child: Text("$num"),
                ),
                gap,
                ElevatedButton(
                  onPressed: () {
                    if (ca + ia == 10) {
                      return;
                    } else {
                      ans(num0);
                    }
                  },
                  child: Text("$num0"),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            const Text("Result",
                style: TextStyle(
                  fontSize: 25,
                )),
            Text(
              "Correct Answer:- $ca",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Incorrect Answer:- $ia",
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                restart();
              },
              child: const Text("Restart game"),
            ),
          ],
        ),
      ),
    );
  }
}
