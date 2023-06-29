import 'package:toctik/domain/entities/video_post.dart';

abstract class VideoPostRepository{

  Future<List<VideoPost>> getFavoriteVideosUser(String idUser);

  Future<List<VideoPost>> getTredingVideosByPage(int page);

}