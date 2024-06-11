import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/constants/const_list.dart';
import 'package:eda_gotova/constants/styles/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: backgroundColor,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: SearchButton(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CardMaster(
                  foto: fotoEda[index],
                  nazvanie: nameEda[index],
                  cena: cenaEda[index],
                );
              },
              childCount: fotoEda.length,
            ),
          )
        ],
      ),
    );
  }
}

class CardMaster extends StatefulWidget {
  final String foto;
  final String nazvanie;
  final String cena;
  const CardMaster({
    super.key,
    required this.foto,
    required this.nazvanie,
    required this.cena,
  });

  @override
  State<CardMaster> createState() => _CardMasterState();
}

class _CardMasterState extends State<CardMaster> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      elevation: 0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.foto,
            width: 175,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 210,
                child: Text(
                  widget.nazvanie,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    Text(widget.cena,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: FilledButton(
                            onPressed: () {
                              setState(() {
                                fotoEdaZakaz.add(widget.foto);
                                nameEdaZakaz.add(widget.nazvanie);
                                cenaEdaZakaz.add(widget.cena);
                              });
                            },
                            child: const Text('Добавить',
                                style: TextStyle(fontSize: 8)),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text('Информация',
                                style: TextStyle(fontSize: 8)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded),
          const SizedBox(width: 12),
          Text(
            'Поиск блюд',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
