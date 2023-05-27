import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';

class Bulkhead extends StatelessWidget {
  const Bulkhead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DesignKit.getHeight(context, 5),
      margin: EdgeInsets.symmetric(vertical: DesignKit.getHeight(context, 10)),
      color: DesignKit.featherDirtGreen,
    );
  }
}

class BoldText12 extends StatelessWidget {
  const BoldText12(this.data, {super.key, this.textColor, this.textAlign});

  final String data;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 12),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BoldText14 extends StatelessWidget {
  const BoldText14(this.data, {super.key, this.textColor, this.textAlign});

  final String data;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 14),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BoldText16 extends StatelessWidget {
  const BoldText16(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 16),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class BoldText18 extends StatelessWidget {
  const BoldText18(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 18),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class BoldText20 extends StatelessWidget {
  const BoldText20(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 20),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class BoldText24 extends StatelessWidget {
  const BoldText24(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 24),
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class PlainText10 extends StatelessWidget {
  const PlainText10(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 10),
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class PlainText12 extends StatelessWidget {
  const PlainText12(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 12),
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class PlainText14 extends StatelessWidget {
  const PlainText14(this.data, {super.key, this.textColor});

  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: DesignKit.getFontSize(context, 14),
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class SwingElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final double? width;

  const SwingElevatedButton({
    super.key,
    this.onPressed,
    this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          DesignKit.getWidth(context, width ?? 340),
          DesignKit.getHeight(context, 45),
        ),
        backgroundColor: DesignKit.lightGreen,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: DesignKit.tonalGreen),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              DesignKit.getWidth(context, 10),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: text != null
          ? BoldText14(
              text!,
              textColor: DesignKit.deepGreen,
            )
          : null,
    );
  }
}

class SectionBox extends StatelessWidget {
  Widget child;

  SectionBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: DesignKit.getHeight(context, 25),
        horizontal: DesignKit.getWidth(context, 25),
      ),
      child: Column(
        children: [
          BoldText18('프로필'),
          Bulkhead(),
          child,
        ],
      ),
    );
  }
}
