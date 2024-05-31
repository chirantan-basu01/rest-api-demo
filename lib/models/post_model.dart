class PostList {
  dynamic userID;
  dynamic id;
  dynamic title;
  dynamic body;

  PostList(
      {required this.userID,
      required this.id,
      required this.title,
      required this.body});

  factory PostList.fromJson(Map<dynamic, dynamic> json) {
    return PostList(
      userID: json['userID'],
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }
}
