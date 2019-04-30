

class HomeDataSet {
  String id;
  String name;
  String description;
  String background;

  HomeDataSet({this.id, this.name, this.description, this.background});

  HomeDataSet.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        description = map['description'],
        background = map['background'];
}

class DataHomes {
  List<dynamic> data;
  String message;
  int status;

  DataHomes({this.data, this.message, this.status});

  DataHomes.fromMap(Map<String, dynamic> map)
      : data = map['data'],
        message = map['message'],
        status = map['status'];
}
