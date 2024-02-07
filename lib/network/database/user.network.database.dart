import 'package:cloud_firestore/cloud_firestore.dart';

import '../collections.dart';
import '../protocol/users.database.protocol.dart';

class UserNetworkDatabase implements UsersDatabaseProtocol {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection(Collections.users);

  @override
  Future<void> addUser(
    String userId,
    Map<String, dynamic> userData,
  ) async {
    await _usersCollection.doc(userId).set(userData);
  }

  @override
  Future<void> updateUser(
    String userId,
    Map<String, dynamic> updatedData,
  ) async {
    await _usersCollection.doc(userId).update(updatedData);
  }

  @override
  Future<void> deleteUser(
    String userId,
  ) async {
    await _usersCollection.doc(userId).delete();
  }

  @override
  DocumentReference getUserCollection(
    String userId,
  ) {
    return _usersCollection.doc(userId);
  }

  @override
  Future<QuerySnapshot> getUsers() async {
    return await _usersCollection.get();
  }

  @override
  Future<QuerySnapshot> getUsersWithId(
    String userId,
  ) async {
    return await _usersCollection
        .where(
          'userId',
          isEqualTo: userId,
        )
        .get();
  }
}
