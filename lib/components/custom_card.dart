import 'package:flutter/material.dart';
import 'package:fatecflix/model/filme.dart';
import 'package:fatecflix/screens/filme_detalhes.dart';

class CustomCard extends StatelessWidget {
  final Filme filme;

  const CustomCard({required this.filme, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF424242),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Image.asset(
          filme.caminhoPoster,
          fit: BoxFit.cover,
          width: 50,
        ),
        title: Text(filme.titulo, style: TextStyle(color: Colors.white)),
        subtitle: Text('${filme.anoLancamento}',
            style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilmeDetalhesPage(filme: filme)),
          );
        },
      ),
    );
  }
}
