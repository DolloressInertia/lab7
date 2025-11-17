/*

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab7/translations/locale_keys.g.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _lifeStoryController = TextEditingController();
  bool _hidePass = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lifeStoryController.dispose();
    super.dispose();
  }

  void _submitForm() {
    print('Name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('email: ${_emailController.text}');
    print('life: ${_lifeStoryController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.registeredForm.tr()),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: LocaleKeys.fullName.tr(),
                hintText: LocaleKeys.whatDoPplCallYou.tr(),
                prefixIcon: const Icon(Icons.person),
                suffixIcon: const Icon(Icons.delete_outline, color: Colors.red),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: LocaleKeys.phoneNumber.tr(),
                  hintText: LocaleKeys.whereCanWeReachYou.tr(),
                  helperText: 'Phone format: (xxx)xxx-xxx',
                  prefixIcon: const Icon(Icons.call),
                  suffixIcon:
                      const Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),

                // not sure if htis is correct
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emailFieldCannotBeEmpty.tr();
                  }

                  // This single function checks the full email format
                  // if (!EmailValidator.validate(value)) {
                  // return 'Enter a valid email address';
                  // }
                  return null;
                }),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: LocaleKeys.emailAddress.tr(),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _lifeStoryController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: LocaleKeys.lifeStory.tr(),
                helperText: LocaleKeys.keepItShort.tr(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.password.tr(),
                hintText: LocaleKeys.enterYourPasswordAgain.tr(),
                icon: Icon(Icons.security),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.enterYourPasswordConfirmPassword.tr(),
                hintText: LocaleKeys.enterYourPasswordAgain.tr(),
                icon: const Icon(Icons.border_color),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(const Locale('ru'));
              },
              child: const Text("RU"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(const Locale('kk'));
              },
              child: const Text("KZ"),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
//import 'bloc/auth_event.dart';
//import 'bloc/auth_state.dart';
import 'translations/locale_keys.g.dart';

// 1. Convert to a StatefulWidget to manage the local _hidePass toggle
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Use a GlobalKey for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Your existing controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _lifeStoryController = TextEditingController();

  bool _hidePass = true;

  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final RegExp phoneRegex = RegExp(r'^\d{10}$'); // 10 digits only

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lifeStoryController.dispose();
    super.dispose();
  }

  // 2. New function to dispatch the BLoC event
  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Dispatch the RegisterEvent to the AuthBloc
      context.read<AuthBloc>().add(
            RegisterEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 3. BlocListener wraps the whole Scaffold for side effects
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // Navigate to the UserInfoPage (defined as '/second' in main.dart)
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.of(context).pushReplacementNamed('/second');
        } else if (state is AuthFailure) {
          // Show error SnackBar on failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Registration Failed: ${state.error}'), // Use state.error from BLoC
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.registeredForm.tr()),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey, // Attach the GlobalKey
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // ... Your other TextFormFields (Name, Phone, Email, Life Story) ...

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.fullName.tr(),
                  hintText: LocaleKeys.whatDoPplCallYou.tr(),
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon:
                      const Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Name cannot be empty' : null,
              ),
              const SizedBox(height: 10),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: LocaleKeys.phoneNumber.tr(),
                  hintText: LocaleKeys.whereCanWeReachYou.tr(),
                  helperText: 'Phone format: (xxx)xxx-xxx',
                  prefixIcon: const Icon(Icons.call),
                  suffixIcon:
                      const Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number cannot be empty';
                  }
                  if (!phoneRegex.hasMatch(value)) {
                    return 'Phone must be 10 digits (example: 7771234567)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Email Field (Used for BLoC registration)
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: LocaleKeys.emailAddress.tr(),
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Life Story Field
              TextFormField(
                controller: _lifeStoryController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: LocaleKeys.lifeStory.tr(),
                  helperText: LocaleKeys.keepItShort.tr(),
                ),
              ),
              const SizedBox(height: 10),

              // Password Field (Used for BLoC registration)
              TextFormField(
                controller: _passwordController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: LocaleKeys.password.tr(),
                  hintText: LocaleKeys.enterYourPasswordAgain.tr(),
                  icon: const Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                ),
                validator: (value) => value!.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
              ),
              const SizedBox(height: 10),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: LocaleKeys.enterYourPasswordConfirmPassword.tr(),
                  hintText: LocaleKeys.enterYourPasswordAgain.tr(),
                  icon: const Icon(Icons.border_color),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 4. BlocBuilder wraps the button to manage the loading state
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bool isLoading = state is AuthLoading;

                  return ElevatedButton(
                    // Call the new BLoC submission function
                    onPressed: isLoading ? null : () => _submitForm(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 3),
                          )
                        : const Text(
                            'Submit Form',
                            style: TextStyle(color: Colors.white),
                          ),
                  );
                },
              ),

              const SizedBox(height: 10),
              // Your Localization buttons (unmodified)
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('ru'));
                },
                child: const Text("RU"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('kk'));
                },
                child: const Text("KZ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
