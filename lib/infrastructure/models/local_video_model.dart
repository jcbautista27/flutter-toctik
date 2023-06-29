import 'package:toctik/domain/entities/video_post.dart';

class LocalVideoModel {
  String name;
  String videoUrl;
  int likes;
  int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"],
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
      };
      
  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views,
  );
   
}
