import 'package:flutter/material.dart';
import 'package:counter_7/models/mywatchlist.dart';

class WacthListItemCard extends StatelessWidget {
  final WatchList watchList;
  const WacthListItemCard({
    Key? key,
    required this.watchList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: 
            watchList.watched == "Sudah" ? Colors.pink : Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              watchList.title,
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}