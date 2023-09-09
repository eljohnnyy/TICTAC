class Player{
static const String x='X';
static const String o='O';
static List<int>playerx=[];
static List<int>playery=[];
}
class Game{
  void playgame(int index, String activeplayer) {
if(activeplayer=='X'){
  Player.playerx.add(index);
}
else{
  Player.playery.add(index);
}

  }
checkwinner(){}
autoplay(){}
}