import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

class UploadField extends StatelessWidget {
  final double uploadwidth;
  final double uploadheight;
  final Function()? onPress;
  final String imageFile;
  String imageUrl;

  UploadField(
      {super.key,
      required this.uploadheight,
      required this.uploadwidth,
      required this.imageFile,
      required this.imageUrl,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: imageFile != "1" || imageUrl != "" ? onPress : null,
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
                    : imageUrl != ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              imageUrl,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return Text('Error loading image');
                              },
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
