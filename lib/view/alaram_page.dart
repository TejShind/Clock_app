import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlaramPage extends StatefulWidget {
  const AlaramPage({Key? key}) : super(key: key);

  @override
  State<AlaramPage> createState() => _AlaramPageState();
}

class _AlaramPageState extends State<AlaramPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Alarm',
            style:
                TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w700, color:Colors.white, fontSize: 24),
          ),
        ]
      )
    );
  }
}
