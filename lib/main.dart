import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App Title',
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late QuillController quillController;

  @override
  void initState() {
    super.initState();
    quillController = QuillController.basic();
    // config = QuillEditorConfigurations(controller: quillController);
    // focusNode = FocusNode();
    // scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    quillController.dispose();
    // focusNode.dispose();
    // scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 1)
                ),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 277),
                      child: SizedBox(                       
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: QuillEditor.basic(                              
                                configurations: QuillEditorConfigurations(
                                  padding: const EdgeInsets.all(20),
                                  showCursor: true,                                  
                                  scrollable: true,
                                  onTapOutside: (event, focusNode) {
                                    debugPrint("OutSide Tracked");
                                  },
                                  controller: quillController,
                                  readOnly: false,
                                  
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 30,
                                width: 100,
                                alignment: Alignment.topRight,
                                child: QuillToolbar.simple(
                                  configurations: QuillSimpleToolbarConfigurations(
                                    controller: quillController,
                                    showBackgroundColorButton: false,
                                    showCodeBlock: false,
                                    showListCheck: false,
                                    showSubscript: false,
                                    showSuperscript: false,
                                    showSearchButton: false,
                                    showColorButton: false,
                                    showFontSize: false,
                                    showFontFamily: false,
                                    showUnderLineButton: false,
                                    showHeaderStyle: false,
                                    showAlignmentButtons: false,
                                    showBoldButton: false,
                                    showCenterAlignment: false,
                                    showClearFormat: false,
                                    showDirection: false,
                                    showDividers: true,
                                    showIndent: false,
                                    showInlineCode: false,
                                    showItalicButton: false,
                                    showJustifyAlignment: false,
                                    showLeftAlignment: false,
                                    showLink: false,
                                    showListBullets: false,
                                    showListNumbers: false,
                                    showQuote: false,
                                    showRightAlignment: false,
                                    showSmallButton: false,
                                    showStrikeThrough: false,
                                    toolbarSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(height: 30),
                      QuillToolbar(
                            configurations:   const QuillToolbarConfigurations(
                            
                            ),
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Row(
                                 children: [                                   
                                   QuillToolbarToggleStyleButton(                                      
                                     options: const QuillToolbarToggleStyleButtonOptions(),
                                     controller: quillController,
                                     attribute: Attribute.bold,                                      
                                     
                                   ),
                                   QuillToolbarToggleStyleButton(
                                     options: const QuillToolbarToggleStyleButtonOptions(),
                                     controller: quillController,
                                     attribute: Attribute.italic,
                                   ),
                                   QuillToolbarToggleStyleButton(
                                     controller: quillController,
                                     attribute: Attribute.underline,
                                   ),
                                   QuillToolbarClearFormatButton(
                                     controller: quillController,
                                     options: const QuillToolbarClearFormatButtonOptions(),
                                    
                                   ),                                 
                                  
                                   QuillToolbarToggleStyleButton(
                                     controller: quillController,
                                     attribute: Attribute.ol,
                                   ),
                                   QuillToolbarToggleStyleButton(
                                     controller: quillController,
                                     attribute: Attribute.ul,
                                   ),
                                   QuillToolbarToggleStyleButton(
                                     controller: quillController,
                                     attribute: Attribute.inlineCode,
                                   ),
                                   QuillToolbarToggleStyleButton(
                                     controller: quillController,
                                     attribute: Attribute.blockQuote,
                                   ),
                                   QuillToolbarIndentButton(
                                     controller: quillController,
                                     isIncrease: true,
                                   ),
                                   QuillToolbarIndentButton(
                                     controller: quillController,
                                     isIncrease: false,
                                   ),
                                   QuillToolbarLinkStyleButton(controller: quillController),
                                 ],
                               ),
                             ),
                                          )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                String data  = quillController.plainTextEditingValue.text.toString().trim();
                // debugPrint(
                //     "plainTextEditingValue: ${data} "
                //         "selectedFontFamily:${quillController.selectedFontFamily} "
                //         "selectedFontSize:${quillController.selectedFontSize} "
                //         "selectedStyles:${quillController.selectedStyles} "
                //         "${quillController.selectedStyles}"
                //         "${quillController.getAllSelectionStyles().map((e){
                //       return e.keys;
                //     })}");
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      ),
  
    );
  }
}