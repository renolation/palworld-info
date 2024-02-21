import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domains/partner_skill_entity.dart';
import '../data/partner_skill_controller.dart';

class PartnerWidget extends StatelessWidget {
  const PartnerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final partnerSkill = ref.watch(partnerSkillControllerProvider);
        return partnerSkill.when(
          data: (data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 18,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    Text(
                      'Skill',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Pal',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        PartnerSkillEntity partnerSkills = data[index];
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black54),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 80,
                                      child: CachedNetworkImage(
                                        imageUrl: partnerSkills
                                            .partner!.iconUrl!,
                                        height: 36,
                                      )),
                                  Expanded(
                                    child: AutoSizeText(
                                      partnerSkills.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 80,
                                      child: CachedNetworkImage(
                                        imageUrl: partnerSkills
                                            .pal![0].iconUrl!,
                                        height: 36,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                partnerSkills.description!
                                    .replaceAll('\n', ''),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          },
          error: (err, stack) => Text('Error $err'),
          loading: () => LoadingAnimationWidget.fourRotatingDots(color: Colors.white, size: 50),
        );
      },
    );
  }
}
