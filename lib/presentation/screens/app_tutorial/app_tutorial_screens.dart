import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<SlideInfo> slides = [
  SlideInfo(
    title: 'Busca la comida',
    caption:
        'Do est Lorem occaecat irure et id aliquip officia aliqua velit cupidatat occaecat esse.',
    imageUrl: 'assets/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption:
        'Do est Lorem occaecat irure et id aliquip officia aliqua velit cupidatat occaecat esse.',
    imageUrl: 'assets/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Do est Lorem occaecat irure et id aliquip officia aliqua velit cupidatat occaecat esse.',
    imageUrl: 'assets/3.png',
  )
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Skip'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 50,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
