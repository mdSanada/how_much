import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../calculator/calculator.dart';
import '../../../../../consts/strings.dart';
import '../../../../../design/padding.dart';
import '../../../../../design/stylesheet.dart';
import '../../../../../widgets/buttons/expanded.row.button.dart';
import '../../../../../widgets/cells/product.display.material.cell.dart';
import '../../../../../widgets/spacing.dart';
import '../../../../materials/domain/entities/material.entity.dart';
import '../../../../materials/presenter/select_material/select.material.view.dart';
import '../../../../materials/presenter/select_material/select.quantity.material.dart';
import '../add.products.viewmodel.dart';
import 'add.product.materials.page.viewmodel.dart';

class AddProductMaterialsPage extends StatefulWidget {
  final AddProductsViewModel controller;

  const AddProductMaterialsPage({
    super.key,
    required this.controller,
  });

  @override
  State<AddProductMaterialsPage> createState() =>
      _AddProductMaterialsPageState();
}

class _AddProductMaterialsPageState extends State<AddProductMaterialsPage> {
  final AddProductMaterialsViewModel viewModel = AddProductMaterialsViewModel();

  @override
  void initState() {
    viewModel.configure(widget.controller);
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {});
  }

  void onAddMaterial(
    double quantity,
    Measures measures,
    MaterialEntity material,
    int? index,
  ) {
    viewModel.addMaterial(
      material,
      measures,
      quantity,
      index,
    );
  }

  void removeMaterial(int index) {
    viewModel.removeMaterial(index);
    _refresh();
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
            StringsConsts.productTitleChooseMaterials,
            style: Stylesheet.subtitle(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: PaddingConstants.medium,
            ),
            child: Observer(
              builder: (context) => ListView.separated(
                shrinkWrap: true,
                itemCount: viewModel.materials.length + 1,
                separatorBuilder: (ctx, index) => Spacing(),
                itemBuilder: (context, index) {
                  if (index == viewModel.materials.length) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: PaddingConstants.large - PaddingConstants.medium,
                        right: PaddingConstants.large - PaddingConstants.medium,
                      ),
                      child: ExpandedRowButton(
                        title: "Adicionar Material",
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SelectMaterialView(
                                onSelectedMaterial: onAddMaterial,
                              ),
                            ),
                          );
                          await _refresh();
                        },
                        fadeIn: false,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PaddingConstants.large,
                    ),
                    child: ProductDisplayMaterialCell(
                      index: index,
                      title: viewModel.materials[index].material.name,
                      description:
                          viewModel.materials[index].material.description,
                      value: viewModel.materials[index].quantity,
                      measure: viewModel.materials[index].measure,
                      highlightColor: Stylesheet.primaryColor,
                      onPressed: (index) async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SelectQuantityMaterialView(
                              materialEntity:
                                  viewModel.materials[index].material,
                              initialQuantity:
                                  viewModel.materials[index].quantity,
                              measures: viewModel.materials[index].measure,
                              index: index,
                              onSelectedMaterial: onAddMaterial,
                            ),
                          ),
                        );
                        await _refresh();
                      },
                      onDelete: (index) {
                        setState(() {
                          viewModel.removeMaterial(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
