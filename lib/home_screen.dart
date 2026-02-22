import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_practices/slider_provider.dart';

final nameProvider = Provider<String>((ref) {
  return "Jubayed";
});

final isSwitchProvider = StateProvider<bool>((ref){
  return false;
});

final counter = StateProvider<int>((ref){
  return 0;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final slider = ref.watch(sliderProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [

          Container(
            height: 200,
            width: 200,
            color: Colors.red.withValues(alpha: .5),
          ),
          Slider(value: slider, onChanged: (double value) {

          },),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, child) {
              var isConnect = ref.watch(isSwitchProvider);
              print("build 2");
              return Switch(value: isConnect, onChanged: (v){
                ref.read(isSwitchProvider.notifier).state =v;
              });
            },

          ),
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

/*

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   print("build");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, child) {
              var isConnect = ref.watch(isSwitchProvider);
              print("build 2");
              return Switch(value: isConnect, onChanged: (v){
                ref.read(isSwitchProvider.notifier).state =v;
              });
            },

          ),
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
*/
