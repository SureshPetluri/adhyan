import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 bool isMatching = false;
  void onTextChanged() {
    final text = nameController.text;
    if (text.isNotEmpty) {
      nameController.value = nameController.value.copyWith(
        text: text.substring(0, 1).toUpperCase() + text.substring(1),
      );
    }
  }
  SignUpController(){
    passwordController.addListener(checkMatching);
    conformPasswordController.addListener(checkMatching);
  }
  void checkMatching() {
      isMatching = conformPasswordController.text == passwordController.text;
   notifyListeners();
  }
  submitSignUp(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, Routes.myCourses);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

}



/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomDropdownWithScroll(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _chosenModel;
  final List<String> carModels = [
    'Tesla Model S',
    'Hyundai Sonata',
    'Jeep Wrangler',
    'Honda Accord3',
    'Honda Accord2',
    'Honda Accord1',
    'Honda Accord4',
    'Honda Accord5',
    'Honda Accord',
    'Mercedes S-Class',
  ];

  List<DropdownItem<String>>? dropdownItems;
  final valueListenable = ValueNotifier<String?>(null);


  @override
  void initState() {
   dropdownItems =carModels
       .map((value) => DropdownItem(
     value: value,
     child: Text(value),
   ))
       .toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            valueListenable: valueListenable,
            onChanged: (value) {
              valueListenable.value = value;
            },
            // items: <String>[
            //   'Tesla Model S',
            //   'Hyundai Sonata',
            //   'Jeep Wrangler',
            //   'Honda Accord3',
            //   'Honda Accord2',
            //   'Honda Accord1',
            //   'Honda Accord4',
            //   'Honda Accord5',
            //   'Honda Accord',
            //   'Mercedes S-Class'
            // ].map<DropdownMenuItem<String>>((String value) {
            //   return DropdownMenuItem<String>(
            //     value: value,
            //     child: Text(value),
            //   );
            // }).toList(),
            // onChanged: (String? newValue) {
            //   setState(() {
            //     _chosenModel = newValue;
            //   });
            // },
            hint: Text(
              "Choose a Car Model",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Adjusts the dropdown direction based on available space
            // dropdownDirection: DropdownDirection.down,
            // directionCheckPolicy: DirectionCheckPolicy.auto,
            // Dropdown style options
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200, // Custom dropdown height
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ), items: dropdownItems,
          ),
        ),
      ),
    );
  }
}


class CustomDropdownWithScroll extends StatefulWidget {
  @override
  _CustomDropdownWithScrollState createState() =>
      _CustomDropdownWithScrollState();
}

class _CustomDropdownWithScrollState extends State<CustomDropdownWithScroll> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _buttonKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _isDropdownOpen = false;

  List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateDropdownPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateDropdownPosition() {
    if (_isDropdownOpen && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox buttonRenderBox =
    _buttonKey.currentContext!.findRenderObject() as RenderBox;
    var size = buttonRenderBox.size;
    var offset = buttonRenderBox.localToGlobal(Offset.zero);

    var topOffset = offset.dy + size.height;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: topOffset,
          width: 300,
          child: Material(
            elevation: 4,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              controller: _scrollController,
              children: _items.map((item) {
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _isDropdownOpen = false;
                      _overlayEntry?.remove();
                    });
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _overlayEntry?.remove();
      _isDropdownOpen = false;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _isDropdownOpen = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Dropdown with Scroll")),
      body: Center(
        child: Container(
          width: 300,
          height: 10000000000000,
          child: ListView(
            controller: _scrollController,
            children: [
              Padding(
                key: _buttonKey,
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _toggleDropdown,
                  child: Text("Open Dropdown"),
                ),
              ),
              SizedBox(height: 500), // Simulate a long scrollable view
              Text("Scrollable Content"),
            ],
          ),
        ),
      ),
    );
  }
}


*/
