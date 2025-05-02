import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/data.dart';
import 'package:govision/features/lumen/lumen.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class LumenPage extends StatefulWidget {
  const LumenPage({super.key});

  @override
  State<LumenPage> createState() => _LumenPageState();
}

class _LumenPageState extends State<LumenPage> {
  final List<List<ChatModel>> _conversations = [
    [
      const ChatModel(
        message: 'Sure, I can help you with that.',
        isAnswer: true,
      ),
      const ChatModel(
        message: 'Hello, can you help me with my question?',
        isAnswer: false,
      ),
    ],
    [
      const ChatModel(
        message: 'The capital of France is Paris.',
        isAnswer: true,
      ),
      const ChatModel(
        message: 'What is the capital of France?',
        isAnswer: false,
      ),
    ],
    [
      const ChatModel(
        message: 'Today is sunny with a high of 25°C.',
        isAnswer: true,
      ),
      const ChatModel(
        message: 'Can you tell me about the weather today?',
        isAnswer: false,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: MediaQuery.of(context).viewPadding.top + 24,
            right: 24,
            bottom: kBottomNavigationBarHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MoreCircleWidget(),
                  Text('LUMEN', style: textTheme.body1SemiBold),
                  const EditCircleWidget(),
                ],
              ),
              24.vertical,
              ElevatedButton(
                onPressed: () {
                  pushTransition(context, const LumenDetailPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.add.svg(),
                    10.horizontal,
                    const Text('Add Question'),
                  ],
                ),
              ),
              24.vertical,
              Text('Last Question', style: textTheme.body1SemiBold),
              12.vertical,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _conversations.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final chat = _conversations[index];
                  return GestureDetector(
                    onTap: () {
                      pushTransition(
                        context,
                        LumenDetailPage(conversations: chat),
                      );
                    },
                    child: QuestionCard(
                      question: chat[1].message ?? '',
                      answer: chat[0].message ?? '',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
