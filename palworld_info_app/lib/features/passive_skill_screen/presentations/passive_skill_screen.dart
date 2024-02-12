import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/passive_skill_entity.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/passive_skill_controller.dart';

class PassiveSkillScreen extends HookConsumerWidget {
  const PassiveSkillScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passive Skills'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final passiveSkill = ref.watch(passiveSkillControllerProvider);
        return passiveSkill.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
              final PassiveSkillEntity passiveSkillEntity = data[index];
              return Text(passiveSkillEntity.name!);
            });
          },
          error: (err, stack) => Text('Error $err'),
          loading: () => Text('loading'),
        );
      }),
    );
  }
}
