import 'dart:ffi';

import 'package:realm/realm.dart';
import 'package:realm_demo_app/Helpers/realm_dao_helper.dart';

import 'package:realm_demo_app/ohakon.dart';

class OhakonDao {
  static late final dao = RealmDaoHelper<OhakonJson>(OhakonJson.schema);
  static void addOhakonJson(OhakonJson ohaJson)  {

    dao.add(ohaJson);
  }
  static OhakonJson findAll()  {
    RealmResults<OhakonJson> objects =  dao.findAll<OhakonJson>();
      OhakonJson ohakonJson = objects.last;

    return ohakonJson;
  }
  static void updateOhakonJson (OhakonJson ohakonJson) {
    dao.update((OhakonJson object) {
      object.ohakon = ohakonJson.ohakon;
    });
  }
}