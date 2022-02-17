import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/search.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                            child: Text(
                          'Turismo - Latacunga',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, 5))
                              ]),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Disfruta del turismo Latacungueño',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          )),
          ImageSlideshow(
            width: double.infinity,
            height: 400,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            children: [
              Image.network(
                'https://www.bucketlistec.com/wp-content/uploads/2018/03/cotopaxi.jpg',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://www.bucketlistec.com/wp-content/uploads/2018/03/cotopaxi.jpg',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://www.bucketlistec.com/wp-content/uploads/2018/03/cotopaxi.jpg',
                fit: BoxFit.cover,
              ),
            ],
            onPageChanged: (value) {
              // ignore: avoid_print
              print('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
          ),
        ],
      ),
    );
  }
}
