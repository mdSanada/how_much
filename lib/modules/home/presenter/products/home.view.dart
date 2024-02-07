import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../network/database/product.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/cells/image.title.description.cell.dart';
import '../../../../widgets/padding.safe.area.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/product.datasource.dart';
import '../../data/repositories/product.repository.dart';
import '../../domain/usecase/crud.product.dart';
import '../add_products/add.products.view.dart';
import '../add_products/add.products.viewmodel.dart';
import '../products_detail/products.detail.view.dart';
import 'products.viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductsViewModel viewModel = ProductsViewModel(
    productsUseCase: CrudProductUseCase(
      repository: ProductRepository(
        dataSource: ProductDataSource(
          database: ProductsFirestoreDatabase(
            userNetworkDatabase: UserNetworkDatabase(),
          ),
        ),
      ),
    ),
  );

  @override
  void initState() {
    Future.wait([
      _refresh(),
    ]);

    super.initState();
  }

  Future<void> _refresh({bool forceRefresh = false}) async {
    await viewModel.getProducts(forceRefresh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      floatingActionButton: FloatingIconButton(
          color: Stylesheet.secondaryColor,
          icon: Icons.add,
          onPressed: () async {
            final viewModel = AddProductsViewModel(
              useCase: CrudProductUseCase(
                repository: ProductRepository(
                  dataSource: ProductDataSource(
                    database: ProductsFirestoreDatabase(
                      userNetworkDatabase: UserNetworkDatabase(),
                    ),
                  ),
                ),
              ),
            );
            await Navigator.of(context, rootNavigator: true).push(
              CupertinoModalPopupRoute(
                builder: (context) => AddProductsView(viewModel: viewModel),
              ),
            );
            await _refresh();
          }),
      appBar: TitleAppBar(
        title: StringsConsts.titleProducts,
        highlightColor: Stylesheet.secondaryColor,
      ),
      body: PaddingSafeArea(
        child: Observer(
          builder: (context) => ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: Sizes.sMedium,
            ),
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              return ImageTextDescriptionCell(
                index: index,
                title: viewModel.products[index].name,
                description: viewModel.products[index].description,
                highlightColor: Stylesheet.primaryColor,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductDetailView(
                        productEntity: viewModel.products[index],
                      ),
                    ),
                  );
                  await _refresh();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
