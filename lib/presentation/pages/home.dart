import 'package:e_commerce_site/presentation/pages/clothes_page.dart';
import 'package:e_commerce_site/presentation/widgets/home/app_bar_menu_item.dart';
import 'package:e_commerce_site/presentation/widgets/home/selected_items_thread.dart';
import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/font_size.dart';
import 'package:e_commerce_site/shared/constants/spacing.dart';
import 'package:e_commerce_site/shared/constants/view_constants.dart';
import 'package:e_commerce_site/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.standard * 2),
        child: Column(
          children: [
            appBar(context),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Spacing.standard,
                    ),
                    SelectedItemsThread(),
                    SizedBox(
                      height: Spacing.standard * 3,
                    ),
                    ClothesPage()
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Container appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Spacing.large),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border))),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBarMenuItem(title: ViewConstants.men),
              SizedBox(
                width: Responsive.width(context) * 3,
              ),
              const AppBarMenuItem(title: ViewConstants.women),
              SizedBox(
                width: Responsive.width(context) * 3,
              ),
              const AppBarMenuItem(title: ViewConstants.kids),
              SizedBox(
                width: Responsive.width(context) * 3,
              ),
              const AppBarMenuItem(title: ViewConstants.brands)
            ],
          ),
          const Spacer(
            flex: 6,
          ),
          Text(
            ViewConstants.appTitle.toUpperCase(),
            style: const TextStyle(
                fontSize: FontSize.xlarge, fontWeight: FontWeight.w500),
          ),
          const Spacer(
            flex: 7,
          ),
          Row(
            children: [
              appBarIcon(Icons.search_outlined),
              SizedBox(
                width: Responsive.width(context) * 1.5,
              ),
              appBarIcon(Icons.person_outlined),
              SizedBox(
                width: Responsive.width(context) * 1.5,
              ),
              appBarIcon(Icons.favorite_outline_outlined),
              SizedBox(
                width: Responsive.width(context) * 1.5,
              ),
              appBarIcon(Icons.shopping_bag_outlined),
            ],
          )
        ],
      ),
    );
  }

  Icon appBarIcon(IconData icon) => Icon(
        icon,
        size: 22,
        weight: 1.0,
      );
}
