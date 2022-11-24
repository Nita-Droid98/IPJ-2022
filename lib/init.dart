import 'package:backendless_sdk/backendless_sdk.dart';

class InitApp {
  static const String apiKeyAndroid = 'E9EB7BED-C4FF-4B7C-8F77-82427F7C1DB6';
  static const String apiKeyiOS = '3F47E0B4-C61E-4AFB-8886-52768E94D3EA';
  static const String appID = '90EE7CBA-E3AD-AE2D-FFA6-0023FC5C6C00';

  static void initializeApp() async {
    await Backendless.initApp(
      applicationId: appID,
      iosApiKey: apiKeyiOS,
      androidApiKey: apiKeyAndroid,
    );
    // String result = await context.read<UserService>().checkIfUserLoggedIn();
    // if (result == 'OK') {
    //   Navigator.popAndPushNamed(context, RouteManager.todoPage);
    // } else {
    //   Navigator.popAndPushNamed(context, RouteManager.loginPage);
    // }
  }
}
