import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/categories/categories_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/pages/clothes_page.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/home/app_bar_menu_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/home/selected_items_thread.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/responsive_layout.dart';
import 'package:e_commerce_site/core/constants/app_assets.dart';
import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/app_icons.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SafeArea(child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesDone) {
            return Column(
              children: [
                appBarDesktop(state.categoriesEntity?.categories),
                body(sidePadding: Spacing.standard * 2),
              ],
            );
          } else if (state is CategoriesException) {
            return const Center(
              child: Text(ViewConstants.couldNotLoadThePage),
            );
          }
          return const SizedBox();
        },
      )),
    );
  }

  Scaffold mobileLayout() {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesDone) {
            return Column(
              children: [
                appBarMobile(),
                body(sidePadding: Spacing.standard),
              ],
            );
          } else if (state is CategoriesException) {
            return const Center(
              child: Text(ViewConstants.couldNotLoadThePage),
            );
          }
          return const SizedBox();
        },
      )),
      drawer: drawer(),
    );
  }

  Drawer drawer() {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    final categories = categoriesBloc.state.categoriesEntity?.categories ?? [];
    return Drawer(
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
            Column(
                children:
                    categories.map((item) => drawerMenuItem(item)).toList()),
          ],
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

  Widget body({required double sidePadding}) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsDone) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: page(state.products),
              ),
            ),
          );
        } else if (state is ProductsException) {
          return const SizedBox();
        }
        return const SizedBox();
      },
    );
  }

  Column page(List<ProductEntity> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Spacing.standard,
        ),
        const SelectedItemsThread(),
        const SizedBox(
          height: Spacing.standard * 3,
        ),
        ClothesPage(
          products: products,
        ),
        const SizedBox(
          height: Spacing.standard * 7,
        ),
        const Divider(
          color: AppColors.border,
        ),
        const SizedBox(
          height: Spacing.standard,
        ),
        footer(),
      ],
    );
  }

  Widget footer() {
    showIcon(icon) => Image.asset(
          "${AppAssets.icons}/$icon",
          height: 30,
          width: 30,
        );
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appTitle(),
                  const SizedBox(
                    height: Spacing.small,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: const Wrap(
                      children: [
                        Text(
                          ViewConstants.siteDescription,
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: FontSize.regular + 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Spacing.standard,
                  ),
                  Row(
                    children: [
                      showIcon(AppIcons.facebook),
                      const SizedBox(
                        width: Spacing.normal,
                      ),
                      showIcon(AppIcons.instagram),
                      const SizedBox(
                        width: Spacing.normal,
                      ),
                      showIcon(AppIcons.x),
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.standard,
                  ),
                ],
              ),
            ],
          ),
          Wrap(
            spacing: Spacing.standard * 6,
            children: [
              footerItem(title: ViewConstants.navigations, widgets: [
                showSelectableDecoratedText(ViewConstants.men),
                showSelectableDecoratedText(ViewConstants.women),
                showSelectableDecoratedText(ViewConstants.kids),
                showSelectableDecoratedText(ViewConstants.brands),
              ]),
              footerItem(title: ViewConstants.customers, widgets: [
                showSelectableDecoratedText(ViewConstants.promotions),
                showSelectableDecoratedText(ViewConstants.delivery),
                showSelectableDecoratedText(ViewConstants.payment),
                showSelectableDecoratedText(ViewConstants.giftCard),
              ]),
              footerItem(title: ViewConstants.about, widgets: [
                showSelectableDecoratedText(ViewConstants.news),
                showSelectableDecoratedText(ViewConstants.publicOffer),
                showSelectableDecoratedText(ViewConstants.userAgreement),
                showSelectableDecoratedText(ViewConstants.privacyPolicy),
              ]),
            ],
          )
        ],
      ),
    );
  }

  showSelectableDecoratedText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: Spacing.normal),
        child: DecoratedText(
          text: text.toUpperCase(),
          fontSize: FontSize.regular,
          isDecorated: false,
          color: AppColors.secondary,
          onTap: () {},
        ),
      );
  Column footerItem({required String title, required List<Widget> widgets}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedText(
          text: title.toUpperCase(),
          fontSize: FontSize.medium,
          applyHover: false,
          isDecorated: false,
        ),
        const SizedBox(
          height: Spacing.standard,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
        const SizedBox(
          height: Spacing.normal,
        ),
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

  Padding appBarDesktop(List? categories) {
    categories = categories ?? [];

    final categorySpacing = Responsive.width(context) * 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.standard * 2),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Spacing.large),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Wrap(
                  spacing: categorySpacing,
                  children: categories
                      .map((item) => AppBarMenuItem(title: item))
                      .toList()),
            ),
            appTitle(),
            Expanded(
                flex: 5,
                child:
                    Align(alignment: Alignment.centerRight, child: actionRow()))
          ],
        ),
      ),
    );
  }

  Widget actionRow({double? width}) {
    width = width ?? Responsive.width(context) * 1.5;
    return Wrap(
      spacing: width,
      children: [
        appBarIcon(Icons.search_outlined),
        appBarIcon(Icons.person_outlined),
        appBarIcon(Icons.favorite_outline_outlined),
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
