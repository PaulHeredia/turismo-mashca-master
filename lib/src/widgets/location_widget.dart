import 'package:flutter/material.dart';

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
                          'MASHCAS TURISMO',
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
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: Row(
                      children: const [
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Buscar',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'LUGARES RECOMENDADOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
