import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
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
            return DataTable2(columns: const [
              DataColumn2(
                label: Text('Name'),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Description'),
              ),
            ], rows: [
              for(var item in data)
                DataRow(cells: [
                  DataCell(Text(item.name!)),
                  DataCell(ListView.builder(
                    shrinkWrap: true,
                    itemCount: item.passiveDesc!.length,
                    itemBuilder: (context, index) {
                      var desc = item.passiveDesc![index];
                      return AutoSizeText(
                        desc.name!,
                        minFontSize: 10,
                        style: TextStyle(color: desc.isPositive! ? Colors.green : Colors.red),
                      );
                    },
                  )),

                ])
            ]);
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
