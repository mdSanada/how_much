import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../network/database/materials.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/inset_grouped/inset.grouped.colletion.dart';
import '../../../../widgets/padding.scrollable.safe.area.dart';
import '../../../../widgets/spacing.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/material.datasource.dart';
import '../../data/repositories/material.repository.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';
import '../add_material/add.material.view.dart';
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
    viewModel.configureMaterial(widget.materialEntity);
    super.initState();
  }

  Future<void> _refresh() async {
    await viewModel.getMaterial(widget.materialEntity.id);
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
                  await viewModel.deleteMaterial(viewModel.material?.id ?? "");
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
                materialEntity: viewModel.material,
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
                viewModel.material?.name ?? "",
                style: Stylesheet.header(),
              ),
              const Spacing(),
              Text(
                viewModel.material?.description ?? "",
                style: Stylesheet.body(),
              ),
              const Spacing(size: Sizes.large),
              InsetGroupedCollection(
                title: StringsConsts.detail,
                items: viewModel.section(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
