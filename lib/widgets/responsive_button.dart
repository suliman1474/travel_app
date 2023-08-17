import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width = 120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.deepPurple),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: AppText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(right: 0.0, left: 5.0),
              child: Wrap(
                children: [
                  Icon(
                    CupertinoIcons.forward,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
