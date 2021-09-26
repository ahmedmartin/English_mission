import 'dart:async';

import 'package:english_mission/controller/road_map_controller.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Network_connection_controller extends GetxController{

  RxBool wait = true.obs;
  StreamSubscription<InternetConnectionStatus> ? _listener ;


  @override
  void onInit() async{
    _listener = InternetConnectionChecker().onStatusChange.listen(
          (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
          // ignore: avoid_print
            print('connected');
            wait.value=false;
            break;
          case InternetConnectionStatus.disconnected:
          // ignore: avoid_print
            print('dis connected');
            wait.value=true;
            break;
        }
      },
    );

    super.onInit();
  }

  @override
  void onClose() {
    _listener!.cancel();
  }

}