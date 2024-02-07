import 'package:how_much/core/logger.dart';

import '../../modules/materials/data/models/material.model.dart';
import '../cache/materials.cache.database.dart';
import '../collections.dart';
import '../protocol/material.database.protocol.dart';
import '../protocol/users.database.protocol.dart';

class MaterialFirestoreDatabase implements MaterialDatabaseProtocol {
  final UsersDatabaseProtocol _userNetworkDatabase;
  final MaterialsCacheProtocol _materialsCache = MaterialsCacheDatabase();

  MaterialFirestoreDatabase(
      {required UsersDatabaseProtocol userNetworkDatabase})
      : _userNetworkDatabase = userNetworkDatabase;

  @override
  Future<void> createMaterial(
    String userId,
    Map<String, dynamic> materialData,
  ) async {
    final doc = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.materials)
        .add(materialData);

    await updateMaterial(
      userId,
      doc.id,
      Map.of(
        {'id': doc.id},
      ),
      forceRefresh: false,
    );

    await getMaterials(userId, true);
  }

  @override
  Future<void> updateMaterial(
    String userId,
    String materialId,
    Map<String, dynamic> updatedData, {
    bool forceRefresh = true,
  }) async {
    await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.materials)
        .doc(materialId)
        .update(updatedData);

    if (forceRefresh) {
      await getMaterials(userId, true);
    }
  }

  @override
  Future<void> deleteMaterial(
    String userId,
    String materialId,
  ) async {
    await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.materials)
        .doc(materialId)
        .delete();
    await getMaterials(userId, true);
  }

  @override
  Future<List<MaterialModel>> getMaterials(
    String userId,
    bool forceRefresh,
  ) async {
    if (!forceRefresh) {
      try {
        final cached = await _materialsCache.cache();
        if (cached.isNotEmpty) {
          return cached;
        }
      } catch (e) {
        Logger.log(e);
      }
    }

    final snapshots = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.materials)
        .get();

    final materials = snapshots.docs.map(
      (doc) {
        Map<String, dynamic> data = doc.data();
        return MaterialModel.fromJson(data);
      },
    ).toList();

    await _materialsCache.store(materials);

    return materials;
  }

  @override
  Future<MaterialModel> getMaterial(
    String userId,
    String materialId,
  ) async {
    try {
      final cached = await _materialsCache.cache();
      final index = cached.indexWhere(
        (element) => element.id == materialId,
      );
      if (index != -1) {
        return cached[index];
      }
    } catch (e) {
      Logger.log(e);
    }

    final doc = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.materials)
        .doc(materialId)
        .get();

    if (!doc.exists) {
      throw Exception('Material does not exist');
    }

    Map<String, dynamic> data = doc.data()!;
    return MaterialModel.fromJson(data);
  }
}
