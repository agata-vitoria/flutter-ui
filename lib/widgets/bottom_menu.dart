import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenuItem {
  final String urlSvg, label;
  final Widget content;  

  BottomMenuItem({@required this.urlSvg, @required this.label, @required this.content});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;
  final int currentPage;
  final void Function(int) onChanged;

  BottomMenu({@required this.items, @required this.currentPage, this.onChanged})
      : assert(items != null && items.length > 0),
        assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final bool isActive = index == currentPage;
            final BottomMenuItem item = items[index];
            return Expanded(
              child: Container(
                child: CupertinoButton(
                  onPressed: () => onChanged(index),
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.network(
                        item.urlSvg,
                        width: 35,
                        color: isActive ? Colors.blue : Colors.black,
                      ),
                      // Icon(item.icone, size: 35, color: Colors.black),
                      SizedBox(height: 3),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12,
                          color:  isActive ? Colors.blue : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
