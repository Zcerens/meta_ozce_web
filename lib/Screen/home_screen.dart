import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meta_ozce_0/const/background.dart';
import 'package:meta_ozce_0/Screen/components/home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      title: "METAOZCE WEB",
      child: const HomeForm(),
    );
  }
}
