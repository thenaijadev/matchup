import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:matchup/core/utils/app_constraints.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/news/data/models/news_item.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.isFirst,
    required this.news,
  });
  final NewsItem news;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/cnn.png",
                        )),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        width: 2),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextWidget(
                  text: "CNN News",
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 15,
                ),
                TextWidget(
                  // text: DateFormat('hh:mm a').format(news.createdAt!),
                  text: news.createdAt ?? "2 hours ago",
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
            if (isFirst) const Flexible(child: TextWidget(text: "Read More"))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230.width,
              child: HtmlWidget(
                news.content ?? "",
                textStyle: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            ClipRRect(
              // borderRadius: BorderRadius.circular(100),
              child: Image.network(
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fitWidth,
                news.poster ?? "",
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/news_item.png",
                    width: 100.width,
                  );
                },
                loadingBuilder: (context, imageProvider, loadingProgress) {
                  if (loadingProgress == null) {
                    return imageProvider; // image is already loaded
                  }
                  return Center(
                      child: SpinKitChasingDots(
                    color: Theme.of(context).colorScheme.primary,
                  ));
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
