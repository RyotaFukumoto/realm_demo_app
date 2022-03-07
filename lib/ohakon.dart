import 'package:realm/realm.dart';  // import realm package

part 'ohakon.g.dart'; // declare a part file.

@RealmModel()
class _OhakonJson {
  @PrimaryKey()
  late final int id;
  late String ohakon;
}