import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      localizationsDelegates: const [
        
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // Add your preferred locales
      ],
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterQuillLocalizationsWidget(
        child: Column(
          children: [
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                showDividers: true,
                toolbarSize: 100,
                sectionDividerSpace: Checkbox.width,
                showFontFamily: true,
                multiRowsDisplay: true,
                color: Colors.deepPurpleAccent,
                showCodeBlock: false,
                controller: QuillController.basic(),
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('en', 'US'),
                ),
              ),
            ),
            Expanded(
              child: YourQuillEditorWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class YourQuillEditorWidget extends StatefulWidget {
  @override
  _YourQuillEditorWidgetState createState() => _YourQuillEditorWidgetState();
}

class _YourQuillEditorWidgetState extends State<YourQuillEditorWidget> {

  
  late QuillController quillController;
  late QuillEditorConfigurations configurations;
  late FocusNode focusNode;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    quillController = QuillController.basic();
    configurations = QuillEditorConfigurations(controller: quillController);
    focusNode = FocusNode();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      configurations: configurations,
      focusNode: focusNode,
      scrollController: scrollController,
    );
  }

  @override
  void dispose() {
    // Dispose the resources to avoid memory leaks
    quillController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
