import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/entities/page_content.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: context.width * .1),
          padding: EdgeInsets.all(context.width * .1),
          child: Image.asset(
            pageContent.image,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(context.width * .1),
                  child: Column(
                    children: [
                      Text(
                        pageContent.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: context.textTitleSmall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.width * .01),
                      Text(
                        pageContent.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: context.textDescriptionMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
