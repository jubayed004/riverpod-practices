import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nameProvider = Provider<String>((ref) {
  return "Jubayed";
});

final counter = StateProvider<int>((ref){
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref,  child) {
              final count = ref.watch(counter);
              print("Build 1");
              return Text(
                count.toString(),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),
              );
            },

          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state--;

              },
                  child: Text("-")
              ),
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state++;

              },
                  child: Text("+")
              ),
            ],
          ),
        ],
      ),
    );
  }
}
