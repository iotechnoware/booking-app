import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/colors.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({Key? key, required this.title, required this.subTitle, required this.imageUrl, required this.onPressed}) : super(key: key);

  final String title;
  final String subTitle;
  final String imageUrl;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.mainWhiteColor),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 33),
                Row(
                  children: [
                    Image.asset(
                      "assets/old_images/$imageUrl.png",
                      scale: 14,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children:  [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Gilroy'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subTitle,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAEB4B9),
                          fontFamily: 'Gilroy'),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined,
                        color: Color(0xff909CA7), size: 17)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
