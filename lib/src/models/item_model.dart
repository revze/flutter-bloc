class ItemModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  int get page => _page;

  set page(int value) {
    _page = value;
  }

  int get total_results => _total_results;

  List<_Result> get results => _results;

  set results(List<_Result> value) {
    _results = value;
  }

  int get total_pages => _total_pages;

  set total_pages(int value) {
    _total_pages = value;
  }

  set total_results(int value) {
    _total_results = value;
  }
}

class _Result {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _backdrop_path;
  String _overview;
  String _release_date;

  _Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _backdrop_path = result['backdrop_path'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  int get vote_count => _vote_count;

  set vote_count(int value) {
    _vote_count = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  bool get video => _video;

  set video(bool value) {
    _video = value;
  }

  get vote_average => _vote_average;

  set vote_average(value) {
    _vote_average = value;
  }

  String get poster_path => _poster_path;

  set poster_path(String value) {
    _poster_path = value;
  }

  double get popularity => _popularity;

  set popularity(double value) {
    _popularity = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get backdrop_path => _backdrop_path;

  set backdrop_path(String value) {
    _backdrop_path = value;
  }

  String get overview => _overview;

  set overview(String value) {
    _overview = value;
  }

  String get release_date => _release_date;

  set release_date(String value) {
    _release_date = value;
  }


}
