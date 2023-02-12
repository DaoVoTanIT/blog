import 'dart:async';

import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/photo_view.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class CommentWorkOrderAssets extends StatefulWidget {
  const CommentWorkOrderAssets({Key? key}) : super(key: key);

  @override
  State<CommentWorkOrderAssets> createState() => _CommentWorkOrderAssetsState();
}

class _CommentWorkOrderAssetsState extends State<CommentWorkOrderAssets> {
  bool darkMode = false;
  DateFormat formatHour = DateFormat(formatDateTimeString);
  TextEditingController commentCtr = TextEditingController(text: '');
  FocusNode commentFn = FocusNode();
  String domain = '';
  @override
  void dispose() {
    commentCtr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    ;
    super.initState();
  }

  getDomain() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.domain)]);
    domain = respList[0].toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   height: 100,
      //   child: Column(
      //     children: [
      //       TextFieldCpn(
      //         controller: commentCtr,
      //         focusNode: commentFn,
      //         labelText: LocaleKeys.currentPassword.tr(),
      //         labelStyle: h7(context: context, fontWeight: '600'),
      //       ),
      //       ElevatedCpn(
      //         function: () {},
      //         bgColor: orange,
      //         boxShadow: [
      //           BoxShadow(
      //               color: orange.withOpacity(0.4),
      //               offset: const Offset(0, 10),
      //               blurRadius: 20)
      //         ],
      //         textButton: LocaleKeys.start.tr(),
      //         leftWidget: const Icon(Icons.schedule_outlined),
      //         textStyle: h5(color: grey100, fontWeight: '700'),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        height: 140,
        color: grey100,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldCpn(
              controller: commentCtr,
              focusNode: commentFn,
              labelText: '',
              hintText: LocaleKeys.writeAComment.tr(),
              labelStyle: h7(context: context, fontWeight: '600'),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const ImageAsset(
                  icAttach,
                  color: black,
                ),
                const SizedBox(
                  width: 15,
                ),
                const ImageAsset(icCamera),
                const Spacer(),
                ElevatedCpn(
                  vertical: 10,
                  function: () {
                    // controller.show(
                    //     context, backgroundColor, const SimilarQuestion());
                  },
                  textButton: LocaleKeys.send.tr(),
                  textStyle:
                      h5(color: Theme.of(context).color12, fontWeight: '700'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments',
                style: h1(context: context, fontWeight: '700'),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewPhotoPage(
                            image:
                                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Myra Douglas ',
                            style: h5(
                                context: context,
                                fontWeight: '700',
                                color: black),
                          ),
                          Text(
                            'change ',
                            style: h5(
                              context: context,
                            ),
                          ),
                          Text(
                            'status',
                            style: h5(context: context, fontWeight: '700'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formatHour.format(DateTime.now()),
                        style: h5(context: context, color: grey700),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: yellow100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Open',
                      style: h7(
                          context: context,
                          color: yellow800,
                          fontWeight: '700'),
                    ),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  const Icon(Icons.east),
                  const SizedBox(
                    width: 23,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: blue100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'In Progress',
                      style: h7(
                          context: context, color: blue800, fontWeight: '700'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Myra Douglas ',
                                  style: h5(
                                      context: context,
                                      fontWeight: '700',
                                      color: black),
                                ),
                                Text(
                                  'change ',
                                  style: h5(
                                    context: context,
                                  ),
                                ),
                                Text(
                                  'status',
                                  style:
                                      h5(context: context, fontWeight: '700'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              formatHour.format(DateTime.now()),
                              style: h5(context: context, color: grey700),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Dr. Martin Wallace provides answers that are inspring and sensible. I know that but what lifestyle and food I need to know that?',
                        style: h12(context: context, color: black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
