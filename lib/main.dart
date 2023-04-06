import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_ui/screen/home/provider/home_provider.dart';
import 'package:staggered_ui/screen/home/view/home_screen.dart';
import 'package:staggered_ui/screen/your_song/view/song_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'song':(context) => SongScreen(),
        },
      ),
    ),
  );
}
