import 'package:flutter/material.dart';
import 'package:toctik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    Key? key, 
    required this.videoUrl, 
    required this.caption
  }) : super(key: key);

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}


class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.videoUrl)
                ..setVolume(0)
                ..setLooping(true)
                ..play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,))  ;
        }

        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying){
              _controller.pause();
              return;
            }
            _controller.play();
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
        
                //GRADIENTE
                VideoBackground(stops: const [0.8,1.0]),
        
                //TEXTO
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption,)
                )
              ],
            ),
          ),
        );
        
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;
  const _VideoCaption({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textTitle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2,style: textTitle,),
    );
  }
}