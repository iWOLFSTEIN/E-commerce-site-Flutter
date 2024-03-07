import 'package:e_commerce_site/presentation/pages/clothes_page.dart';
import 'package:e_commerce_site/presentation/widgets/home/app_bar_menu_item.dart';
import 'package:e_commerce_site/presentation/widgets/home/selected_items_thread.dart';
import 'package:e_commerce_site/presentation/widgets/responsive_layout.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: mobileLayout(),
      desktop: desktopLayout(),
    );
  }

  Scaffold desktopLayout() {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          appBarDesktop(),
          body(sidePadding: Spacing.standard * 2),
        ],
      )),
    );
  }

  Scaffold mobileLayout() {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Column(
        children: [
          appBarMobile(),
          body(sidePadding: Spacing.standard),
        ],
      )),
      drawer: Drawer(
        backgroundColor: AppColors.background,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Spacing.standard, vertical: Spacing.standard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ViewConstants.categories,
                style: TextStyle(
                    fontSize: FontSize.xlarge, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: Spacing.standard,
              ),
              drawerMenuItem(ViewConstants.men),
              drawerMenuItem(ViewConstants.women),
              drawerMenuItem(ViewConstants.kids),
              drawerMenuItem(ViewConstants.brands),
            ],
          ),
        ),
      ),
    );
  }

  Container drawerMenuItem(String title) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: Spacing.standard),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(fontSize: FontSize.regular),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        ));
  }

  Expanded body({required double sidePadding}) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: page(),
        ),
      ),
    );
  }

  Column page() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Spacing.standard,
        ),
        SelectedItemsThread(),
        SizedBox(
          height: Spacing.standard * 3,
        ),
        ClothesPage(),
      ],
    );
  }

  Padding appBarMobile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.standard),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Spacing.large),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          children: [
            InkWell(
                hoverColor: AppColors.background,
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(Icons.menu)),
            const SizedBox(
              width: Spacing.standard,
            ),
            appTitle(),
            const Expanded(child: SizedBox()),
            actionRow(width: Spacing.standard)
          ],
        ),
      ),
    );
  }

  Padding appBarDesktop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.standard * 2),
      child: Container(
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
            appTitle(),
            const Spacer(
              flex: 7,
            ),
            actionRow()
          ],
        ),
      ),
    );
  }

  Row actionRow({double? width}) {
    width = width ?? Responsive.width(context) * 1.5;
    return Row(
      children: [
        appBarIcon(Icons.search_outlined),
        SizedBox(
          width: width,
        ),
        appBarIcon(Icons.person_outlined),
        SizedBox(
          width: width,
        ),
        appBarIcon(Icons.favorite_outline_outlined),
        SizedBox(
          width: width,
        ),
        appBarIcon(Icons.shopping_bag_outlined),
      ],
    );
  }

  Text appTitle() {
    return Text(
      ViewConstants.appTitle.toUpperCase(),
      style: const TextStyle(
          fontSize: FontSize.xlarge, fontWeight: FontWeight.w500),
    );
  }

  Icon appBarIcon(IconData icon) => Icon(
        icon,
        size: 22,
        weight: 1.0,
      );
}
