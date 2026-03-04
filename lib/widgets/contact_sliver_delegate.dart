import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/contacts_card.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/glow_hover_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsSliverDelegate extends StatelessWidget {
  const ContactsSliverDelegate({super.key, required this.colorDelegate});

  final Color colorDelegate;

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;

    final textPrimary = isDark
        ? AppColors.textLightContainer
        : AppColors.textDarkContainer;

    final List<String> pathImages = [
      'assets/images/icons_svg/contacts_svg/github-color-svgrepo-com.svg',
      'assets/images/icons_svg/contacts_svg/whatsapp-svgrepo-com.svg',
      'assets/images/icons_svg/contacts_svg/gmail-svgrepo-com.svg',
      'assets/images/icons_svg/contacts_svg/linkedin-svgrepo-com.svg',
      'assets/images/icons_svg/contacts_svg/facebook-svgrepo-com.svg',

    ];
    final List<String> stringList = [
      "Github",
      'WhatsApp',
      'Gmail',
      'LinkedIn',
      "FaceBook",

    ];
    final List<String> stringUrl = [
      "https://github.com/msultan74u-eng",
      "https://wa.me/201002449352?text=${Uri.encodeComponent("السلام عليكم ورحمة الله وبركاته")}",
      "mailto:msultan.74u@gmail.com?subject=Project Inquiry&body=Hello Mohamed",
      "https://wa.me/201002449352?text=${Uri.encodeComponent("Hello Mohamed")}",
      "https://www.facebook.com/MRSultan99",

    ];

    return Center(
      child: ConstrainedBox(
        // تحديد أقصى عرض للمحتوى في الويب
        constraints: const BoxConstraints(maxWidth: double.maxFinite),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorDelegate,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orangeAccent.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: SizedBox(
              width: double
                  .infinity, // ✅ يجعل الـ Container يأخذ عرض الشاشة بالكامل
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4),
                  GlowHoverContainer(
                    width: width < 600 ? 200 : width * 0.15,
                    height: width > 600 ? width * 0.15 * 0.22 : 200 * 0.22,
                    color: backgroundColor,
                    borderColor: Colors.cyan,
                    borderWidth: 1,
                    glowOpacity: 0.5,
                    blurRadius: 4,
                    spreadRadius: 1,
                    scaleFactor: 1.15,
                    child: Center(
                      child: AutoSizeText(
                        'Contacts',
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 40,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(pathImages.length, (index) {
                          return ContactsCard(
                            image: pathImages[index],
                            title: stringList[index],
                            onTap: () => openUrl(stringUrl[index]),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
