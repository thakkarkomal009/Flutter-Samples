import 'dart:math';

import 'package:flutter/material.dart';

class SideHeader extends StatelessWidget {
  const SideHeader({
    Key? key,
    this.date,
  }) : super(key: key);

  final String? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 48.0,
          width: 48.0,
          child: CircleAvatar(
            backgroundColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            foregroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '$date',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
