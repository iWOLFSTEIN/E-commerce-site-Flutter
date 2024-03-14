import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final ProductEntity productEntity;

  const ItemDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [Image.network(productEntity.image)],
              )),
              const Expanded(child: SizedBox())
            ],
          ),
        ],
      )),
    );
  }
}
