import 'package:cyber_safe/core/utils/logger.dart';
import 'package:objectbox/objectbox.dart';

class OjbRepository<T> {
  final Store store;

  OjbRepository(this.store);

  Box<T> get box => Box<T>(store);

  Future<List<T>> getAllWithParam({
    required int limit,
    required int offset,
  }) async {
    return box.getAll();
  }

  //search

  Future<List<T>> getAll({
    QueryProperty<T, dynamic>? p,
    int limit = 0,
  }) async {
    if (p != null) {
      final query = box.query()..order(p, flags: Order.descending);
      return query.build().find();
    } else {
      return box.getAll();
    }
  }

  Future<T?> get(int id) async {
    return box.get(id);
  }

  Future<void> insert(T data) async {
    box.put(data);
  }

  Future<void> update(T data) async {
    box.put(data);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }

  Future<void> deleteAll() async {
    box.removeAll();
  }

  Future<void> insertAll(List<T> data) async {
    List<int> result = box.putMany(data);
    if (result.contains(-1)) {
      throw Exception("Error inserting data");
    } else {
      customLogger(msg: "inserted data", typeLogger: TypeLogger.info);
    }
  }

  Future<void> updateAll(List<T> data) async {
    List<int> result = box.putMany(data);
    if (result.contains(-1)) {
      throw Exception("Error updating data");
    } else {
      customLogger(msg: "updated data", typeLogger: TypeLogger.info);
    }
  }
}
