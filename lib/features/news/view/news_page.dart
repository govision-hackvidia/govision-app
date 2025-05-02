import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/news/news.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Latest',
    'Headline News',
    'Technology',
    'Health',
    'Sports',
  ];

  @override
  void initState() {
    super.initState();
    // Fetch news when the page initializes
    context.read<NewsBloc>().add(const NewsEvent.getAllNews());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              24,
              24,
              24,
              kBottomNavigationBarHeight,
            ),
            child: Column(
              children: [
                Divider(color: colors.borderGray, height: 1),
                SizedBox(
                  height: 48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_categories.length, (index) {
                          final category = _categories[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == _categories.length - 1 ? 0 : 8,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                setState(() {
                                  _selectedCategory = category;
                                });
                                // You could add filtering by category here
                              },
                              child: Ink(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  category,
                                  style:
                                      _selectedCategory == category
                                          ? textTheme.caption1Bold.copyWith(
                                            color: colors.primary,
                                          )
                                          : textTheme.caption1Medium.copyWith(
                                            color: colors.secondaryGray,
                                          ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Divider(color: colors.borderGray, height: 1),
                24.vertical,
                // Show loading/error/news content based on state
                state.news.when(
                  initial: SizedBox.new,
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error: (error) => Center(child: Text('Error: $error')),
                  data: (newsList) {
                    if (newsList.isEmpty) {
                      return const Center(child: Text('No news available'));
                    }

                    // Use the first news item as the featured news
                    final featuredNews = newsList.first;

                    return Column(
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: featuredNews.photo ?? '',
                              width: double.infinity,
                              height: 265,
                              fit: BoxFit.cover,
                              imageBuilder:
                                  (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 265,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: colors.secondaryBlue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'WORLD',
                                      style: textTheme.smallCaption1SemiBold
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                  8.vertical,
                                  Text(
                                    featuredNews.title ?? '',
                                    style: GoogleFonts.lora(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  8.vertical,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${featuredNews.date} - ${featuredNews.source}',
                                        style: textTheme.caption2Bold.copyWith(
                                          color: colors.captionGray,
                                        ),
                                      ),
                                      Text(
                                        '${featuredNews.minutes}',
                                        style: textTheme.caption2Bold.copyWith(
                                          color: colors.captionGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        24.vertical,
                        Divider(color: colors.borderGray, height: 1),
                        16.vertical,
                        Row(
                          children: [
                            Assets.icons.hotNews.image(width: 24, height: 24),
                            8.horizontal,
                            Text(
                              'Hot News',
                              style: GoogleFonts.lora(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'See all',
                              style: textTheme.body2SemiBold.copyWith(
                                color: colors.secondaryBlue,
                              ),
                            ),
                          ],
                        ),
                        16.vertical,
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: newsList.length > 5 ? 5 : newsList.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const SizedBox.shrink();
                            }
                            final news = newsList[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: index == 4 ? 0 : 16,
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: () {
                                  pushTransition(
                                    context,
                                    NewsDetailPage(news: news),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'WORLD',
                                            style: textTheme.caption2Bold
                                                .copyWith(color: colors.red),
                                          ),
                                          4.vertical,
                                          Text(
                                            news.title ?? '',
                                            style: GoogleFonts.lora(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          8.vertical,
                                          Text(
                                            '${news.date} - ${news.source}  ${news.minutes}',
                                            style: textTheme.caption2Bold
                                                .copyWith(
                                                  color: colors.captionGray,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    12.horizontal,
                                    Container(
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          image: NetworkImage(news.photo ?? ''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
