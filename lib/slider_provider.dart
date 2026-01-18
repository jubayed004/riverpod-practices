import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';


final sliderProvider = StateProvider<double>((ref){
  return 0.0;
});


/*
class SliderProvider extends StatelessWidget {
  const SliderProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
*/
