import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<List<String>> campos = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  final List<String> jogada = ['X', 'O'];
  late String jogadorAtual = 'X';
  late int jogador = 0;
  late int count = 0;
  late int x = 0;
  late int o = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: TextSpan(
              text: 'X: ',
              style: TextStyle(color: Colors.red[200], fontSize: 30),
              children: <TextSpan>[
                TextSpan(
                  text: x.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const TextSpan(
                  text: ' vs ',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextSpan(
                  text: 'O: ',
                  style: TextStyle(color: Colors.green[200]),
                ),
                TextSpan(
                  text: o.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),

      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Jogador da vez',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              '$jogadorAtual',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10, right: 10),
                children: [
                  for (int x = 0; x < campos.length; x++)
                    for (int y = 0; y < campos[0].length; y++)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: campos[x][y] == 'X'
                              ? Colors.red[200]
                              : campos[x][y] == 'O'
                                  ? Colors.blue[200]
                                  : Colors.green[900],
                        ),
                        onPressed: () {
                          setState(() {
                            if (campos[x][y] == '') {
                              campos[x][y] = jogador == 0 ? jogada[0] : jogada[1];
                              checkForWinner(jogadorAtual) == true
                                  ? alertGame('O jogador: $jogadorAtual venceu')
                                  : count == 8 ? alertGame('Empate!!'): null;
                              jogador == 1 ? jogador = 0 : jogador = 1;
                              jogadorAtual = jogador == 0 ? jogada[0] : jogada[1];

                              count++;
                            }
                          });
                        },
                        child: Text(
                          campos[x][y],
                          style: const TextStyle(
                            fontSize: 80,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool winnerTre(int x, int o,){
    if(o == 3) {
      return true;

    }
    if(x == 3) {
      return true;
    }
    return false;
  }
  void gameClear() {
    jogadorAtual = 'X';
    if(winnerTre(x, o)){
      for (int x = 0; x < campos.length; x++) {
        for (int y = 0; y < campos[0].length; y++) {
          campos[x][y] = '';
        }
      }
      x = 0;
      o = 0;
      count = 0;
      jogadorAtual = 'X';
    }else {
      for (int x = 0; x < campos.length; x++) {
        for (int y = 0; y < campos[0].length; y++) {
          campos[x][y] = '';
        }
      }
      jogadorAtual = 'X';
      count = 0;
    }

  }

  void alertGame(String jogadorA) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.all(20),
          title: Center(child: new Text(jogadorA)),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: EdgeInsets.all(20),
                ),
                child: const Text("Jogar Novamente?"),
                onPressed: () {
                  setState(() {
                    gameClear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  bool checkForWinner(String jogada) {
    for (int i = 0; i < campos.length; i++) {
      bool linhaCompleta = true;
      for (int j = 0; j < campos[i].length; j++) {
        if (campos[i][j] != jogada) {
          linhaCompleta = false;
          break;
        }
      }
      if (linhaCompleta) {
        setState(() {
          jogada == 'X' ? x++ : o++;
        });
        return true;
      }
    }
    for (int i = 0; i < campos[0].length; i++) {
      bool colunaCompleta = true;
      for (int j = 0; j < campos.length; j++) {
        if (campos[j][i] != jogada) {
          colunaCompleta = false;
          break;
        }
      }
      if (colunaCompleta) {
        setState(() {
          jogada == 'X' ? x++ : o++;

        });

        return true;
      }
    }
    bool diagonalPrincipalCompleta = true;
    for (int i = 0; i < campos.length; i++) {
      if (campos[i][i] != jogada) {
        diagonalPrincipalCompleta = false;
        break;
      }
    }
    if (diagonalPrincipalCompleta) {
      setState(() {
        jogada == 'X' ? x++ : o++;

      });

      return true;
    }

    bool diagonalSecundariaCompleta = true;
    for (int i = 0; i < campos.length; i++) {
      if (campos[i][campos.length - i - 1] != jogada) {
        diagonalSecundariaCompleta = false;
        break;
      }
    }
    if (diagonalSecundariaCompleta) {
      setState(() {
        jogada == 'X' ? x++ : o++;

      });

      return true;
    }

    return false;
  }
}
