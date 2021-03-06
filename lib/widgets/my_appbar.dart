import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppbar extends StatelessWidget {
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;

  MyAppbar({
    @required this.leftIcon, 
    @required this.rightIcon,
    this.onLeftClick,
    this.onRightClick,
  });  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.all(15),
            child: SvgPicture.network(
              leftIcon,
              width: 30,
            ),
            onPressed: onLeftClick,
          ),
          Image.network(
            'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
            width: 170,
            color: Colors.black
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                    child: SvgPicture.network(
                    rightIcon,
                    width: 30,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
              ],
            ),
            onPressed: onRightClick,
          ),
        ],
      ),
    );
  }
}