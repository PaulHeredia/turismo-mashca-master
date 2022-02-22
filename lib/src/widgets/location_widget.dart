import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashcas_turismo/src/widgets/inicio_widget.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 200.h,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    "Turismo Latacunga",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  background: ImageSlideshow(
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].
                    height: 200,

                    /// The page to show when first creating the [ImageSlideshow].
                    initialPage: 0,

                    /// The color to paint the indicator.
                    indicatorColor: Colors.blue,

                    /// The color to paint behind th indicator.
                    indicatorBackgroundColor: Colors.grey,

                    /// The widgets to display in the [ImageSlideshow].
                    /// Add the sample image file into the images folder
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/mashcas/image/upload/v1645312505/Latacunga_01_oqkcmg.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://res.cloudinary.com/mashcas/image/upload/v1645312504/cotopaxi_ujuntc.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://res.cloudinary.com/mashcas/image/upload/v1645312503/laguna_xu32kp.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],

                    /// Called whenever the page in the center of the viewport changes.
                    onPageChanged: (value) {
                      // ignore: avoid_print
                      print('Page changed: $value');
                    },

                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.
                    autoPlayInterval: 3000,

                    /// Loops back to first slide.
                    isLoop: true,
                  ),
                )),
            const SliverFillRemaining(
              child: MoreInfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
