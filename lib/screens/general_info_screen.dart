import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              /*
      Maneira clássica de adicionar uma
      borda. Vamos simplesmente circular
      as bordas do container.
      */
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // Fazendo a borda circular.
                borderRadius: BorderRadius.circular(15),

                // Colocando borda em todos os lados.
                border: Border.all(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
              // Arredondando também a imagem.
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/fabricacao.jpg',
                    width: 200,
                  )),
            ),
            const Text("Fabricação",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  letterSpacing: 2, // Default is one
                )),
            const Text(
              "Inspirados nas fábricas de queijos tradicionais, desenvolvemos processos sob medida e inovadores, para a produção com a mais alta qualidade em um ambiente moderno e alegre. \nNosso produto substitui a coalhada por um purê de castanha de cajú. Culturas de Bactérias são adicionadas e o processo de fermentação se inicia. Após esta longa etapa nossos produtos são enformados e salgados a mão, um a um. Todos os dias são cuidadosamente virados até o momento da comercialização. A maturação dará sabor e textura no final do processo.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class StudentScreen2 extends StatelessWidget {
  const StudentScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            /*
  Maneira clássica de adicionar uma
  borda. Vamos simplesmente circular
  as bordas do container.
  */
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              // Fazendo a borda circular.
              borderRadius: BorderRadius.circular(15),

              // Colocando borda em todos os lados.
              border: Border.all(
                color: Colors.black,
                width: 4.0,
              ),
            ),
            // Arredondando também a imagem.
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  '/images/pessoa1.jpg',
                  width: 200,
                )),
          ),
          const Text("Wallace Silva",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                letterSpacing: 2, // Default is one
              )),
          const Text(
            "Estudante de Programação da Faculdade de Tecnologia da Unicamp. Desenvolvendo aplicativo em Flutter para Android",
            style: TextStyle(
                fontSize: 10,
                color: Colors.purple,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
*/