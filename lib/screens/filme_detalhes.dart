import 'package:flutter/material.dart';
import 'package:fatecflix/model/filme.dart';

class FilmeDetalhesPage extends StatelessWidget {
  final Filme filme;

  FilmeDetalhesPage({required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      appBar: AppBar(
        title: Text(filme.titulo),
        backgroundColor: Color(0xFF101010),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(filme.caminhoPoster),
              SizedBox(height: 16.0),
              Text(
                filme.titulo,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text('Ano de Lançamento: ${filme.anoLancamento}',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 8.0),
              Text('Gênero: ${filme.genero}',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 16.0),
              Text(
                'Sinopse',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text(filme.sinopse, style: TextStyle(color: Colors.white)),
              SizedBox(height: 16.0),
              Text(
                'Elenco Principal',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8.0),
              ...filme.elenco
                  .map((ator) =>
                      Text(ator, style: TextStyle(color: Colors.white)))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
