import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsersDatabaseProtocol {
  Future<void> addUser(
    String userId,
    Map<String, dynamic> userData,
  );
  Future<void> updateUser(
    String userId,
    Map<String, dynamic> updatedData,
  );
  Future<void> deleteUser(
    String userId,
  );
  Future<QuerySnapshot> getUsers();
  Future<QuerySnapshot> getUsersWithId(
    String userId,
  );
  DocumentReference getUserCollection(
    String userId,
  );
}
