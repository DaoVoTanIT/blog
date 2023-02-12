import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/common/widget/photo_view.dart';
import 'package:flutter/material.dart';

Widget informationAssets(
  BuildContext context,
  AssetsDb e,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: color4.withOpacity(0.04),
          offset: const Offset(0, 5),
          blurRadius: 10)
    ], color: grey100, borderRadius: BorderRadius.circular(16)),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewPhotoPage(image: e.db.imageUrl),
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedNetworkImage(
                    imageUrl: e.db.imageUrl.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 77.0,
                      height: 77.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey300),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    right: -8,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: backgroundWhite),
                          borderRadius: BorderRadius.circular(90.0),
                          color: greenDeep),
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            color: malachite,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                  color: malachite.withOpacity(0.5),
                                  blurRadius: 8)
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            e.listSubAsset!.isEmpty
                ? const SizedBox()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(7)),
                    child: Text('${e.listSubAsset?.length} Sub Asets',
                        style: const TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: backgroundWhite)),
                  ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                e.db.assetName,
                style: h5(
                  color: dodgerBlue,
                  fontWeight: '700',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                e.db.assetCode,
                style: h7(context: context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                e.db.location.toString(),
                style: h7(context: context, fontWeight: '600'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                e.db.assetTypeCode.toString(),
                style:
                    h7(context: context, color: tiffanyBlue, fontWeight: '600'),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
