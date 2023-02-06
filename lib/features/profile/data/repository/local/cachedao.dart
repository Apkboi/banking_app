// ignore_for_file: avoid_renaming_method_parameters

class CacheCachedUserDao extends BaseDao<CachedUser> {
  final Future<Database> database;
  final StoreRef store;

  CacheCachedUserDao({required this.database, required this.store});

  @override
  Future deleteById(int id) async {
    await store.record(id).delete(await database);
  }

  @override
  Future<List<CachedUser>> getAllCache() async {
    final snapshots = await store.find(await database);
    return snapshots
        .map((snapshot) => CachedUser.fromMap(snapshot.value))
        .toList(growable: false);
  }

  @override
  Future update(CachedUser cacheCachedUser) async {
    await store
        .record(cacheCachedUser.id)
        .update(await database, cacheCachedUser.toMap());
  }

  @override
  Future<int> insert(CachedUser cacheCachedUser) async {
    await deleteAll();
    return await store.add(await database, cacheCachedUser.toMap());
  }

  @override
  Future deleteAll() async {
    // Clear all records from the store
    return await store.delete(await database);
  }

  @override
  Future<CachedUser> findById(id) async {
    CachedUser? cachedCachedUser;
    final cachedUsers = await getAllCache();
    if (cachedUsers.isNotEmpty) {
      cachedCachedUser = cachedUsers.firstWhere((element) => element.id == id);
    }
    debugPrint("cachedCachedUser is $cachedCachedUser");
    return cachedCachedUser!;
  }

}
