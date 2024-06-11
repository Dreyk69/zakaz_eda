import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../../../app/blocs/get_data_bloc/get_data_bloc.dart';
import '../../../../constants/const_list.dart';
import '../../../../constants/styles/colors.dart';
import '../../../../constants/styles/images.dart';

@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  void _showPaymentDialog1(BuildContext context, String address) {
    String? selectedPaymentMethod;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Выбирите метод оплаты'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Оплата при получении'),
                    leading: Radio<String>(
                      value: 'Оплата при получении',
                      groupValue: selectedPaymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Оплата картой'),
                    leading: Radio<String>(
                      value: 'Оплата картой',
                      groupValue: selectedPaymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Продолжить'),
                  onPressed: () {
                    if (address != '') {
                      Navigator.of(context).pop();
                      _showPaymentDialog2(); 
                    } else {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Введите свой адрес')),
                    );
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPaymentDialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Подтвердите заказ'),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Номер вашего заказ 34230467, оплата при получение. Приятного ожидания')
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Ваш заказ в пути')),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
  
  bool _signInRequired = false;
  String textField1Value = '';
  Map<String, dynamic>? dataUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDataBloc(myUserRepository: context.read<AuthBloc>().userRepository),
      child: BlocBuilder<GetDataBloc, GetDataState>(
        builder: (context, state) {
          if (state is GetDataInitial) {
            _signInRequired = false;
          } else if (state is GetDataProcess) {
            _signInRequired = true;
          } else if (state is GetDataSuccess) {
            _signInRequired = false;
            dataUser = state.user;
          } else if (state is GetDataFailure) {
            _signInRequired = false;
          }
          return !_signInRequired
                        ? Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              label: const Text('Заказать'),
              backgroundColor: mainColor,
              onPressed: () {
                _showPaymentDialog1(context, dataUser?['address']);
              },
            ),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                backgroundColor: backgroundColor,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(170),
                  child: Column(
                    children: [
                      logoZakaz,
                      const Text('Ваш заказ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
              SliverList(
                key: const PageStorageKey<String>('ordersList'),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CardBludo(
                      foto: fotoEdaZakaz[index],
                      nazvanie: nameEdaZakaz[index],
                      cena: cenaEdaZakaz[index],
                    );
                  },
                  childCount: fotoEdaZakaz.length,
                ),
              )
            ]),
          ) : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CardBludo extends StatefulWidget {
  final String foto;
  final String nazvanie;
  final String cena;
  const CardBludo({
    super.key,
    required this.foto,
    required this.nazvanie,
    required this.cena,
  });

  @override
  State<CardBludo> createState() => _CardBludoState();
}

class _CardBludoState extends State<CardBludo> {
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
                            onPressed: () {},
                            child: const Text('Удалить',
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
