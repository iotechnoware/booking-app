import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/colors.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/notification_view/notification_view.dart';
import 'package:gofly/ui/views/profile_view/profile_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.3),
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      //toolbarOpacity: 0,
      elevation: 0,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ProfileView(),
                  ),
                );
              },
              child: const SizedBox(
                height: 52,
                width: 52,
                child: CircleAvatar(
                  //backgroundColor: Colors.greenAccent[400],
                  backgroundImage:
                  AssetImage('assets/old_images/circleavtarimage.png'),
                  radius: 25,
                ),
              ),
            ),
            // const Column(
            //   children: [
            //     Text("Location",style: TextStyle(
            //         fontFamily: "gilroy",
            //         fontSize: 12,
            //         color: Colors.black,
            //         fontWeight: FontWeight.w400
            //     ),),
            //     Row(
            //       children: [
            //         Icon(
            //           Icons.location_on_rounded,
            //           color: Color(0xff1F75EC),
            //         ),
            //
            //         SizedBox(
            //           width: 5,
            //         ),
            //         Text(
            //           "Dubai",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 15,
            //               fontFamily: 'Gilroy'),
            //         ),
            //         Text(
            //           "",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w400,
            //               fontSize: 15,
            //               fontFamily: 'Gilroy'),
            //         ),
            //         SizedBox(
            //           width: 5,
            //         ),
            //         Icon(Icons.keyboard_arrow_down_outlined,
            //             color: Colors.blue),
            //       ],
            //     ),
            //   ],
            // ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NotificationView(),
                  ),
                );
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                ),
                child: SizedBox(
                  height: 52,
                  width: 52,
                  child: CircleAvatar(
                    backgroundColor: AppColors.mainWhiteColor,
                    // ignore: sort_child_properties_last
                    child: Image.asset(
                      'assets/old_images/Notification.png',
                      height: 20,
                      color: Colors.black,
                    ),
                    radius: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => const SizedBox();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity , 78 );
}

