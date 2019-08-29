class TrailerModel {
  int _id;
  List<_Result> _results = [];

  TrailerModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  set results(List<_Result> value) {
    _results = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}

class _Result {
  String _id;
  String _iso_639_1;
  String _iso_3166_1;
  String _key;
  String _name;
  String _site;
  int _size;
  String _type;

  _Result(result) {
    _id = result['id'];
    _iso_639_1 = result['iso_639_1'];
    _iso_3166_1 = result['iso_3166_1'];
    _key = result['key'];
    _name = result['name'];
    _site = result['site'];
    _size = result['size'];
    _type = result['type'];
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  int get size => _size;

  set size(int value) {
    _size = value;
  }

  String get site => _site;

  set site(String value) {
    _site = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get key => _key;

  set key(String value) {
    _key = value;
  }

  String get iso_3166_1 => _iso_3166_1;

  set iso_3166_1(String value) {
    _iso_3166_1 = value;
  }

  String get iso_639_1 => _iso_639_1;

  set iso_639_1(String value) {
    _iso_639_1 = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
