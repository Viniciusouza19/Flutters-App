import 'package:flutter/material.dart';
import 'package:jogodaveias/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  String _jog1 = 'X';
  String _jog2 = 'O';

  String get jog1 => _jog1;

  @override
  Widget build(BuildContext context) {
    TextEditingController jog1 = new TextEditingController();
    TextEditingController jog2 = new TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Jogo da Velha',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green, Colors.blue, Colors.red],
                ),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: GradientTemplate.gradientTemplate[3].colors.last
                        .withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Digite o nome dos Jogadores',
                      style: TextStyle(fontSize: 30),
                      selectionColor: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: jog1,
                            decoration: const InputDecoration(
                              labelText: 'Nome do jogador X',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite o nome do jogador X';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: jog2,
                            decoration: const InputDecoration(
                              labelText: 'Nome do jogador O',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite o nome do jogador O';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _jog1 = jog1.text;
                                  _jog2 = jog2.text;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => GameScreen(
                                          jog1: jog1.text.substring(0, 4),
                                          jog2: jog2.text.substring(0, 4)),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: const Text('Jogar',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get jog2 => _jog2;
}

class GradientTemplate {
  static List<Gradient> gradientTemplate = [
    const LinearGradient(
      colors: [
        Color(0xFFf80759),
        Color(0xFFbc4e9c),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFF11998e),
        Color(0xFF38ef7d),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFfc4a1a),
        Color(0xFFf7b733),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFF396afc),
        Color(0xFF2948ff),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFf12711),
        Color(0xFFf5af19),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFee0979),
        Color(0xFFff6a00),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFff9966),
        Color(0xFFff5e62),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFc471f5),
        Color(0xFFfa71cd),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFf43b47),
        Color(0xFF453a94),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFff4e50),
        Color(0xFFf9d423),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
