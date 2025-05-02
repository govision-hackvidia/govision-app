import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/data.dart';
import 'package:govision/features/news/news.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({required this.news, super.key});

  final NewsModel news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final news = widget.news;

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: MoreCircleWidget(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category badge - Using source since category isn't in the model
            if (news.source != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: colors.secondaryBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'WORLD',
                  style: textTheme.caption2Bold.copyWith(color: Colors.white),
                ),
              ),
            24.vertical,
            // News title
            if (news.title != null)
              Text(
                news.title!,
                style: GoogleFonts.lora(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            16.vertical,
            // Date and read time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (news.date != null)
                  Text(
                    news.date!,
                    style: textTheme.caption2Bold.copyWith(
                      color: colors.captionGray,
                    ),
                  ),
                if (news.minutes != null)
                  Text(
                    '${news.minutes!} min read',
                    style: textTheme.caption2Bold.copyWith(
                      color: colors.captionGray,
                    ),
                  ),
              ],
            ),
            24.vertical,
            // News image
            if (news.photo != null)
              Container(
                width: double.infinity,
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(news.photo!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.blindMan.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            24.vertical,
            // Highlighted text (quote)
            QuoteBlockWidget(text: news.highlightedText!),
            24.vertical,
            // News description
            if (news.desc != null)
              Text(news.desc!, style: textTheme.body2Regular),
          ],
        ),
      ),
    );
  }
}
