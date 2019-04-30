import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mvp/model/home_data.dart';
import 'package:flutter_app_mvp/ui/RecallHome/rhome_pages.dart';
import 'package:flutter_app_mvp/ui/home/home_page_view.dart';
import 'package:flutter_app_mvp/ui/home/home_presenter.dart';




class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => new _HomePagesState();
}

class _HomePagesState extends State<HomePages> implements HomePageView{

  HomePresenter _presenter;
  List<HomeDataSet> _homedataS;
  bool _isLoading;

  _HomePagesState() {
    _presenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MVP App'),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _isLoading
          ? new Center(
        child: new CircularProgressIndicator(),
      )
          : _hotelWidget(),
    );
  }

  Widget _hotelWidget() {
    return new Container(
      child: new Padding(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                itemCount: _homedataS.length,
                itemBuilder: (BuildContext context, int index) {
                  final HomeDataSet _homedata = _homedataS[index];
                  return _getCardItemUi(context, _homedata);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCardItemUi(BuildContext context, HomeDataSet _homedata) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: new Image.network(_homedata.background,
              fit:BoxFit.fill ,),
            ),

            subtitle: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: new Text(
                  _homedata.name,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
            isThreeLine: true,
            onTap: () {
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute
    (builder: (BuildContext context) => new RHomePages()), (Route route) => route == null);
            },
          )
        ],
      ),
    );
  }


  @override
  onFailLoadText() {
    print("error in api call");
  }

  @override
  onLoadSucces(List<HomeDataSet> items) {
    setState(() {
      _homedataS = items;
      _isLoading = false;
    });
  }
}
