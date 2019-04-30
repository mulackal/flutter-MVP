import 'package:flutter_app_mvp/base/app_repository.dart';
import 'package:flutter_app_mvp/ui/home/home_page_view.dart';
import 'package:flutter_app_mvp/util/data_injector.dart';


class RHomePresenter {
  HomePageView _view;
  AppRepository _repository;

  RHomePresenter(this._view) {
    _repository = new Injector().myRepository;
  }

  void loadRHomeData() {
    _repository
        .fetchRecallHomeData()
        .then((data) => _view.onLoadSucces(data))
        .catchError((e) => _view.onFailLoadText());
  }
}
