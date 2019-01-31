import 'package:flutter/material.dart';

class Stores {
  static const String MAIN_CONTEXT = 'main_context';
}

class BaseStore {
  //singleton class
  BaseStore._internal();

  static BaseStore _singleton = new BaseStore._internal();

  factory BaseStore() => _singleton;

  var _smap = new Map<String, BuildContext>();

  BuildContext getStore(store) {
    return this._smap[store];
  }

  setStore(String store, BuildContext context) {
    this._smap[store] = context;
  }
}

var store = new BaseStore();
