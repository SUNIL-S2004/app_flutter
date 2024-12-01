import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_captcha/local_captcha.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _captchaFormKey = GlobalKey<FormState>();
  final _localCaptchaController = LocalCaptchaController();
  final _applicationNumberController = TextEditingController();
  final _captchaController = TextEditingController();
  final _refreshButtonEnableVN = ValueNotifier(true);

  Timer? _refreshTimer = null;

  @override
  void dispose() {
    _localCaptchaController.dispose();
    _refreshTimer?.cancel();
    _refreshTimer = null;
    _applicationNumberController.dispose();
    _captchaController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_captchaFormKey.currentState?.validate() ?? false) {
      _captchaFormKey.currentState!.save();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserDetailsPage(
            applicationNumber: _applicationNumberController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pensioners Information System',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[50],
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              child: Form(
                key: _captchaFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo-light1.png'),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _applicationNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Application Number',
                        hintText: 'Enter your application number',
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your application number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    LocalCaptcha(
                      key: ValueKey('localCaptcha'),
                      controller: _localCaptchaController,
                      height: 150,
                      width: 300,
                      backgroundColor: Colors.grey[100]!,
                      chars: 'abdefghnryABDEFGHNQRY3468',
                      length: 5,
                      fontSize: 80.0,
                      textColors: [
                        Colors.black54,
                        Colors.grey,
                        Colors.blueGrey,
                        Colors.redAccent,
                        Colors.teal,
                        Colors.amber,
                        Colors.brown,
                      ],
                      noiseColors: [
                        Colors.black54,
                        Colors.grey,
                        Colors.blueGrey,
                        Colors.redAccent,
                        Colors.teal,
                        Colors.amber,
                        Colors.brown,
                      ],
                      caseSensitive: false,
                      codeExpireAfter: Duration(minutes: 10),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _captchaController,
                      decoration: InputDecoration(
                        labelText: 'Enter Captcha',
                        hintText: 'Enter the captcha code',
                        isDense: true,
                        border: OutlineInputBorder(),
                        suffixIcon: Container(
                          padding:
                              EdgeInsets.all(8.0), // Adjust padding as needed
                          child: IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () => _localCaptchaController.refresh(),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the captcha code';
                        }
                        final validation =
                            _localCaptchaController.validate(value);
                        switch (validation) {
                          case LocalCaptchaValidation.invalidCode:
                            return 'Invalid code';
                          case LocalCaptchaValidation.codeExpired:
                            return 'Code expired';
                          case LocalCaptchaValidation.valid:
                          default:
                            return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 40.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        // onPressed: _submitForm,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/menu');
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 40.0,
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: _refreshButtonEnableVN,
                        builder: (context, enable, child) {
                          final onPressed = enable
                              ? () {
                                  if (_refreshTimer == null) {
                                    _refreshTimer =
                                        Timer(const Duration(seconds: 1), () {
                                      _refreshButtonEnableVN.value = true;
                                      _refreshTimer?.cancel();
                                      _refreshTimer = null;
                                    });

                                    _refreshButtonEnableVN.value = false;
                                    _localCaptchaController.refresh();
                                  }
                                }
                              : null;

                          return ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            child: const Text('Refresh'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final String applicationNumber;

  UserDetailsPage({required this.applicationNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Application Number: $applicationNumber'),
              const SizedBox(height: 16.0),
              Text('Name: Sunil'), // Placeholder name
              const SizedBox(height: 16.0),
              Text('Login Time: ${DateTime.now()}'),
            ],
          ),
        ),
      ),
    );
  }
}
