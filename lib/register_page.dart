/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Form'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'WHAT DO PPL CALL YOU?',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Where can we reach you?',
                  helperText: 'Phone format: (xxx)xxx-xxx',
                  prefixIcon: Icon(Icons.call),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  )),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'enter the password',
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: Icon(Icons.security),
              ),
            ),

            bool _hidePass = true;

            final _nameController = TextEditingController();
            @override
            void dispose(){
              _nameController.dispose();
              super.dispose();

            };

            @override
            widget build(BuildContext context){
              return Scaffold(
            SizedBox(
              height: 10,
            ),
            RaisedButton(
            onPressed: _submitForm,
            Color: Colors.green,
            child: Text('Submit Form', style: TextStyle(color: Colors.white),)
            ),
              ),
            }

          
          ],
        ),
      ),
    );
  void _submitForm() {
    print('Name: ${_nameController.text}');
  }
    
  }
}

*/

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
                icon: const Icon(Icons.security),
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
