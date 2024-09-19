import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('trips'));
  }
}
