import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/features/detail_screen/data/detail_pal_controller.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({
    required this.slug,
    Key? key,
  }) : super(key: key);

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailPal = ref.watch(detailPalControllerProvider(slug));
    return Scaffold(
      appBar: AppBar(title: Text(slug),),
      body: Container(
        child: detailPal.when(
          data: (data) => Text(data.name!),
          error: (err, stack) => Text('Error $err'),
          loading: () => Text('loading'),
        )
      ),
    );
  }
}
