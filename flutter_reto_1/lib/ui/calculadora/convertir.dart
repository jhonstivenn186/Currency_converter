import 'package:flutter/material.dart';

class Convertir extends StatefulWidget {
  const Convertir({super.key});

  @override
  State<Convertir> createState() => _ConvertirState();
}

class _ConvertirState extends State<Convertir> {
  bool pesoOrigen = false;
  bool dolarOrigen = false;
  bool euroOrigen = false;

  bool pesoDestino = false;
  bool dolarDestino = false;
  bool euroDestino = false;

  TextEditingController divA = TextEditingController();
  TextEditingController divB = TextEditingController();

  void cambiarestadoOrigen(String moneda) {
    if (moneda == 'P') {
      pesoOrigen = pesoOrigen ? false : true;
      if (pesoOrigen == true) {
        dolarOrigen = false;
        euroOrigen = false;
      }
    } else if (moneda == 'D') {
      dolarOrigen = dolarOrigen ? false : true;
      if (dolarOrigen == true) {
        pesoOrigen = false;
        euroOrigen = false;
      }
    } else if (moneda == 'E') {
      euroOrigen = euroOrigen ? false : true;
      if (euroOrigen == true) {
        dolarOrigen = false;
        pesoOrigen = false;
      }
    }

    print(pesoOrigen);

    setState(() {});
  }

  void cambiarestadoDestino(String moneda) {
    if (moneda == 'P') {
      pesoDestino = pesoDestino ? false : true;
      if (pesoDestino == true) {
        dolarDestino = false;
        euroDestino = false;
      }
    } else if (moneda == 'D') {
      dolarDestino = dolarDestino ? false : true;
      if (dolarDestino == true) {
        pesoDestino = false;
        euroDestino = false;
      }
    } else if (moneda == 'E') {
      euroDestino = euroDestino ? false : true;
      if (euroDestino == true) {
        dolarDestino = false;
        pesoDestino = false;
      }
    }

    print(pesoOrigen);

    setState(() {});
  }

  void valores(String p) {
    divA.text = divA.text + p;
    conversion();
  }

  void conversion() {
    if (pesoOrigen && dolarDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen / 4800).toString();
    } else if (pesoOrigen && euroDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen / 4924).toString();
    } else if (pesoOrigen && pesoDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen / 1).toString();
    }
    if (dolarOrigen && dolarDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen / 1).toString();
    } else if (dolarOrigen && pesoDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen * 4800).toString();
    } else if (dolarOrigen && euroDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen * 1.01).toString();
    }
    if (euroOrigen && euroDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen * 1).toString();
    } else if (euroOrigen && pesoDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen * 4924).toString();
    } else if (euroOrigen && dolarDestino) {
      double valorOrigen = double.parse(divA.text);
      divB.text = (valorOrigen * 0.99).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Convertir Divisas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("valor a convertir"),
                  GestureDetector(
                      onTap: () => cambiarestadoOrigen('P'),
                      child: Monedas(moneda: pesoOrigen, texto: 'P')),
                  GestureDetector(
                      onTap: () => cambiarestadoOrigen('D'),
                      child: Monedas(moneda: dolarOrigen, texto: 'D')),
                  GestureDetector(
                      onTap: () => cambiarestadoOrigen('E'),
                      child: Monedas(moneda: euroOrigen, texto: 'E'))
                ],
              ),
              TextField(
                readOnly: true,
                textAlign: TextAlign.center,
                controller: divA,
                decoration: const InputDecoration(hintText: '0.0'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("conversion"),
                  GestureDetector(
                      onTap: () => cambiarestadoDestino('P'),
                      child: Monedas(moneda: pesoDestino, texto: 'P')),
                  GestureDetector(
                      onTap: () => cambiarestadoDestino('D'),
                      child: Monedas(moneda: dolarDestino, texto: 'D')),
                  GestureDetector(
                      onTap: () => cambiarestadoDestino('E'),
                      child: Monedas(moneda: euroDestino, texto: 'E'))
                ],
              ),
              TextField(
                controller: divB,
                readOnly: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: '0.0'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        valores('7');
                      },
                      child: const Botones(valor: '7')),
                  GestureDetector(
                      onTap: () {
                        valores('8');
                      },
                      child: const Botones(valor: '8')),
                  GestureDetector(
                      onTap: () {
                        valores('9');
                      },
                      child: const Botones(valor: '9')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        valores('4');
                      },
                      child: const Botones(valor: '4')),
                  GestureDetector(
                      onTap: () {
                        valores('5');
                      },
                      child: const Botones(valor: '5')),
                  GestureDetector(
                      onTap: () {
                        valores('6');
                      },
                      child: const Botones(valor: '6')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        valores('1');
                      },
                      child: const Botones(valor: '1')),
                  GestureDetector(
                      onTap: () {
                        valores('2');
                      },
                      /* SizedBox(height: 50), */
                      child: const Botones(valor: '2')),
                  GestureDetector(
                      onTap: () {
                        valores('3');
                      },
                      child: const Botones(valor: '3')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        valores('0');
                      },
                      child: Botones(valor: '0')),
                  GestureDetector(
                      onTap: () {
                        divA.clear();
                        divB.clear();
                      },
                      child: Botones1(valor: 'RESET')),
                ],
              )
            ],
          ),
        ));
  }
}

class Monedas extends StatelessWidget {
  const Monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: moneda == true ? Colors.blue : Colors.amber,
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class Botones1 extends StatelessWidget {
  final String valor;
  const Botones1({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 107,
        height: 70,
        color: Colors.red,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String valor;
  const Botones({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 70,
        color: Colors.amber,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        )),
      ),
    );
  }
}
