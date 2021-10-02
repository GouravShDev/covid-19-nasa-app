import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isNotificationAlertOn = false;
  bool isAutoCheckRisk = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'General Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notification alert on high risk'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isNotificationAlertOn = !isNotificationAlertOn;
                          });
                        },
                        icon: (isNotificationAlertOn)
                            ? Icon(Icons.check_circle_outline_outlined)
                            : Icon(Icons.circle_outlined),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Auto check risk'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isAutoCheckRisk = !isAutoCheckRisk;
                          });
                        },
                        icon: (isAutoCheckRisk)
                            ? Icon(Icons.check_circle_outline_outlined)
                            : Icon(Icons.circle_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
