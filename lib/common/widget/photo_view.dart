import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhotoPage extends StatefulWidget {
  const ViewPhotoPage({super.key, this.image});
  final String? image;
  @override
  State<StatefulWidget> createState() => _ViewPhotoPageState();
}

class _ViewPhotoPageState extends State<ViewPhotoPage> {
  late PhotoViewController controller;
  double? scaleCopy;
  @override
  void initState() {
    super.initState();
    controller = PhotoViewController()..outputStateStream.listen(listener);
  }

  void listener(PhotoViewControllerValue value) {
    setState(() {
      scaleCopy = value.scale;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(),
      body: SafeArea(
        bottom: false,
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(color: backgroundWhite),
          enableRotation: true,
          controller: controller,
          imageProvider: CachedNetworkImageProvider(widget.image ??
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
        ),
      ),
    );
  }
}
