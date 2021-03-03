import 'package:proyectoM/plays/item_play_details.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/plays/item_play.dart';
import 'package:proyectoM/models/play.dart';

class PlaysPage extends StatefulWidget {
  final List<Play> playsList;
  final List<Play> playsToSee;
  PlaysPage({Key key, @required this.playsList, @required this.playsToSee})
      : super(key: key);

  @override
  _PlaysPageState createState() => _PlaysPageState();
}

class _PlaysPageState extends State<PlaysPage> {
  @override
  Widget build(BuildContext context) {
    Play _playItem;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Plays"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search by name",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (content) {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.playsList.length,
                itemBuilder: (BuildContext context, int index) {
                  _playItem = widget.playsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PlayDetails(
                          play: widget.playsList[index],
                          playsToSee: widget.playsToSee,
                        );
                      })).then((value) => setState(() {}));
                    },
                    child: ItemPlay(
                      play: _playItem,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
