import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/views/full_screen_image.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/glow_hover_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeSliverDelegate extends StatelessWidget {
  const ResumeSliverDelegate({super.key, required this.colorDelegate});

  final Color colorDelegate;

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw 'Could not launch $url';
    }
  }

  void openImagePage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            FullScreenImage(heroTag: 'avatarHero', imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorIcon = isDark ? AppColors.iconSkillsDark : Colors.blueGrey;

    final List<String> stringList = ["Open CV", 'Download CV'];
    final List<String> stringIcon = [
      'assets/images/icons_svg/resume_svg/open-svgrepo-com.svg',
      "assets/images/icons_svg/resume_svg/download_1.svg",
    ];

    final List<String> urlList = [
      "https://google.com", // يفتح رابط
      "imagePage", // يدل على فتح صفحة داخلية
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 75,
        runSpacing: 12,
        children: List.generate(2, (index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  openImagePage(
                    context,
                    "assets/images/MSultanCV.jpg",
                  );
                } else {
                  openUrl(
                    "https://drive.google.com/file/d/1iHDFV-J3irEMFwa0DTcVKz9RcLEqwurm/view?usp=sharing",
                  );
                }
              },
              child: GlowHoverContainer(
                width: 190,
                height: 45,
                color: colorIcon,
                borderColor: Colors.grey,
                borderWidth: 1,
                glowOpacity: 0.5,
                blurRadius: 4,
                spreadRadius: 1,
                scaleFactor: 1.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(stringList[index]),
                    const SizedBox(width: 10),
                    SvgPicture.asset(stringIcon[index], width: 22, height: 22),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
