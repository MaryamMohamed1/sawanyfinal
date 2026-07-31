import 'package:flutter/material.dart';
import 'trainer_widgets/trainerheader.dart';
import 'trainer_widgets/trainerbio.dart';
import 'trainer_widgets/trainercar.dart';
import 'trainer_widgets/trainerschedule.dart';
import 'trainer_widgets/trainerreviews.dart';
import 'trainer_widgets/trainerbottombar.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor:Color(0xFF0E216C) ,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color:const Color(0xFFFFFFFF) ,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(

            'تفاصيل المدرب',
            style: TextStyle(
              color: const Color(0xFFFAFAFA),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            // أيقونة المشاركة فقط (تم شطب أيقونة الإعدادات)
            IconButton(
              icon: const Icon(
                Icons.share_outlined,
                color: Color(0xFF0E216C),
              ),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: const Color(0xFF838C91).withOpacity(0.2),
              height: 1,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                physics: const BouncingScrollPhysics(),
                children: const [
                  TrainerHeader(),
                  SizedBox(height: 12),
                  TrainerBio(),
                  SizedBox(height: 12),
                  TrainerCar(),
                  SizedBox(height: 12),
                  TrainerSchedule(),
                  SizedBox(height: 12),
                  TrainerReviews(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const TrainerBottomBar(),
          ],
        ),
      ),
    );
  }
}