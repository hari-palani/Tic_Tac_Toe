import 'main.dart';

class Control {
  List<List<String>> matrix = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  String swap(String char) {
    if (char == "X") {
      return "O";
    } else {
      return "X";
    }
  }

  // ignore: body_might_complete_normally_nullable
  bool? finished() {
    bool? win;
    //
    for (int i = 0; i < 3; i++) {
      win = true;
      for (int j = 0; j < 3; j++) {
        if (matrix[i][j] != playercharacter) {
          win = false;
          break;
        }
      }
      if (win == true) {
        return win;
      }
    }
    for (int i = 0; i < 3; i++) {
      win = true;
      for (int j = 0; j < 3; j++) {
        if (matrix[j][i] != playercharacter) {
          win = false;
          break;
        }
      }
      if (win == true) {
        return win;
      }
    }
    for (int i = 0; i < 3; i++) {
      win = true;
      if (matrix[i][i] != playercharacter) {
        win = false;
        break;
      }
    }
    if (win == true) {
      return win;
    }

    for (int i = 0; i < 3; i++) {
      win = true;
      if (matrix[3 - i - 1][i] != playercharacter) {
        win = false;
        break;
      }
    }
    if (win == true) return win;
  }
}
