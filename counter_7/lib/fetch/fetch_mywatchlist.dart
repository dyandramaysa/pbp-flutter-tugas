import 'package:counter_7/models/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWatchListData {
  Future<List<WatchList>> fetchMyWatchList() async {
    try {
      Uri url = Uri.parse(
          'https://tugas2nadira.herokuapp.com/mywatchlist/json/');
      var response = await http.get(url);
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<WatchList> watchList = [];
      for (var item in data) {
        watchList.add(WatchList.fromJson(item['fields']));
      }
      return watchList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}