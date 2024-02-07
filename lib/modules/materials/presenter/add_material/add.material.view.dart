import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how_much/modules/materials/data/datasource/material.datasource.dart';
import 'package:how_much/modules/materials/data/repositories/material.repository.dart';
import 'package:how_much/modules/materials/presenter/add_material/add.material.viewmodel.dart';
import 'package:how_much/network/database/materials.network.database.dart';
import 'package:how_much/network/database/user.network.database.dart';

import '../../../../consts/strings.dart';
import '../../../../design/stylesheet.dart';
import '../../../../widgets/buttons/expanded.row.button.dart';
import '../../../../widgets/forms/materials.forms.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

class AddMaterialView extends StatefulWidget {
  final MaterialEntity? materialEntity;

  const AddMaterialView({
    super.key,
    this.materialEntity,
  });

  @override
  State<AddMaterialView> createState() => _AddMaterialViewState();
}

class _AddMaterialViewState extends State<AddMaterialView> {
  final AddMaterialViewModel viewModel = AddMaterialViewModel(
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

  bool fadeIn = false;

  @override
  initState() {
    viewModel.configure(widget.materialEntity);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title:
            (viewModel.isEditing) ? StringsConsts.edit : StringsConsts.addNew,
        highlightColor: Stylesheet.primaryColor,
        isClose: true,
        backButtonEnabled: true,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) => Column(
            children: [
              MaterialFormsWidget(
                isUserInteractionEnabled: !viewModel.isLoading,
                name: viewModel.name,
                onNameChanged: (name) {
                  viewModel.updateMaterial(name: name);
                },
                description: viewModel.description,
                onDescriptionChanged: (description) {
                  viewModel.updateMaterial(description: description);
                },
                cost: viewModel.price,
                onCostChanged: (cost) {
                  viewModel.updateMaterial(price: cost);
                },
                quantity: viewModel.quantity,
                onQuantityChanged: (quantity) {
                  viewModel.updateMaterial(quantity: quantity);
                },
                measure: viewModel.measure,
                measures: viewModel.measures,
                onMeasureChanged: (measure) {
                  viewModel.updateMaterial(measure: measure);
                },
              ),
              ExpandedRowButton(
                isLoading: viewModel.isLoading,
                title: (widget.materialEntity == null)
                    ? StringsConsts.addNew
                    : StringsConsts.edit,
                fadeIn: fadeIn,
                isEnabled: viewModel.isFormValid,
                onPressed: () async {
                  setState(
                    () {
                      fadeIn = true;
                      FocusScope.of(context).unfocus();
                      viewModel.addMaterial(context);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
