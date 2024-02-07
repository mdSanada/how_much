import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../network/database/materials.network.database.dart';
import '../../../../network/database/user.network.database.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/cells/image.title.description.cell.dart';
import '../../../../widgets/padding.safe.area.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../data/datasource/material.datasource.dart';
import '../../data/repositories/material.repository.dart';
import '../../domain/usecase/crud.material.dart';
import '../add_material/add.material.view.dart';
import '../materials_detail/materials.detail.view.dart';
import 'materials.viewmodel.dart';

class MaterialsView extends StatefulWidget {
  const MaterialsView({super.key});

  @override
  State<MaterialsView> createState() => _MaterialsViewState();
}

class _MaterialsViewState extends State<MaterialsView> {
  final MaterialsViewModel viewModel = MaterialsViewModel(
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
      floatingActionButton: FloatingIconButton(
        color: Stylesheet.primaryColor,
        icon: Icons.add,
        onPressed: () async {
          await Navigator.of(context, rootNavigator: true).push(
            CupertinoModalPopupRoute(
              builder: (context) => const AddMaterialView(),
            ),
          );
          await _refresh();
        },
      ),
      appBar: TitleAppBar(
        title: StringsConsts.titleMaterial,
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
                      builder: (_) => MaterialsDetailView(
                        materialEntity: viewModel.materials[index],
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
