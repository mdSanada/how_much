import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/modules/home/data/datasource/product.datasource.dart';
import 'package:how_much/modules/home/data/repositories/product.repository.dart';
import 'package:how_much/modules/home/domain/usecase/crud.product.dart';
import 'package:how_much/modules/home/presenter/add_products/add.products.view.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../network/database/product.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/cells/image.title.description.cell.dart';
import '../../../../widgets/padding.safe.area.dart';
import '../../../../widgets/title.app.bar.dart';
import '../add_products/add.products.viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          }),
      appBar: TitleAppBar(
        title: StringsConsts.titleProducts,
        highlightColor: Stylesheet.secondaryColor,
      ),
      body: PaddingSafeArea(
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: Sizes.sMedium,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ImageTextDescriptionCell(
              index: index,
              title: StringsConsts.placeholder,
              description: StringsConsts.placeholder,
              icon: Icons.heart_broken,
              highlightColor: Stylesheet.primaryColor,
            );
          },
        ),
      ),
    );
  }
}
