import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCpn extends StatelessWidget {
  const ShimmerCpn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color4.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: grey100,
            highlightColor: isabelline,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: isabelline),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Shimmer.fromColors(
                    baseColor: grey100,
                    highlightColor: isabelline,
                    child: Container(
                      width: 225,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isabelline),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: grey100,
                  highlightColor: isabelline,
                  child: Container(
                    width: 145,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isabelline),
                  ),
                )
              ],
            ),
          ),
          Shimmer.fromColors(
            baseColor: grey100,
            highlightColor: isabelline,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: isabelline),
            ),
          )
        ],
      ),
    );
  }
}
