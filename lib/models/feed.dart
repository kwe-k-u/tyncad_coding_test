

class Feed{
  int id;
  String title;
  String description;
  String coverPhoto;
  int shareCount;
  int likeCount;
  int commentCount;
  DateTime dateCreated;

  Feed({
    required this.id,
    required this.title,
    required this.description,
    required this.coverPhoto,
    required this.shareCount,
    required this.likeCount,
    required this.commentCount,
    required this.dateCreated,

});


  factory Feed.fromJson(Map<String,dynamic> map)=>
      Feed(
          id: map["id"],
          title: map["title"],
          description: map["description"],
          coverPhoto: map["cover_photo_url"],
          shareCount: map["number_of_shares"],
          likeCount: map["number_of_likes"],
          commentCount: map["number_of_comments"],
          dateCreated: DateTime.parse(map["date_created"])
      );
}
