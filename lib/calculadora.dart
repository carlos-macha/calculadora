import 'package:flutter/material.dart';

class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  String numero = '0';
  String sinais = '';
  double PrimeiroNumero = 0.0;

//define o espaço entre as colunas
  SizedBox espaco() {
    return SizedBox(
      width: 5,
    );
  }

//define o espaço entre as linhas
  SizedBox espaco2() {
    return SizedBox(
      height: 5,
    );
  }

//construtor do botao
  FilledButton but(String te) {
    return FilledButton(
      onPressed: () {
        calcular(te);
      },
      child: Container(
          width: 20,
          height: 50,
          child: Center(
              child: Text(
            te,
            style: TextStyle(fontSize: 15),
          ))),
    );
  }

//logica da calculadora
  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        setState(() {
          numero += tecla;

          if (!numero.contains('.')) {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
        });
        break;
      case 'AC':
        setState(() {
          numero = '0';
          PrimeiroNumero =  0.0;
        });
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        setState(() {
          sinais = tecla;
          PrimeiroNumero = double.parse(numero);
          numero = '0';
        });

        break;
      case '=':
        double resultado = 0.0;
        switch (sinais) {
          case '+':
            resultado = PrimeiroNumero + double.parse(numero);
            break;
          case '-':
            resultado = PrimeiroNumero - double.parse(numero);
            break;
          case '*':
            resultado = PrimeiroNumero * double.parse(numero);
            break;
          case '/':
            if (numero != '0') {
              resultado = PrimeiroNumero / double.parse(numero);
            }
            break;
        }
        setState(() {
          numero = resultado.toString();
        });
        break;
      case '<x':
        setState(() {
          if (numero.length > 1) {
            numero = numero.substring(0, numero.length - 1);
          } else {
            numero = '0';
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 213, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 71, 3, 83),
          title: Center(
              child: Text(
            'calculadoa',
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(''),
                SizedBox(
                  width: 250,
                ),
                Text(
                  numero,
                  style: TextStyle(
                      fontSize: 50, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                but('AC'),
                SizedBox(
                  width: 150,
                ),
                but('<x'),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                but('7'),
                espaco(),
                but('8'),
                espaco(),
                but('9'),
                espaco(),
                but('/'),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                but('4'),
                espaco(),
                but('5'),
                espaco(),
                but('6'),
                espaco(),
                but('*'),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                but('1'),
                espaco(),
                but('2'),
                espaco(),
                but('3'),
                espaco(),
                but('-'),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                but('0'),
                espaco(),
                but('.'),
                espaco(),
                but('='),
                espaco(),
                but('+'),
              ],
            ),
            espaco2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
