import 'package:flutter/material.dart';
import 'package:songs_app/model.dart';
import 'package:audioplayers/audioplayers.dart';
class SongScreen extends StatefulWidget {
     final int selectedindex;

  const SongScreen({super.key,  required this.selectedindex});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  double value = 0;
  bool isplaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration = dur;
      });
    });
      
    audioPlayer.onPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //spacing: 80,
              children: [
                SizedBox(height: 100),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            SizedBox(height: 50),
CircleAvatar(
  radius: 125,
  backgroundColor: const Color.fromARGB(255, 168, 159, 159),
  child: ClipOval(
    child: Image.asset(
      songmodel[widget.selectedindex].image,
      width: 240,
      height: 240,
      fit: BoxFit.fill,
    ),
  ),
),
            SizedBox(height: 30),
            Row(children: [
            Text(songmodel[widget.selectedindex].title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'italic',
                ),
              ),
              Spacer(),
                Icon(Icons.file_upload_outlined, color: Colors.white, size: 30),
                SizedBox(width: 25),
              Icon(Icons.favorite, color: Colors.purple, size: 30),
            ]),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  Text(songmodel[widget.selectedindex].artist,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'italic',
                      ),
                    ),
                ],
              ),
            ),
          SizedBox(height: 30),
          Slider(
            activeColor: Colors.purple,
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
             onChanged: (newval){
              audioPlayer.seek(Duration(seconds: newval.toInt()));}
              ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text('${position.inSeconds ~/ 60}:${(position.inSeconds % 60).toString().padLeft(2, '0')}', style: TextStyle(color: Colors.white),),
               Text('${duration.inSeconds ~/ 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}', style: TextStyle(color: Colors.white),)
              ],),
           ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.shuffle, color: Colors.white, size: 30),
            SizedBox(width: 35),
            Icon(Icons.skip_previous, color: Colors.white, size: 30),
            SizedBox(width: 15),
            IconButton( color: Colors.purple, onPressed: () {
              setState(() {
                isplaying = !isplaying;
                if(isplaying){
                  audioPlayer.play(AssetSource('03._Arafha_Beya .mp3'));
                } else {
                  audioPlayer.pause();
                }
              });
            }, icon:Icon( isplaying? Icons.pause_circle: Icons.play_circle,size: 70) ),
            SizedBox(width: 15),
            Icon(Icons.skip_next, color: Colors.white, size: 30),
            SizedBox(width: 35),
            Icon(Icons.repeat, color: Colors.white, size: 30),
          ],)
            ],
            ),
          
        ),
      
    );
  }
}
