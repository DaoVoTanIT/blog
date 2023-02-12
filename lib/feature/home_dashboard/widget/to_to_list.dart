import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/util/config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  ToDoList(
      {super.key,
      required this.device,
      required this.code,
      required this.requestedBy,
      required this.time,
      required this.level,
      required this.status});

  final String device;
  final String code;
  final String requestedBy;
  final DateTime time;
  final String status;
  final String level;
  final DateFormat formatDate = DateFormat(formatDateTimeString);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: color4.withOpacity(0.04),
              offset: const Offset(0, 5),
              blurRadius: 10)
        ], color: grey100, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                device,
                style: h5(color: dodgerBlue, fontWeight: '700'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  requestedBy,
                  style: h7(
                    color: black,
                  ),
                ),
                const Spacer(),
                Text(
                  code,
                  style: h7(
                    color: black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: redLight, borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  level,
                  style: h7(
                    color: redLight,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.schedule,
                  size: 15,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  formatDate.format(DateTime.now()),
                  style: h7(
                    color: black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://media.istockphoto.com/photos/side-view-of-one-young-woman-picture-id1134378235?k=20&m=1134378235&s=612x612&w=0&h=0yIqc847atslcQvC3sdYE6bRByfjNTfOkyJc5e34kgU=',
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://media.istockphoto.com/photos/side-view-of-one-young-woman-picture-id1134378235?k=20&m=1134378235&s=612x612&w=0&h=0yIqc847atslcQvC3sdYE6bRByfjNTfOkyJc5e34kgU=',
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: blue100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    status,
                    style:
                        h7(context: context, color: color4, fontWeight: '700'),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
