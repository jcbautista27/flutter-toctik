import 'package:toctik/domain/datasources/video_post_datasource.dart';
import 'package:toctik/domain/entities/video_post.dart';
import 'package:toctik/infrastructure/models/local_video_model.dart';
import 'package:toctik/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosUser(String idUser) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTredingVideosByPage(int page) async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video) => 
    LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}