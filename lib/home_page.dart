import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language_app/language_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.heading),
        actions: [
          DropdownButton<Locale>(
            value: context.watch<LanguageProvider>().selectedLocale,
            icon: const Icon(Icons.language),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                context
                    .read<LanguageProvider>()
                    .changeLanguage(newLocale.languageCode);
              }
            },
            items: LanguageProvider.languages
                .map((language) => DropdownMenuItem(
                      value: Locale(language['locale']),
                      child: Text(language['name']),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.heading,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.emailHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.passwordHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.forgetPass),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.btnLogin),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.txtNoAcc),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.txtSignUp),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {},
                  tooltip: AppLocalizations.of(context)!.google,
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {},
                  tooltip: AppLocalizations.of(context)!.facebook,
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {},
                  tooltip: AppLocalizations.of(context)!.twitter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
