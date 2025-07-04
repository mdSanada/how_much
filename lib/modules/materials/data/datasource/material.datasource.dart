import 'package:how_much/user/current.user.dart';

import '../../../../network/protocol/material.database.protocol.dart';
import '../models/material.model.dart';

abstract class MaterialDataSourceProtocol {
  Future<List<MaterialModel>> fetchMaterials(
    bool forceRefresh,
  );
  Future<MaterialModel> readMaterial(String id);
  Future<bool> deleteMaterial(String id);
  Future<void> saveMaterial(MaterialModel material);
  Future<MaterialModel> editMaterial(MaterialModel material);
}

class MaterialDataSource implements MaterialDataSourceProtocol {
  final MaterialDatabaseProtocol database;

  MaterialDataSource({required this.database});

  @override
  Future<MaterialModel> readMaterial(String id) {
    final userId = CurrentUser().user!.id;
    return database.getMaterial(
      userId,
      id,
    );
  }

  @override
  Future<List<MaterialModel>> fetchMaterials(
    bool forceRefresh,
  ) async {
    final userId = CurrentUser().user!.id;
    return await database.getMaterials(
      userId,
      forceRefresh,
    );
  }

  @override
  Future<bool> deleteMaterial(String id) async {
    final userId = CurrentUser().user!.id;
    await database.deleteMaterial(
      userId,
      id,
    );
    return true;
  }

  @override
  Future<void> saveMaterial(MaterialModel material) async {
    final userId = CurrentUser().user!.id;
    await database.createMaterial(userId, material.toJson());
  }

  @override
  Future<MaterialModel> editMaterial(MaterialModel material) async {
    final userId = CurrentUser().user!.id;
    await database.updateMaterial(
      userId,
      material.id,
      material.toJson(),
      forceRefresh: true,
    );
    return material;
  }
}
