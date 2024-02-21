import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:palworld_info_app/domains/active_skill_entity.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';
import 'package:palworld_info_app/domains/passive_skill_entity.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/active_skill_controller.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/partner_skill_controller.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/passive_skill_controller.dart';

import 'active_widget.dart';
import 'partner_widget.dart';
import 'passive_widget.dart';

class PassiveSkillScreen extends HookConsumerWidget {
  const PassiveSkillScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        bottom: TabBar(
          controller: tabBarController,
          labelStyle: TextStyle(fontSize: 20),
          tabs: const [
            Tab(
              text: 'Passive',
            ),
            Tab(
              text: 'Partner',
            ),
            Tab(
              text: 'Active',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabBarController,
        children: const [
          PassiveWidget(),
          PartnerWidget(),
          ActiveWidget(),
        ],
      ),
    );
  }
}



