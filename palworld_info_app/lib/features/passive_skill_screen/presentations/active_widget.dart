import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domains/active_skill_entity.dart';
import '../data/active_skill_controller.dart';

class ActiveWidget extends StatelessWidget {
  const ActiveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final activeSkill = ref.watch(activeSkillControllerProvider);

        return activeSkill.when(
          data: (data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 18,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 60,),
                    Expanded(
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Text(
                        'Power',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      child: Text(
                        'CD',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        ActiveSkillEntity activeSkill = data[index];
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 60,
                                      child: CachedNetworkImage(
                                        imageUrl: activeSkill
                                            .element!.iconUrl!,
                                        height: 36,
                                      )),
                                  Expanded(
                                    child: AutoSizeText(
                                      activeSkill.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 40,
                                      child: Text(
                                        '${activeSkill.power}',

                                      )),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        '${activeSkill.cd}s',

                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                activeSkill.desc!
                                    .replaceAll('\n', ''),
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.left,
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
