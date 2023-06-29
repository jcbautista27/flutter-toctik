import 'package:flutter/material.dart';
import 'package:toctik/domain/entities/video_post.dart';
import 'package:toctik/presentation/widgets/shared/video_buttons.dart';
import 'package:toctik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    Key? key, 
    required this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical, 
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {  

        final VideoPost video = videos[index];
        return Stack(
          children: [

            //VIDEO PLAYER + GRADIENTE
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: video.videoUrl, 
                caption: video.caption,
              )
            ),

            // BOTONES
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video)
            )

          ],
        );

      },

      
    );
  }
}