// ignore_for_file: lines_longer_than_80_chars


import 'package:equatable/equatable.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
          image: MediaRes.firstOnBoarding,
          title: 'Welcome to TIGABELAS',
          description:
              "We're here to support your learning endeavors, whether you're a student, professional, or simply curious about the world.",
        );

  const PageContent.second()
      : this(
          image: MediaRes.secondOnBoarding,
          title: 'Explore Diverse Subjects',
          description:
              " Immerse yourself in a wide range of subjects and courses. We offers a diverse and rich selection of content to match your interests and goals.",
        );

  const PageContent.third()
      : this(
          image: MediaRes.thirdOnBoarding,
          title: 'Track Your Learning Progress',
          description:
              "Monitor your progress, set achievable learning objectives, and receive personalized recommendations.",
        );

  final String image;
  final String title;
  final String description;

  @override
  List<Object?> get props => [image, title, description];
}
