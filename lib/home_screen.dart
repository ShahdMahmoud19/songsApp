import 'package:flutter/material.dart';
import 'package:songs_app/model.dart';
import 'package:songs_app/song_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  bool icontap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(songmodel[selectedindex].image),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    Icon(Icons.favorite, color: Colors.blue, size: 30),
                  ],
                ),
                SizedBox(height: 80),
                Text(
                  songmodel[selectedindex].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'italic',
                  ),
                ),
                Text(
                  songmodel[selectedindex].artist,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'italic',
                  ),
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.pause_circle, size: 57, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                'PLAYLIST',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: songmodel.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                setState(() {
                  selectedindex = index;
                });

                await Future.delayed(Duration(seconds: 2));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongScreen(selectedindex: index,)),
                );
              },
              child: ListTile(
                leading: Image.asset(
                  songmodel[index].image,
                  width: 90,
                  height: 60,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  songmodel[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  songmodel[index].artist,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: index == selectedindex
                    ? Icon(Icons.graphic_eq, color: Colors.blue, size: 30)
                    : Icon(Icons.favorite, color: Colors.blue, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
