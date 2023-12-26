import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String type, thumb;
  final int id;

  const DetailScreen({
    super.key,
    required this.type,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Flexible(
        flex: 1,
        child: Image.network(
          thumb,
        ),
      ),
    );
  }
}
