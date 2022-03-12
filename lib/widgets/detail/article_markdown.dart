import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../core/custom_color.dart';

class ArticleMarkdown extends StatelessWidget {
  final String? markdownSource;

  const ArticleMarkdown({
    Key? key,
    required this.markdownSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (markdownSource?.isNotEmpty ?? false)
        ? Markdown(
            selectable: true,
            data: markdownSource!,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              h1: const TextStyle(
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              h2: const TextStyle(
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              h3: const TextStyle(
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              h4: const TextStyle(
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              p: const TextStyle(
                color: CustomColors.secondaryText,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              strong: const TextStyle(
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              listBullet: const TextStyle(
                color: CustomColors.secondaryText,
                fontSize: 15,
                height: 1.8,
                letterSpacing: 0.5,
              ),
              textAlign: WrapAlignment.spaceBetween,
              orderedListAlign: WrapAlignment.spaceEvenly,
              unorderedListAlign: WrapAlignment.spaceBetween,
              h1Align: WrapAlignment.center,
              h2Align: WrapAlignment.start,
              h3Align: WrapAlignment.spaceEvenly,
              h4Align: WrapAlignment.start,
            ),
            // imageBuilder: (imageProvider, string, markdownSource) {
            //   return GestureDetector(
            //     onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => FullScreenImage(
            //           imageProvider: CachedNetworkImageProvider(
            //             imageProvider?.toString() ?? "",
            //           ),
            //           backgroundDecoration: const BoxDecoration(
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(8.0),
            //       child: CachedNetworkImage(
            //         imageUrl: imageProvider?.toString() ?? "",
            //         errorWidget: (context, object, stackTrace) {
            //           return Image.asset(
            //             "assets/logo.png",
            //             width: 40,
            //           );
            //         },
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   );
            // },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
