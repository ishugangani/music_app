import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staggered_ui/screen/home/provider/home_provider.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  HomeProvider? HPTrue,HPFalse;

  @override
  Widget build(BuildContext context) {
    HPTrue = Provider.of<HomeProvider>(context, listen: true);
    HPFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text(
            "You are listening to ${HPTrue!.nameList[HPTrue!.songIndex]}",
            style: GoogleFonts.quicksand(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset("${HPTrue!.imageList[HPTrue!.songIndex]}",),
              ),
            ),
            Container(
              color: Colors.white70.withOpacity(0.5),
            ),
            PlayerBuilder.isPlaying(
              player: HPTrue!.audioPlayer,
              builder: (context, isPlaying) {
                return Column(
                  children: [
                    Spacer(),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        child: Image.asset("${HPTrue!.imageList[HPTrue!.songIndex]}", fit: BoxFit.cover,width: 130,height: 130,),
                      ),
                    ),
                    Spacer(),
                    PlayerBuilder.currentPosition(
                      player: HPTrue!.audioPlayer,
                      builder: (context, position) {
                        return Container(
                          height:100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      HPFalse!.previousSong();
                                    },
                                    icon: Icon(Icons.skip_previous,color: Colors.white,),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      HPFalse!.playPause();
                                      HPFalse!.iconChange();
                                    },
                                    icon: HPTrue!.icon ?Icon(Icons.pause,color: Colors.white,) : Icon(Icons.play_arrow,color: Colors.white,),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      HPFalse!.nextSong();
                                    },
                                    icon: Icon(Icons.skip_next,color: Colors.white,),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Slider(
                                max: HPTrue!.totalAudioTime.inSeconds.toDouble(),
                                value: position.inSeconds.toDouble(),
                                onChanged: (value) {
                                  HPTrue!.audioPlayer.seek(Duration(seconds: value.toInt()));
                                },
                                inactiveColor: Colors.white12,
                                activeColor: Colors.white,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
