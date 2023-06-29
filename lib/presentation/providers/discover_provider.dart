

import 'package:flutter/material.dart';
import 'package:toctik/domain/entities/video_post.dart';
import 'package:toctik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videoRepository;

  bool initialLoading = true;
  List<VideoPost> video = [];

  DiscoverProvider({
    required this.videoRepository
  });

  Future<void> loadNextPage() async{
    
    //await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts.map((video) => 
    // LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();

    final newVideos = await videoRepository.getTredingVideosByPage(1);

    video.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}