import 'package:flutter/material.dart';

import '../../../../consts/strings.dart';
import '../../../../design/stylesheet.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../../side_menu_bar/side.menu.bar.dart';
import 'add.products.viewmodel.dart';
import 'add_product_description_page/add.product.description.page.dart';
import 'add_product_materials_page/add.product.materials.page.dart';
import 'add_product_profit_page/add.product.profit.page.dart';

class AddProductsView extends StatefulWidget {
  final AddProductsViewModel viewModel;

  final List<Widget> pages;

  AddProductsView({super.key, required this.viewModel})
      : pages = [
          AddProductDescriptionPage(controller: viewModel),
          AddProductMaterialsPage(controller: viewModel),
          AddProductProfitPage(controller: viewModel),
        ];

  @override
  State<AddProductsView> createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };

  final List<String> _titles = [
    StringsConsts.productTitleDescription,
    StringsConsts.productTitleMaterials,
    StringsConsts.productTitleProfit,
  ];

  int _actualPage = 0;

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_actualPage],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => widget.pages.elementAt(_actualPage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: const TitleAppBar(
        title: "Adicionar produto",
        highlightColor: Stylesheet.primaryColor,
        isClose: true,
        backButtonEnabled: true,
      ),
      floatingActionButton: FloatingIconButton(
        onPressed: () {
          widget.viewModel.configure();
          if (_actualPage == widget.pages.length - 1) {
            widget.viewModel.saveProduct();
          } else {
            setState(() {
              _actualPage++;
            });
          }
        },
        color: Stylesheet.primaryColor,
        icon: (_actualPage == widget.pages.length - 1)
            ? Icons.check
            : Icons.arrow_forward,
      ),
      body: SafeArea(
        child: Row(
          children: [
            SideMenuBar(
              titles: _titles,
              selectedIndex: _actualPage,
              onPressed: (index) {
                setState(() {
                  _actualPage = index;
                });
              },
            ),
            Flexible(
              child: buildNavigator(),
            ),
          ],
        ),
      ),
    );
  }
}
