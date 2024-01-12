import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

class UploadField extends StatelessWidget {
  final double uploadwidth;
  final double uploadheight;
  final Function()? onPress;
  final String imageFile;

  const UploadField(
      {super.key,
      required this.uploadheight,
      required this.uploadwidth,
      required this.imageFile,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onPress,
              child: Container(
                width: uploadwidth,
                height: uploadheight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.3), width: 1.0),
                ),
                child: imageFile != "1"
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: imageFile.contains('assets')
                            ? Image.asset(
                                imageFile,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(imageFile),
                                fit: BoxFit.cover,
                              ),
                      )
                    : IconButton(
                        icon: SvgPicture.asset('assets/images/upload.svg'),
                        onPressed: onPress),
              ),
            )
          ],
        ),
      ],
    );
  }
}
