import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/new_room/new_room_third_screen.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/buttons/bottom_button.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';
import 'package:image_picker/image_picker.dart';

class NewRoomScreen extends StatefulWidget {
  const NewRoomScreen({super.key});

  @override
  State<NewRoomScreen> createState() => _NewRoomScreenState();
}

class _NewRoomScreenState extends State<NewRoomScreen> {
  final List<Image> _photos = [];
  final TextEditingController _controller = TextEditingController();
  Color _textColor = Colors.black12;

  void _updateTextColor(String text) {
    setState(() {
      _textColor = text.isEmpty ? Colors.black12 : Colors.black;
    });
  }

  Future<void> _addPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        _photos.add(Image.file(
          File(pickedFile.path),
        ));
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(() {
      _updateTextColor(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.lightPink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_circle_left_rounded,
                      size: 30,
                      color: CustomTheme.purple,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'A new Room',
                    style: TextStyle(fontSize: 34),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'To proceed fill in all the information about the room you want to design.',
                style: TextStyle(fontSize: 20, color: _textColor),
              ),
              const SizedBox(height: 30),
              const Text(
                'Room name',
                style: TextStyle(color: CustomTheme.purple, fontSize: 24),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Add name',
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'Style',
                style: TextStyle(color: CustomTheme.purple, fontSize: 24),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Add name',
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Add a photo',
                style: TextStyle(color: CustomTheme.purple, fontSize: 24),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _addPhoto,
                      child: const Icon(
                        Icons.add_circle,
                        color: CustomTheme.purple,
                        size: 30,
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _photos.map((photo) {
                            return Row(
                              children: [
                                const SizedBox(width: 20),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: 100,
                                    child: photo,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BottomButton(
                  text: 'Done',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewRoomThirdScreen(),
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
