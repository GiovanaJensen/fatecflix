import 'package:fatecflix/components/custom_button.dart';
import 'package:fatecflix/components/custom_card.dart';
import 'package:fatecflix/components/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fatecflix/model/filme.dart';
import 'package:fatecflix/services/filme_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Filme> _filmesFiltrados = [];
  List<Filme> _todosOsFilmes = [];
  List<List<Filme>> _paginasDeFilmesFiltrados = [];
  String _generoSelecionado = 'Todos';
  int _paginaAtual = 0;
  final int _quantidadeDeFilmesPorPagina = 3;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _carregarFilmes();
  }

  void _carregarFilmes() async {
    List<Filme> filmes = await FilmeService.obterFilmes();
    if (filmes.isEmpty) {
      filmes = _criarFilmesPadrao();
      await Future.forEach(filmes, (filme) async {
        await FilmeService.salvarFilme(filme);
      });
    }
    setState(() {
      _todosOsFilmes = filmes;
      _filmesFiltrados = filmes;
      _paginasDeFilmesFiltrados =
          _dividirEmPaginas(filmes, _quantidadeDeFilmesPorPagina);
    });
  }

  List<List<Filme>> _dividirEmPaginas(List<Filme> lista, int tamanhoDaPagina) {
    List<List<Filme>> paginas = [];
    int totalPages = (lista.length / tamanhoDaPagina)
        .ceil(); 

    for (int i = 0; i < totalPages; i++) {
      int inicio = i * tamanhoDaPagina;
      int fim = (i + 1) * tamanhoDaPagina;
      if (fim > lista.length) {
        fim = lista.length;
      }
      paginas.add(lista.sublist(inicio, fim));
    }
    return paginas;
  }

  List<Filme> _criarFilmesPadrao() {
    return [
      Filme(
          titulo: 'Viúva Negra',
          genero: 'Ação',
          caminhoPoster: "lib/assets/images/black_widow_poster.jpg",
          anoLancamento: 2021,
          sinopse:
              "Ao nascer, a Viúva Negra, então conhecida como Natasha Romanova, é entregue à KGB, que a prepara para se tornar sua agente suprema. Porém, o seu próprio governo tenta matá-la quando a União Soviética se desfaz.",
          elenco: [
            "Scarlett Johansson",
            "Florence Pugh",
            "Rachel Weisz",
            "David Harbour"
          ]),
      Filme(
          titulo: 'Vingadores: Ultimato',
          genero: 'Ação',
          caminhoPoster: "lib/assets/images/vingadores_poster.jpg",
          anoLancamento: 2019,
          sinopse:
              "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.",
          elenco: [
            "Robert Downey Jr.",
            "Chris Evans",
            "Mark Ruffalo",
            "Chris Hemsworth"
          ]),
      Filme(
          titulo: 'The Crown',
          genero: 'Drama',
          caminhoPoster: "lib/assets/images/the_crown_poster.jpg",
          anoLancamento: 2016,
          sinopse:
              "The Crown acompanha a ascensão de Elizabeth II ao trono inglês após a morte de seu pai em 1952. O drama explora as complexidades por traz da monarquia da Inglaterra e apresenta importantes eventos históricos do século passado.",
          elenco: [
            "Imelda Staunton",
            "Jonathan Price",
            "Elizabeth Debicki",
            "Dominic West"
          ]),
      Filme(
          titulo: 'The Eras Tour',
          genero: 'Drama',
          caminhoPoster: "lib/assets/images/the_eras_tour_poster.jpg",
          anoLancamento: 2023,
          sinopse:
              "Taylor Swift: The Eras Tour é a gravação dos shows da The Eras Tour, performada pelo fenômeno mundial Taylor Swift. A cantora lançou seu primeiro álbum em 2006, enquanto ainda estava associada à gravadora Big Machine Records. O filme documenta três apresentações de Swift no SoFi Stadium, durante a turnê mundial de 2023/2024 - sexta na carreira de Taylor. Com direção de Sam Wrench e produção da própria cantora, o longa bateu o recorde de 37 milhões de dólares em seu primeiro dia de pré-vendas nos Estados Unidos. O show possui mais de três horas de duração, e conta com um setlist formado por 44 músicas.",
          elenco: ["Taylor Swift"]),
      Filme(
          titulo: 'Divertida mente',
          genero: 'Animação',
          caminhoPoster: "lib/assets/images/inside_out_poster.jpg",
          anoLancamento: 2015,
          sinopse:
              "Riley é uma garota divertida de 11 anos de idade, que deve enfrentar mudanças importantes em sua vida quando seus pais decidem deixar a sua cidade natal, no estado de Minnesota, para viver em San Francisco. Dentro do cérebro de Riley, convivem várias emoções diferentes, como a Alegria, o Medo, a Raiva, o Nojinho e a Tristeza. A líder deles é Alegria, que se esforça bastante para fazer com que a vida de Riley seja sempre feliz. Entretanto, uma confusão na sala de controle faz com que ela e Tristeza sejam expelidas para fora do local. Agora, elas precisam percorrer as várias ilhas existentes nos pensamentos de Riley para que possam retornar à sala de controle - e, enquanto isto não acontece, a vida da garota muda radicalmente.",
          elenco: ["Miá Mello", "Amy Poehler", "Otaviano Costa"]),
      Filme(
          titulo: 'Moana',
          genero: 'Animação',
          caminhoPoster: "lib/assets/images/moana_poster.jpg",
          anoLancamento: 2017,
          sinopse:
              "Moana Waialiki é uma corajosa jovem, filha única do chefe de uma tribo na Oceania, vinda de uma longa linhagem de navegadores. Quando os pescadores de sua ilha não conseguem pescar nenhum peixe e as colheitas falham, ela descobre que o semideus Maui causou a praga ao roubar o coração da deusa Te Fiti. Entusiasta das viagens marítimas, a jovem se vê querendo descobrir mais sobre seu passado e ajudar a comunidade, mesmo que a família queira proteger Moana a qualquer custo. Então, ela resolve partir em busca de seus ancestrais, habitantes de uma ilha mítica que ninguém sabe onde é. A única maneira de curar a ilha é persuadir Maui a devolver o coração de Te Fiti, então Moana parte em uma jornada épica pelo Pacífico. Moana começa sua jornada em mar aberto, onde enfrenta terríveis criaturas marinhas e descobre histórias do submundo. O filme é baseado em histórias da mitologia polinésia.",
          elenco: ["Auli'i Cravalho", "Dwayne Johnson", "Alan Tudyk"]),
    ];
  }

  void _filtrarFilmes(String genero) {
    setState(() {
      if (genero == 'Todos') {
        _filmesFiltrados = _todosOsFilmes;
      } else {
        _filmesFiltrados =
            _todosOsFilmes.where((filme) => filme.genero == genero).toList();
      }
      _generoSelecionado = genero;
      _paginasDeFilmesFiltrados =
          _dividirEmPaginas(_filmesFiltrados, _quantidadeDeFilmesPorPagina);
      _paginaAtual = 0;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF101010),
    appBar: AppBar(
      title: const Text('FatecFlix', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color(0xFF101010),
      actions: [
        IconButton(
          icon: const Icon(Icons.info, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xFF424242),
                  title: const Text('Integrantes do Grupo',
                      style: TextStyle(color: Colors.white)),
                  content: const Text(
                      'Arthur Henrique Pinheiro\nGiovana de Oliveira Fernandes\nOtávio Alexandre',
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    CustomButton(
                      text: 'Fechar',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        CustomDropdown(
          value: _generoSelecionado,
          items: const ['Todos', 'Drama', 'Ação', 'Animação'],
          onChanged: (String? newValue) {
            if (newValue != null) {
              _filtrarFilmes(newValue);
            }
          },
        ),
      ],
    ),
    body: _filmesFiltrados.isEmpty
        ? const Center(
            child: Text('Nenhum filme encontrado',
                style: TextStyle(color: Colors.white)))
        : Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: _paginasDeFilmesFiltrados.length,
                  controller: _pageController,
                  onPageChanged: (int pagina) {
                    setState(() {
                      _paginaAtual = pagina;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListView.builder(
                      itemCount: _paginasDeFilmesFiltrados[index].length,
                      itemBuilder: (BuildContext context, int filmeIndex) {
                        return CustomCard(
                            filme: _paginasDeFilmesFiltrados[index]
                                [filmeIndex]);
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      if (_paginaAtual > 0) {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                        setState(() {
                          _paginaAtual--;
                        });
                      }
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        if (_paginaAtual <
                            _paginasDeFilmesFiltrados.length - 1) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          setState(() {
                            _paginaAtual++;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_forward))
                ],
              )
            ],
          ));
}
}