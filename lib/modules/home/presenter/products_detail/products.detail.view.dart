import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how_much/design/sizes.dart';

import '../../../../consts/strings.dart';
import '../../../../design/stylesheet.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../network/database/product.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/container.value.profit/container.value.profit.dart';
import '../../../../widgets/inset_grouped/inset.grouped.colletion.dart';
import '../../../../widgets/padding.scrollable.safe.area.dart';
import '../../../../widgets/spacing.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/product.datasource.dart';
import '../../data/repositories/product.repository.dart';
import '../../domain/entities/product.entity.dart';
import '../../domain/usecase/crud.product.dart';
import '../add_products/add.products.view.dart';
import '../add_products/add.products.viewmodel.dart';
import 'products.detail.viewmodel.dart';

class ProductDetailView extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailView({
    super.key,
    required this.productEntity,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final ProductsDetailViewModel viewModel = ProductsDetailViewModel(
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
    viewModel.configureProduct(widget.productEntity);
    super.initState();
  }

  Future<void> _refresh() async {
    await viewModel.getProduct(widget.productEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    final CurrencyTextInputFormatter currencyFormatter =
        CurrencyFormatter.formatter();

    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        backButtonEnabled: true,
        title: StringsConsts.titleProductsDetail,
        highlightColor: Stylesheet.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              size: Sizes.large,
              color: Stylesheet.error,
            ),
            onPressed: () async {
              final didDelete = await viewModel.deleteProduct(
                viewModel.product?.id ?? "",
              );
              if (context.mounted && didDelete) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingIconButton(
        icon: Icons.edit,
        color: Stylesheet.primaryColor,
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
              builder: (context) => AddProductsView(
                viewModel: viewModel,
                product: this.viewModel.product,
              ),
            ),
          );
          await _refresh();
        },
      ),
      body: PaddingScrollableSafeArea(
        child: Observer(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing(),
              Text(
                viewModel.product?.name ?? "",
                style: Stylesheet.header(),
              ),
              const Spacing(),
              Text(
                viewModel.product?.description ?? "",
                style: Stylesheet.body(),
              ),
              const Spacing(),
              ContainerProductValueProfit(
                total: viewModel.getUnitValue(),
                profit: viewModel.getUnitPercentage(),
              ),
              const Spacing(),
              InsetGroupedCollection(
                title: StringsConsts.total,
                items: viewModel.getTotalSection(),
              ),
              const Spacing(),
              InsetGroupedCollection(
                title: StringsConsts.unit,
                items: viewModel.getUnitSection(),
              ),
              const Spacing(),
              InsetGroupedCollection(
                title: StringsConsts.materials,
                items: viewModel.getMaterialsSection(),
              ),
              const Spacing(),
            ],
          ),
        ),
      ),
    );
  }
}
