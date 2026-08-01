import 'package:flutter/material.dart';
import 'package:sawany/auth/identity_selection_screen.dart';
import 'student_signup_screens.dart'; // تأكدي إن المسار ده مظبوط عندك

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  int currentPage = 0;

  // ألوان سوقني
  static const Color primaryColor = Color(0xFF0E216C); // كحلي
  static const Color accentColor = Color(0xFFFE8511); // برتقالي
  static const Color greyColor = Color(0xFF838C91); // رمادي

  final List<Map<String, String>> pages = [
    {
      "image": "assets/loc.png", // تم تعديل المسار هنا
      "title": "ابحث عن أفضل مدرب قيادة",
      "description":
          "اعثر على أقرب مدرب أو مدرسة قيادة بسهولة وفي وقت قليل.",
    },
    {
      "image": "assets/pri.png", // تم تعديل المسار هنا
      "title": "قارن قبل الحجز",
      "description":
          "شاهد الأسعار والتقييمات لكل مدرب واختر الأنسب لك.",
    },
    {
      "image": "assets/reser.png", // تم تعديل المسار هنا
      "title": "حجز ودفع آمن",
      "description":
          "احجز بثقة وادفع بأمان مع إمكانية استبدال المدرب.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضمان ظهور النصوص والاتجاهات بالعربي
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Logo Text
              const Align(
                alignment: Alignment.topLeft, // عشان يتوافق مع الـ RTL
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "سوّقني",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),

                          Expanded(
                            child: Image.asset(
                              pages[index]["image"]!,
                              fit: BoxFit.contain,
                              // الأداة دي هتعرض أيقونة رمادي لو الصورة مظهرتش عشان الأبلكيشن ميعملش كراش
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image_not_supported_rounded,
                                  size: 100,
                                  color: greyColor,
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Title
                          Text(
                            pages[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 15),

                          /// Description
                          Text(
                            pages[index]["description"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: greyColor,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? accentColor
                          : greyColor.withOpacity(.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Back Button
                    TextButton(
                      onPressed: currentPage == 0
                          ? null
                          : () {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                      child: Text(
                        "رجوع",
                        style: TextStyle(
                          color: currentPage == 0
                              ? greyColor.withOpacity(.5)
                              : primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /// Next Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (currentPage < pages.length - 1) {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IdentitySelectionScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        currentPage == pages.length - 1
                            ? "ابدأ الآن"
                            : "التالي",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}