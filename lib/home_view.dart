import 'package:flutter/material.dart';
import 'package:tictac/game_logic.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String activeplayer = 'X';
  bool gameover = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isswitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SwitchListTile.adaptive(
                title: const Text(
                  'Turn On/Off Two Player',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                value: isswitch,
                onChanged: (newvalue) {
                  setState(() {
                    isswitch = newvalue;
                  });
                }),
            Text('it\'s $activeplayer turn'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 52,
                )),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: List.generate(
                    9,
                    (index) => InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: gameover ? null : () => _ontap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).shadowColor,
                            ),
                            child: Center(
                              child: Text(
                                Player.playerx.contains(index)
                                    ? 'X'
                                    : Player.playery.contains(index)
                                        ? 'O'
                                        : '',
                                style: TextStyle(
                                    color: Player.playerx.contains(index)
                                        ? Colors.blue
                                        : Colors.red,
                                    fontSize: 52),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Text(result.toUpperCase(),
                style: const TextStyle(
                  fontSize: 42,
                )),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
              onPressed: () {
                setState(() {
                  activeplayer = 'X';
                  gameover = false;
                  turn = 0;
                  result = '';
                  Player.playerx = [];
                  Player.playery = [];
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text('Repeat the game'),
            )
          ],
        ),
      )),
    );
  }

  _ontap(int index) async {
    if ((!Player.playerx.contains(index) || Player.playerx.isEmpty) &&
        (!Player.playery.contains(index) || Player.playery.isEmpty)) {
      game.playgame(index, activeplayer);
      update();
    }
    if (!isswitch && !gameover&&turn!=9) {
      await game.autoplay(activeplayer);
      update();
    }
  }

  void update() {
    setState(() {
      activeplayer = activeplayer == 'X' ? 'O' : 'X';
      turn++;
      String check = game.checkwinner();
      if (check != '') {
        gameover = true;
        result = '$check is the winner';
      } else if (!gameover && turn == 9) {
        result = 'GAME OVER';
      }
    });
  }
}
