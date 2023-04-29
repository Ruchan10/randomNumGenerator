import 'dart:math';

class randNum {
  Random random = Random();
  int getRandNum() {
    return random.nextInt(100);
  }
}
