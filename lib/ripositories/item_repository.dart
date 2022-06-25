import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen02/extensions/firebase_firestore_extension.dart';
import 'package:zen02/general_provider.dart';

import '../model/item_model.dart';

abstract class BaseItemRepository {
  Future<List<Item>> retriveItems({required String userId});
  Future<String> createItem({required String userId, required Item item});
  Future<void> updateItem({required String userId, required Item item});
  Future<void> deleteItem({required String userId, required String itemId});
}

class ItemRepository implements BaseItemRepository {
  final Reader _read;
  const ItemRepository(this._read);

  @override
  Future<List<Item>> retriveItems({required String userId}) async {
    final snap =
        await _read(firebaseFirestoreProvider).userListRef(userId).get();
    return snap.docs.map((val) => Item.fromDocument(val)).toList();
  }

  @override
  Future<String> createItem(
      {required String userId, required Item item}) async {
    final docRef = await _read(firebaseFirestoreProvider)
        .userListRef(userId)
        .add(item.toDocument());
    return docRef.id;
  }

  @override
  Future<void> updateItem({required String userId, required Item item}) async {
    await _read(firebaseFirestoreProvider)
        .userListRef(userId)
        .doc(item.id)
        .update(item.toDocument());
  }

  @override
  Future<void> deleteItem(
      {required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .userListRef(userId)
        .doc(itemId)
        .delete();
  }
}
