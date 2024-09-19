import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Gilroy'),
        ),
        Row(
          children: [
            TextButton(
              onPressed: (){onPressed();},
              child:const Text(
                "SEE ALL",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Gilroy'),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}
