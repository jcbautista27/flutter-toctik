import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toctik/config/theme/app_theme.dart';
import 'package:toctik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toctik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:toctik/presentation/providers/discover_provider.dart';
import 'package:toctik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostRepositoryImpl(
      videosDatasource: LocalVideoDatasourceImpl()
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}