import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../calculator/calculator.dart';
import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../network/database/materials.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/cells/image.title.description.cell.dart';
import '../../../../widgets/padding.safe.area.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/material.datasource.dart';
import '../../data/repositories/material.repository.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';
import 'select.material.viewmodel.dart';
import 'select.quantity.material.dart';

class SelectMaterialView extends StatefulWidget {
  final Function(double, Measures, MaterialEntity, int?) onSelectedMaterial;

  const SelectMaterialView({super.key, required this.onSelectedMaterial});

  @override
  State<SelectMaterialView> createState() => _SelectMaterialViewState();
}

class _SelectMaterialViewState extends State<SelectMaterialView> {
  final SelectMaterialsViewModel viewModel = SelectMaterialsViewModel(
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
    Future.wait([
      _refresh(),
    ]);

    super.initState();
  }

  Future<void> _refresh({bool forceRefresh = false}) async {
    await viewModel.getMaterials(forceRefresh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title: StringsConsts.titleSelectMaterial,
        titleSpacing: 0,
        backButtonEnabled: true,
        highlightColor: Stylesheet.primaryColor,
      ),
      body: PaddingSafeArea(
        child: Observer(
          builder: (context) => ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: Sizes.sMedium,
            ),
            itemCount: viewModel.materials.length,
            itemBuilder: (context, index) {
              return ImageTextDescriptionCell(
                index: index,
                title: viewModel.materials[index].name,
                description: viewModel.materials[index].description,
                highlightColor: Stylesheet.primaryColor,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SelectQuantityMaterialView(
                        materialEntity: viewModel.materials[index],
                        measures: viewModel.materials[index].measure,
                        onSelectedMaterial: widget.onSelectedMaterial,
                        initialQuantity: viewModel.materials[index].quantity,
                        index: null,
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
