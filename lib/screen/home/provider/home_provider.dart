import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  int songIndex=0;
  bool icon = false;
  AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();

  Duration totalAudioTime=Duration(seconds: 0);

  List<Audio> audioList=[
    Audio("asset/audio/bejeweled.mp3"),
    Audio("asset/audio/cold mess.mp3"),
    Audio("asset/audio/dangerously.mp3"),
    Audio("asset/audio/escapism.mp3"),
    Audio("asset/audio/family line.mpeg"),
    Audio("asset/audio/flowers.mp3"),
    Audio("asset/audio/hot mess.mp3"),
    Audio("asset/audio/i wanna be yours.mp3"),
    Audio("asset/audio/if we ever broke up.mp3"),
    Audio("asset/audio/lavender haze.mp3"),
    Audio("asset/audio/people you know.mp3"),
    Audio("asset/audio/pink blue.mp3"),
    Audio("asset/audio/souvenir.mpeg"),
    Audio("asset/audio/teenage dream.mp3"),
    Audio("asset/audio/until we drink.mp3"),
  ];
  List imageList=[
    "asset/image/bejeweled.png",
    "asset/image/cold mess.jpg",
    "asset/image/dangerously.jpg",
    "asset/image/escapism.jpg",
    "asset/image/family line.jpg",
    "asset/image/flowers.jpg",
    "asset/image/hot mess.jpg",
    "asset/image/i wanna be yours.jpg",
    "asset/image/if we ever broke up.jpg",
    "asset/image/lavender haze.jpg",
    "asset/image/people you know.jpg",
    "asset/image/pink blue.png",
    "asset/image/souvenir.jpg",
    "asset/image/teenage dream.jpg",
    "asset/image/until we drink.jpg",
  ];
  List nameList=[
    "Bejeweled",
    "Cold/Mess",
    "Dangerously",
    "Escapism",
    "Family Line",
    "Flowers",
    "Hot Mess",
    "I Wanna Be Yours",
    "If we Ever Broke Up",
    "Lavender Haze",
    "People We Know",
    "Pink Blue",
    "Souvenir",
    "Teenage Dream",
    "Until We Drink",
  ];
  List singerList=[
    "Taylor Swift",
    "Prateek Kuhad",
    "Charlie Puth",
    "RAYE, 070 Shake",
    "Conan Gray",
    "Miley Cyrus",
    "Zoe Clark",
    "Arctic Monkeys",
    "Mae Stephens",
    "Taylor Swift",
    "Selena Gomez",
    "Tsumyoki,Bharg",
    "Selena Gomez",
    "Stephen Dawes",
    "Savannah Sgro",
  ];
  List<Color> color=[
    Colors.red,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.blue.shade800,
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.blue.shade800,
    Colors.purple,
  ];
  List<Color> lightColor=[
    Colors.red.shade100,
    Colors.amber.shade100,
    Colors.yellow.shade100,
    Colors.lightGreen.shade100,
    Colors.lightBlue.shade100,
    Colors.blue.shade200,
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.red.shade100,
    Colors.amber.shade100,
    Colors.yellow.shade100,
    Colors.lightGreen.shade100,
    Colors.lightBlue.shade100,
    Colors.blue.shade200,
    Colors.purple.shade100,
  ];

  void indexing(int index)
  {
    songIndex=index;
    notifyListeners();
  }

  void initSong() {
    audioPlayer = AssetsAudioPlayer();
    audioPlayer.open(Audio("asset/audio/bejeweled.mp3"),
      autoStart: false,);
    totalDuration();
  }

  Future<void> playPause() async {
    await icon==false ?audioPlayer.play:audioPlayer.pause();
  }

  void nextSong() async{
    await audioPlayer.next();
  }

  void previousSong() async{
    await audioPlayer.previous();
  }

  void totalDuration() {
    audioPlayer.current.listen((event) {
      totalAudioTime = event!.audio.duration;
      notifyListeners();
    });
  }

  void iconChange()
  {
    icon=!icon;
    notifyListeners();
  }
}