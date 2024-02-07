import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../consts/strings.dart';
import '../../../../../design/padding.dart';
import '../../../../../design/stylesheet.dart';
import '../../../../../widgets/forms/profit.forms.dart';
import '../add.products.viewmodel.dart';
import 'add.product.profit.page.viewmodel.dart';

class AddProductProfitPage extends StatefulWidget {
  final AddProductsViewModel controller;

  const AddProductProfitPage({
    super.key,
    required this.controller,
  });

  @override
  State<AddProductProfitPage> createState() => _AddProductProfitPageState();
}

class _AddProductProfitPageState extends State<AddProductProfitPage> {
  AddProductProfitViewModel viewModel = AddProductProfitViewModel();

  @override
  void initState() {
    viewModel.configure(widget.controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingConstants.large,
          ),
          child: Text(
            StringsConsts.productTitleChooseProfit,
            style: Stylesheet.subtitle(),
          ),
        ),
        Observer(
          builder: (context) => ProfitFormsWidget(
            profit: viewModel.value,
            cost: viewModel.actualCost,
            percentage: viewModel.actualProfit,
            price: viewModel.actualPrice,
            profitType: viewModel.profitType,
            onProfitTypeChanged: (type) {
              setState(() {
                viewModel.setProfitType(type);
              });
            },
            onProfitChanged: (profit) {
              setState(() {
                viewModel.setValue(profit);
              });
            },
            isUserInteractionEnabled: true,
          ),
        ),
      ],
    );
  }
}
