import 'package:toctik/domain/datasources/video_post_datasource.dart';
import 'package:toctik/domain/entities/video_post.dart';
import 'package:toctik/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository{
  
  final VideoPostDatasource videosDatasource;

  VideoPostRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosUser(String idUser) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTredingVideosByPage(int page) {
    return videosDatasource.getTredingVideosByPage(page);
  }

}