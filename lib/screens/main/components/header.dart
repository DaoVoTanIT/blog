import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/responsive.dart';

import '../../../constants.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuControllerBog _controller = Get.put(MenuControllerBog());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),
                      SvgPicture.asset("assets/icons/logo.svg"),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      // Socal
                      Socal(),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Text(
                    "Võ Tấn Đào",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Flutter ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Developer",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.yellow[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      'Chào các bạn, mình hiện tại đang làm việc như một lập trình viên mobile toàn thời gian,\n mình có niềm đam mê với lập trình đặc biệt là phát triển những ứng dụng để phục vụ cho \nnhu cầu của con người.'
                      'Tôi định hướng mình trở thành chuyên gia trong lĩnh vực này. Tuy còn hạn chế về  \nkinh nghiệm nhưng tôi sẽ cố gắng để đạt được mục tiêu."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        height: 1.5,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Learn More",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: kDefaultPadding / 2),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (Responsive.isDesktop(context))
                    SizedBox(height: kDefaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
