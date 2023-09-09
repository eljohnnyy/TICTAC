import 'dart:core';

import 'dart:math';

class Player {
  static const String x = 'X';
  static const String o = 'O';
  static List<int> playerx = [];
  static List<int> playery = [];
}

extension Containall on List {
  bool containall(int x, int y, int z) {
    return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playgame(int index, String activeplayer) {
    if (activeplayer == 'X') {
      Player.playerx.add(index);
    } else {
      Player.playery.add(index);
    }
  }

  String checkwinner() {
    String winner = '';
    if (Player.playerx.containall(0, 1, 2) ||
        Player.playerx.containall(3, 4, 5) ||
        Player.playerx.containall(6, 7, 8) ||
        Player.playerx.containall(0, 3, 6) ||
        Player.playerx.containall(1, 4, 7) ||
        Player.playerx.containall(2, 5, 8) ||
        Player.playerx.containall(0, 4, 8) ||
        Player.playerx.containall(2, 4, 6)) {
      winner = 'X';
    }
    if (Player.playery.containall(0, 1, 2) ||
        Player.playery.containall(3, 4, 5) ||
        Player.playery.containall(6, 7, 8) ||
        Player.playery.containall(0, 3, 6) ||
        Player.playery.containall(1, 4, 7) ||
        Player.playery.containall(2, 5, 8) ||
        Player.playery.containall(0, 4, 8) ||
        Player.playery.containall(2, 4, 6)) {
      winner = 'O';
    }
    else{
      winner='';
    }

    return winner;
  }

  Future<void> autoplay(activeplayer) async {
    int index = 0;
    List<int> empty = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerx.contains(i) || Player.playery.contains(i))) {
        empty.add(i);
      }
    }
    Random random = Random();
    int randomindex = random.nextInt(empty.length);
    index = empty[randomindex];
    playgame(index, activeplayer);
  }
}
