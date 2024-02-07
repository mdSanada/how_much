import '../../modules/materials/data/models/material.model.dart';

abstract class MaterialDatabaseProtocol {
  Future<void> createMaterial(
    String userId,
    Map<String, dynamic> materialData,
  );

  Future<void> updateMaterial(
    String userId,
    String materialId,
    Map<String, dynamic> updatedData, {
    bool forceRefresh = false,
  });

  Future<void> deleteMaterial(
    String userId,
    String materialId,
  );

  Future<List<MaterialModel>> getMaterials(
    String userId,
    bool forceRefresh,
  );

  Future<MaterialModel> getMaterial(
    String userId,
    String materialId,
  );
}
