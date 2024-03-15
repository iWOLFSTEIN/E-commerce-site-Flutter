import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Image.network(
                      'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg')
                ],
              )),
              const Expanded(child: SizedBox())
            ],
          ),
        ],
      ),
    );
  }
}
