import 'package:realm/realm.dart';

class RealmDaoHelper <T extends RealmObject> {
  static late final Realm _realm;
  static late final Configuration _configuration;
  RealmDaoHelper(SchemaObject schema) {
    _configuration = Configuration([schema]);
    _realm = Realm(_configuration);
  }

  // 全件取得
  RealmResults<T> findAll<RealmObject>() {
    return _realm.all<T>();
  }

  // 1件のレコードを取得
  T findFirst<RealmObject>() {
    return findAll<T>().first;
  }

  // 最後のレコードを取得
  T findLast<RealmObject>() {
    return findAll<T>().last;
  }

  // レコードを追加
  void add(T realmObject)  {
    _realm.write(()  {
      _realm.add(realmObject);
    });
  }

  // レコードを更新
  Future<void> update (void Function(T realmObject) completion) async {
    _realm.write(() {
      RealmResults<T> realmResults = _realm.all();
      T object = realmResults.last;
      completion(object);
    });
  }


  // レコードを削除
  void delete(T object) {
    _realm.write(() {
      _realm.delete(object);
    });
  }

  // レコード全件削除
  void deleteAll () {
    final objects = _realm.all();
    _realm.write(() {
      _realm.deleteMany(objects);
    });
  }
}