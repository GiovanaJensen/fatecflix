class Filme {
  final String titulo;
  final String sinopse;
  final String caminhoPoster;
  final List<String> elenco;
  final int anoLancamento;
  final String genero;

  Filme({
    required this.titulo,
    required this.sinopse,
    required this.elenco,
    required this.anoLancamento,
    required this.genero,
    required this.caminhoPoster,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'sinopse': sinopse,
      'caminhoPoster': caminhoPoster,
      'elenco': elenco,
      'anoLancamento': anoLancamento,
      'genero': genero,
    };
  }

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      titulo: json['titulo'],
      sinopse: json['sinopse'],
      caminhoPoster: json['caminhoPoster'],
      elenco: List<String>.from(json['elenco']),
      anoLancamento: json['anoLancamento'],
      genero: json['genero'],
    );
  }
}
