import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/data_budget.dart';
import 'package:counter_7/pages/mywatchlist_detail.dart';
import 'package:counter_7/fetch/fetch_mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/widgets/mywatchlist_item_card.dart';

class MyWatchListPage extends StatefulWidget {
    final List<DataBudget> data;
    const MyWatchListPage({Key? key, required this.data}) : super(key: key);

    @override
    State<MyWatchListPage> createState() => _MyWatchListPage();
}

class _MyWatchListPage extends State<MyWatchListPage> {
    late Future<List<WatchList>> _watchList;
    late MyWatchListData _watchListData;
    
    @override
    void initState() {
      _watchListData = MyWatchListData();
      _watchList = _watchListData.fetchMyWatchList();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const MyDrawer(),
        body: Center(
          child: FutureBuilder(
            future: _watchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return !snapshot.hasData
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'You doesnt have any watch list yet :(',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyWatchListDetail(
                                  watchList: snapshot.data[index],
                                ),
                              ),
                            ),
                            child: WacthListItemCard(
                              watchList: snapshot.data[index],
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 12),
                      );
              }
            },
          ),
        )
      );
  }
}