
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Hooks Animation')),
        body: const Center(child: AnimatedWidgetWithHooks()),
      ),
    );
  }
}

class AnimatedWidgetWithHooks extends HookWidget {
  const AnimatedWidgetWithHooks({Key? key});

  @override
  Widget build(BuildContext context) {
    
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    
    final animation = useAnimation(
      Tween(begin: 0.0, end: 1.0).animate(controller),
    );

    
    useEffect(() {
      controller.repeat(reverse: true);
      return controller.dispose; 
    }, [controller]);

    return Opacity(
      opacity: animation,
      child: const FlutterLogo(size: 100),
    );
  }
}
