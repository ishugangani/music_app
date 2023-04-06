import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staggered_ui/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  
  @override
  Widget build(BuildContext context) {

    HomeProvider HPTrue = Provider.of<HomeProvider>(context,listen: true);
    HomeProvider HPFalse = Provider.of<HomeProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Music Player",
            style: GoogleFonts.quicksand(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: ListView.builder(
            itemCount: HPTrue.nameList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'song');
                    HPTrue.indexing(index);
                    HPFalse.initSong();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2,color: HPTrue.color[index],),
                      color: HPTrue.lightColor[index],
                    ),
                    child: ListTile(
                      leading: Image.asset("${HPTrue.imageList[index]}",fit: BoxFit.cover,),
                      title: Text(
                        "${HPTrue.nameList[index]}",
                        style: GoogleFonts.quicksand(),
                      ),
                      subtitle: Text(
                        "${HPTrue.singerList[index]}",
                        style: GoogleFonts.quicksand(),
                      ),
                      trailing: Icon(Icons.play_circle_outline,color: Colors.black26,),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
