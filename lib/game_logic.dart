import 'dart:core';

import 'dart:math';

class Player {
  static const String x = 'X';
  static const String o = 'O';
  static List<int> playerx = [];
  static List<int> playery = [];
}

extension Containall on List {
  bool containall(int x, int y, [z]) {
    if (z != null) {
      return contains(x) && contains(y) && contains(z);
    } else {
      return contains(x) && contains(y);
    }
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
    } else if (Player.playery.containall(0, 1, 2) ||
        Player.playery.containall(3, 4, 5) ||
        Player.playery.containall(6, 7, 8) ||
        Player.playery.containall(0, 3, 6) ||
        Player.playery.containall(1, 4, 7) ||
        Player.playery.containall(2, 5, 8) ||
        Player.playery.containall(0, 4, 8) ||
        Player.playery.containall(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }

    return winner;
  }

  Future<void> autoplay(activeplayer) async {
    int x = 0;
    int index = 0;
    List<int> empty = [];
    for (int i = 0; i < 9; i++) {
      x = i;
      if (!(Player.playerx.contains(i) || Player.playery.contains(i))) {
        empty.add(i);
      }
    }
    //1 o
    if (Player.playery.containall(0, 1) && empty.contains(2)) {
      index = 2;
    } else if (Player.playery.containall(3, 4) && empty.contains(5)) {
      index = 5;
    } else if (Player.playery.containall(6, 7) && empty.contains(8)) {
      index = 8;
    } else if (Player.playery.containall(0, 3) && empty.contains(6)) {
      index = 6;
    } else if (Player.playery.containall(1, 4) && empty.contains(7)) {
      index = 7;
    } else if (Player.playery.containall(2, 5) && empty.contains(8)) {
      index = 8;
    } else if (Player.playery.containall(0, 4) && empty.contains(8)) {
      index = 8;
    } else if (Player.playery.containall(2, 4) && empty.contains(6)) {
      index = 6;
    }
    //2 o
    else if (Player.playery.containall(0, 2) && empty.contains(1)) {
      index = 1;
    } else if (Player.playery.containall(3, 5) && empty.contains(4)) {
      index = 4;
    } else if (Player.playery.containall(6, 8) && empty.contains(7)) {
      index = 7;
    } else if (Player.playery.containall(0, 6) && empty.contains(3)) {
      index = 3;
    } else if (Player.playery.containall(1, 7) && empty.contains(4)) {
      index = 4;
    } else if (Player.playery.containall(2, 8) && empty.contains(5)) {
      index = 5;
    } else if (Player.playery.containall(0, 8) && empty.contains(4)) {
      index = 4;
    } else if (Player.playery.containall(2, 6) && empty.contains(4)) {
      index = 4;
    }
    //3 o
    else if (Player.playery.containall(2, 1) && empty.contains(0)) {
      index = 0;
    } else if (Player.playery.containall(5, 4) && empty.contains(3)) {
      index = 3;
    } else if (Player.playery.containall(8, 7) && empty.contains(6)) {
      index = 6;
    } else if (Player.playery.containall(6, 3) && empty.contains(0)) {
      index = 0;
    } else if (Player.playery.containall(7, 4) && empty.contains(1)) {
      index = 1;
    } else if (Player.playery.containall(8, 5) && empty.contains(2)) {
      index = 2;
    } else if (Player.playery.containall(8, 4) && empty.contains(0)) {
      index = 0;
    } else if (Player.playery.containall(6, 4) && empty.contains(2)) {
      index = 2;
    }
//1
    else if (Player.playerx.containall(0, 1) && empty.contains(2)) {
      index = 2;
    } else if (Player.playerx.containall(3, 4) && empty.contains(5)) {
      index = 5;
    } else if (Player.playerx.containall(6, 7) && empty.contains(8)) {
      index = 8;
    } else if (Player.playerx.containall(0, 3) && empty.contains(6)) {
      index = 6;
    } else if (Player.playerx.containall(1, 4) && empty.contains(7)) {
      index = 7;
    } else if (Player.playerx.containall(2, 5) && empty.contains(8)) {
      index = 8;
    } else if (Player.playerx.containall(0, 4) && empty.contains(8)) {
      index = 8;
    } else if (Player.playerx.containall(2, 4) && empty.contains(6)) {
      index = 6;
    }
    //2
    else if (Player.playerx.containall(0, 2) && empty.contains(1)) {
      index = 1;
    } else if (Player.playerx.containall(3, 5) && empty.contains(4)) {
      index = 4;
    } else if (Player.playerx.containall(6, 8) && empty.contains(7)) {
      index = 7;
    } else if (Player.playerx.containall(0, 6) && empty.contains(3)) {
      index = 3;
    } else if (Player.playerx.containall(1, 7) && empty.contains(4)) {
      index = 4;
    } else if (Player.playerx.containall(2, 8) && empty.contains(5)) {
      index = 5;
    } else if (Player.playerx.containall(0, 8) && empty.contains(4)) {
      index = 4;
    } else if (Player.playerx.containall(2, 6) && empty.contains(4)) {
      index = 4;
    }
    //3
    else if (Player.playerx.containall(2, 1) && empty.contains(0)) {
      index = 0;
    } else if (Player.playerx.containall(5, 4) && empty.contains(3)) {
      index = 3;
    } else if (Player.playerx.containall(8, 7) && empty.contains(6)) {
      index = 6;
    } else if (Player.playerx.containall(6, 3) && empty.contains(0)) {
      index = 0;
    } else if (Player.playerx.containall(7, 4) && empty.contains(1)) {
      index = 1;
    } else if (Player.playerx.containall(8, 5) && empty.contains(2)) {
      index = 2;
    } else if (Player.playerx.containall(8, 4) && empty.contains(0)) {
      index = 0;
    } else if (Player.playerx.containall(6, 4) && empty.contains(2)) {
      index = 2;
    } else {
      Random random = Random();
      
        int randomindex = random.nextInt(empty.length);
        index = empty[randomindex];
      
    }
    playgame(index, activeplayer);
  }
}
