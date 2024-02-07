import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../consts/strings.dart';
import '../../../../design/stylesheet.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../../side_menu_bar/side.menu.bar.dart';
import '../../domain/entities/product.entity.dart';
import 'add.products.viewmodel.dart';
import 'add_product_description_page/add.product.description.page.dart';
import 'add_product_materials_page/add.product.materials.page.dart';
import 'add_product_profit_page/add.product.profit.page.dart';

class AddProductsView extends StatefulWidget {
  final AddProductsViewModel viewModel;
  final ProductEntity? product;

  AddProductsView({super.key, required this.viewModel, this.product});

  @override
  State<AddProductsView> createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  late AddProductsViewModel viewModel;
  late List<Widget> pages;

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
          builder: (_) => pages.elementAt(_actualPage),
        );
      },
    );
  }

  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.product != null) {
      viewModel.configure(product: widget.product);
    }
    pages = [
      AddProductDescriptionPage(controller: viewModel),
      AddProductMaterialsPage(controller: viewModel),
      AddProductProfitPage(controller: viewModel),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title: (viewModel.isEditing)
            ? StringsConsts.titleEditProducts
            : StringsConsts.titleAddProducts,
        highlightColor: Stylesheet.primaryColor,
        isClose: true,
        backButtonEnabled: true,
      ),
      floatingActionButton: Observer(
        builder: (context) => FloatingLoaderIconButton(
          onPressed: () async {
            if (_actualPage == pages.length - 1) {
              viewModel.saveProduct(context);
            } else {
              setState(() {
                _actualPage++;
              });
            }
          },
          color: Stylesheet.primaryColor,
          icon: (_actualPage == pages.length - 1)
              ? Icons.check
              : Icons.arrow_forward,
          isLoading: viewModel.isLoading,
        ),
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
