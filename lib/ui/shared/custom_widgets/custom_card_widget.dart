import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 115,
              width: 115,
              // ignore: sort_child_properties_last
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 58,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Gilroy'),
            ),
          ),
        ],
      ),
    );
  }
}
