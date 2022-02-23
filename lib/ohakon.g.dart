// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohakon.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class OhakonJson extends _OhakonJson with RealmObject {
  OhakonJson(
    String ohakon,
  ) {
    this.ohakon = ohakon;
  }

  OhakonJson._();

  @override
  String get ohakon => RealmObject.get<String>(this, 'ohakon') as String;
  @override
  set ohakon(String value) => RealmObject.set(this, 'ohakon', value);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(OhakonJson._);
    return const SchemaObject(OhakonJson, [
      SchemaProperty('ohakon', RealmPropertyType.string),
    ]);
  }
}
