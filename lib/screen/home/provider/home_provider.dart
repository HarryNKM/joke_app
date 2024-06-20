import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/screen/home/model/home_model.dart';
import 'package:jokes_app/utils/api_helper.dart';
import 'package:share_plus/share_plus.dart';

class HomeProvider with ChangeNotifier
{
  Connectivity connectivity = Connectivity();
  bool? isInternet;

  ApiHelper helper=ApiHelper();
  Future<HomeModel?>? Model;

  void sharejoke(String joke)
  {
    Share.share(joke);
  }
  void checkInternet() async {
    connectivity.onConnectivityChanged.listen(
          (event) {
        if (event.contains(ConnectivityResult.mobile)||event.contains(ConnectivityResult.wifi)) {
          isInternet = true;
        }
        else {
          isInternet = false;
        }
        notifyListeners();
      },
    );

  }
  void getJoke()  {
    Model = helper.getJokeApi();
    Model!.then((value) { if(value!=null)
    {
      notifyListeners();
    }
    });
  }
}