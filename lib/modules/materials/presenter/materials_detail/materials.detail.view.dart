import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/calculator/calculator.dart';
import 'package:how_much/formatters/number.formatter.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../network/database/materials.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/cells/material.item.widget.dart';
import '../../../../widgets/padding.scrollable.safe.area.dart';
import '../../../../widgets/spacing.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/material.datasource.dart';
import '../../data/repositories/material.repository.dart';
import '../../domain/usecase/crud.material.dart';
import '../add_material/add.material.view.dart';
import '../../domain/entities/material.entity.dart';
import 'materials.detail.viewmodel.dart';

class MaterialsDetailView extends StatefulWidget {
  final MaterialEntity materialEntity;

  const MaterialsDetailView({
    super.key,
    required this.materialEntity,
  });

  @override
  State<MaterialsDetailView> createState() => _MaterialsDetailViewState();
}

class _MaterialsDetailViewState extends State<MaterialsDetailView> {
  late MaterialEntity materialEntity;
  final MaterialsDetailViewModel viewModel = MaterialsDetailViewModel(
    materialsUseCase: MaterialsUseCase(
      repository: MaterialRepository(
        dataSource: MaterialDataSource(
          database: MaterialFirestoreDatabase(
            userNetworkDatabase: UserNetworkDatabase(),
          ),
        ),
      ),
    ),
  );

  @override
  void initState() {
    materialEntity = widget.materialEntity;
    super.initState();
  }

  Future<void> _refresh() async {
    final material = await viewModel.getMaterial(widget.materialEntity.id);
    if (material != null) {
      setState(() {
        materialEntity = material;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final CurrencyTextInputFormatter currencyFormatter =
        CurrencyFormatter.formatter();

    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        backButtonEnabled: true,
        title: StringsConsts.titleMaterialDetail,
        highlightColor: Stylesheet.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              size: Sizes.large,
              color: Stylesheet.error,
            ),
            onPressed: () async {
              final didDelete =
                  await viewModel.deleteMaterial(materialEntity.id);
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
          await Navigator.of(context, rootNavigator: true).push(
            CupertinoModalPopupRoute(
              builder: (context) => AddMaterialView(
                materialEntity: materialEntity,
              ),
            ),
          );
          await _refresh();
        },
      ),
      body: PaddingScrollableSafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacing(),
            Text(
              materialEntity.name,
              style: Stylesheet.header(),
            ),
            const Spacing(),
            Text(
              materialEntity.description,
              style: Stylesheet.body(),
            ),
            const Spacing(size: Sizes.large),
            MaterialItemWidget(
              title: StringsConsts.formCost,
              value: CurrencyFormatter.number(
                  materialEntity.price, currencyFormatter),
            ),
            const Spacing(
              line: Sizes.thinLine,
            ),
            MaterialItemWidget(
              title: StringsConsts.formQuantity,
              value: NumberFormatter.stringfy(materialEntity.quantity),
            ),
            const Spacing(
              line: Sizes.thinLine,
            ),
            MaterialItemWidget(
              title: StringsConsts.formMeasure,
              value: MeasuresManager.stringfy(materialEntity.measure),
            ),
          ],
        ),
      ),
    );
  }
}
