class WatchList {
    late String title;
    // ignore: non_constant_identifier_names
    late String release_date;
    late int rating;
    late String review;
    late String watched;

    WatchList({
        required this.title,
        // ignore: non_constant_identifier_names
        required this.release_date,
        required this.rating,
        required this.review,
        required this.watched,
    }); 

    WatchList.fromJson(Map<String, dynamic> json) {
      watched = json['watched'];
      title = json['title'];
      rating = json['rating'];
      release_date = json['release_date'];
      review = json['review'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['watched'] = watched;
      data['title'] = title;
      data['rating'] = rating;
      data['release_date'] = release_date;
      data['review'] = review;
      return data;
    }
}