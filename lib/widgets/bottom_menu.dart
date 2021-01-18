import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenuItem {
  final String urlSvg;
  final String label;

  BottomMenuItem({@required this.urlSvg, @required this.label});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;

  BottomMenu({@required this.items}) : assert(items  != null && items.length > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map<Widget>((item) {
            return Expanded(
              child:  Container(
                child: CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.network(item.urlSvg, width: 35),
                      // Icon(item.icone, size: 35, color: Colors.black),
                      SizedBox(height: 3),
                      Text(item.label, style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}