import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mvp/model/home_data.dart';
import 'package:flutter_app_mvp/ui/RecallHome/rhome_presenter.dart';
import 'package:flutter_app_mvp/ui/home/home_page_view.dart';


class RHomePages extends StatefulWidget {
  @override
  _RHomePagesState createState() => new _RHomePagesState();
}

class _RHomePagesState extends State<RHomePages> implements HomePageView{

  RHomePresenter _presenter;
  List<HomeDataSet> _homedataS;
  bool _isLoading;

  _RHomePagesState() {
    _presenter = new RHomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadRHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Recall MVP'),
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
              child: new Text(
                _homedata.description,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              )//new Image.network(),
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
              final snackBar =
              new SnackBar(content: new Text("Tap : ${_homedata.name}"));
              Scaffold.of(context).showSnackBar(snackBar);
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
