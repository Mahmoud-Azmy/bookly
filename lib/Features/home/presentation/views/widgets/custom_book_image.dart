// import 'package:flutter/material.dart';

// class CustomBookImage extends StatelessWidget {
//   const CustomBookImage(
//       {super.key, required this.raduis, required this.imageUrl});
//   final double raduis;
//   final String imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: AspectRatio(
//         aspectRatio: 0.68,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRaduis: BorderRaduis.circular(raduis),
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(imageUrl),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Implementation of CustomBookImage
class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  final double raduis;

  const CustomBookImage({
    super.key,
    required this.imageUrl,
    this.raduis = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(raduis),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
