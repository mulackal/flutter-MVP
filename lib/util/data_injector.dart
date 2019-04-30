import 'package:flutter_app_mvp/base/app_network_service.dart';
import 'package:flutter_app_mvp/base/app_repository.dart';


class Injector {
  static final Injector _singleton = new Injector._internal();
  
    factory Injector() {
      return _singleton;
    }
  
    Injector._internal();

  AppRepository get myRepository => new AppNetworkRepository();
}
