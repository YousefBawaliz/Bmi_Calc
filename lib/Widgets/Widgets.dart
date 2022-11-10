import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';

class ReUsabaleCard extends StatelessWidget {
  ReUsabaleCard({required this.colour, this.childWidget, this.onTapFunction});

  final Color colour;
  final Widget? childWidget;
  final VoidCallback? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    required this.icon,
    required this.function,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        minimumSize: const Size(60, 50),
      ),
      onPressed: function,
      child: Icon(icon),
    );
  }
}
