import 'package:flutter/material.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';

Widget logInButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 180.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: kHomeListScreenStartGradient,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        ),
        BoxShadow(
          color: kHomeListScreenEndGradient,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        ),
      ],
      gradient: LinearGradient(
          colors: [kHomeListScreenStartGradient, kHomeListScreenEndGradient],
          begin: const FractionalOffset(0.2, 0.2),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    ),
    child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: kHomeListScreenEndGradient,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            AppLocalizations.of(context).translate('logIn'),
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "WorkSansBold"),
          ),
        ),
        onPressed: () async {}),
  );
}
