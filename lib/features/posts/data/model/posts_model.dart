class PostsModel {
  late String displayName;
  late String createdAt;
  late String updatedAt;
  late String displayContent;
  late String ?displayPicture;
  late String ?caption;


  PostsModel(
      {required this.displayName,
      required this.createdAt,
      required this.updatedAt,
       this.displayPicture,
       this.caption,
      required this.displayContent,

      });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        caption: json['caption'],
        createdAt: json['createdAt'],
        displayName: json['display_name'],
        updatedAt: json['updatedAt'],
        displayPicture: json['display_picture'],
        displayContent: json['display_content'],

      );
}
