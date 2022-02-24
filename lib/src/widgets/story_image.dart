import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:story_view/story_view.dart';

class Location1Widget extends StatefulWidget {
  const Location1Widget({Key? key}) : super(key: key);

  @override
  _LocationWidget1State createState() => _LocationWidget1State();
}

class _LocationWidget1State extends State<Location1Widget> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title: "Turismo Latacunga",
                    backgroundColor: Colors.orange,
                    roundedTop: false,
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://i.pinimg.com/originals/ff/31/93/ff31939803a7d14acae233f347cc35ca.gif",
                    controller: controller,
                    caption: Text(
                      "Paisajes Hermosos; Serás un amante de la aventura",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://res.cloudinary.com/mashcas/image/upload/v1645711296/latacunga/unnamed_it1fpc.jpg",
                    controller: controller,
                    caption: Text(
                      "Turismo - De aventura",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Ver historias increibles");
                },
                onComplete: () {
                  print("Se completo el ciclo ");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreStories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Ver mas historias",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTxYUbW9vYBWtS-U1UdHRiZJp_g3aIdqODlcA&usqp=CAU",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url:
                  "https://smoda.elpais.com/wp-content/uploads/images/201506/cada_vez_es_mas_facil_cocinar_nuestros_propios_gifs_4856.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url:
                "https://smoda.elpais.com/wp-content/uploads/images/201506/cada_vez_es_mas_facil_cocinar_nuestros_propios_gifs_4856.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
                "https://smoda.elpais.com/wp-content/uploads/images/201506/cada_vez_es_mas_facil_cocinar_nuestros_propios_gifs_4856.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: true,
        controller: storyController,
      ),
    );
  }
}
