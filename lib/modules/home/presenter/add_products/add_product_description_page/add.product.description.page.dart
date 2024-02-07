import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../consts/strings.dart';
import '../../../../../design/padding.dart';
import '../../../../../design/stylesheet.dart';
import '../../../../../formatters/number.formatter.dart';
import '../../../../../widgets/forms/products.forms.dart';
import '../add.products.viewmodel.dart';
import 'add.product.description.page.viewmodel.dart';

class AddProductDescriptionPage extends StatefulWidget {
  final AddProductsViewModel controller;

  const AddProductDescriptionPage({
    super.key,
    required this.controller,
  });

  @override
  State<AddProductDescriptionPage> createState() =>
      _AddProductDescriptionPageState();
}

class _AddProductDescriptionPageState extends State<AddProductDescriptionPage> {
  final AddProductDescriptionViewModel viewModel =
      AddProductDescriptionViewModel();

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
            StringsConsts.productTitleDescription,
            style: Stylesheet.subtitle(),
          ),
        ),
        Observer(
          builder: (context) => ProductsFormsWidget(
            isUserInteractionEnabled: true,
            name: viewModel.name,
            onNameChanged: (name) {
              viewModel.setName(name);
            },
            description: viewModel.description,
            onDescriptionChanged: (description) {
              viewModel.setDescription(description);
            },
            quantity: viewModel.quantity > 0
                ? NumberFormatter.stringfy(
                    viewModel.quantity,
                  )
                : null,
            onQuantityChanged: (quantity) {
              viewModel.setQuantity(quantity);
            },
          ),
        ),
      ],
    );
  }
}
