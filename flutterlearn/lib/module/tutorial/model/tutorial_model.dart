import 'package:flutterlearn/util/helper/app_image.dart';
import 'package:flutterlearn/util/helper/app_string.dart';

class TutorialModel {
  String appName;
  String image;
  String title;
  String description;
  TutorialModel({
    required this.appName,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<TutorialModel> tutorialData = [
  TutorialModel(
      appName: "Eazy ATM",
      image: AppImage.tutorialImage1,
      title: AppString.tutorialTitle1,
      description: AppString.tutorialDescription),
  TutorialModel(
      appName: "Eazy ATM",
      image: AppImage.tutorialImage2,
      title: AppString.tutorialTitle2,
      description: AppString.tutorialDescription),
  TutorialModel(
      appName: "Eazy ATM",
      image: AppImage.tutorialImage3,
      title: AppString.tutorialTitle3,
      description: AppString.tutorialDescription),
  TutorialModel(
      appName: "Eazy ATM",
      image: AppImage.tutorialImage4,
      title: AppString.tutorialTitle4,
      description: AppString.tutorialDescription),
  TutorialModel(
      appName: "Eazy ATM",
      image: AppImage.tutorialImage5,
      title: AppString.tutorialTitle6,
      description: AppString.tutorialDescription)
];
