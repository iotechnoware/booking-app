import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofly/core/enums/bottom_navigation.dart';
import 'package:gofly/ui/shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {

  final BottomNavigationEnum bottomNavigation;
  final Function (BottomNavigationEnum ,int) onTap;

  const BottomNavigationWidget({Key? key, required this.bottomNavigation, required this.onTap}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    Color? iconColor;
    Color? textColor;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        Container(
          width: double.infinity,
          height: screenWidth(7),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            // boxShadow: [
            //   BoxShadow(
            //   color: Colors.grey,
            //   offset: Offset(0,5),
            //   blurRadius: 15
            // ),
            // ]
          ),
        ),

        PositionedDirectional(
          bottom: size.width * 0.035,
          start: size.width * 0.05,
          end: size.width * 0.05,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navItem(
                    onTap: (){
                      widget.onTap(BottomNavigationEnum.HOME,0);
                    },
                    size: const Size(700,700),
                    selectedImage: 'home_selected',
                    UnSelectedImage: 'home_unselected',
                    // text: 'home',
                    isSelected: widget.bottomNavigation == BottomNavigationEnum.HOME),
                SizedBox(
                  width: size.width * 0.1,
                ),
                navItem(
                    onTap: (){
                      widget.onTap(BottomNavigationEnum.EXPLORE,1);
                    },
                    size: const Size(700,700),
                    selectedImage: 'explore_selected',
                    UnSelectedImage: 'explore_unselected',
                    // text: 'prod',
                    isSelected: widget.bottomNavigation == BottomNavigationEnum.EXPLORE),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Stack(
                  children: [

                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.TRIPS,2);
                        },
                        size: const Size(700,700),
                        selectedImage: 'bag_selected',
                        UnSelectedImage: 'bag_unselected',
                        // text: 'cart',
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.TRIPS),

                    // Obx(() {
                    //   return Positioned(
                    //     top: 0,
                    //     right: 0,
                    //     child: Container(
                    //       width: screenWidth(25),
                    //       height: screenWidth(25),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: cartService.cartCount == 0 ?
                    //           iconColor = Colors.transparent : Colors.red
                    //       ),
                    //       child: Center(
                    //           child: Text(
                    //             '${cartService.cartCount}',
                    //             style: TextStyle(
                    //                 color: cartService.cartCount == 0 ?
                    //                 textColor = Colors.transparent : Colors
                    //                     .black),
                    //           )
                    //
                    //       ),
                    //     ),
                    //   );
                    // }
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required Size size,
    required String selectedImage,
    // ignore: non_constant_identifier_names
    required String UnSelectedImage,
    // required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: (){ onTap(); },
      child: Column(
        children: [
          SvgPicture.asset(
            isSelected ? "assets/images/$selectedImage.svg" : "assets/images/$UnSelectedImage.svg",
            width: isSelected ? size.width * 0.05 :  size.width * 0.045,
            color:
            isSelected ? const Color.fromRGBO(69, 95, 185, 1) : Colors.black,
          ),
          // Text(text,style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),),
        ],
      ),
    );
  }
}



class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
