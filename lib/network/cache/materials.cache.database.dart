import 'dart:convert';

import 'package:how_much/core/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/materials/data/models/material.model.dart';

abstract class MaterialsCacheProtocol {
  Future<bool> store(List<MaterialModel> materials);
  Future<List<MaterialModel>> cache();
}

class MaterialsCacheDatabase implements MaterialsCacheProtocol {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();
  final key = "MATERIALS_CACHE";

  @override
  Future<bool> store(List<MaterialModel> materials) async {
    final SharedPreferences storage = await _storage;

    var body = json.encode(
      materials
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    );

    try {
      await storage.setString(key, body);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<List<MaterialModel>> cache() async {
    final SharedPreferences storage = await _storage;

    String body = "[]";
    List<MaterialModel> materials = [];
    try {
      body = storage.getString(key) ?? "[]";
    } catch (e) {
      body = "[]";
    }

    if (body != "[]") {
      var object = await jsonDecode(body);

      if (object != null) {
        try {
          final list = object
              .map(
                (i) => MaterialModel.fromJson(i),
              )
              .toList();
          materials = List<MaterialModel>.from(list).toList();
        } catch (e) {
          return Future.value(materials);
        }
      }
    }
    Logger.log(
      name: "CACHE",
      "$materials",
    );
    return Future.value(materials);
  }
}
