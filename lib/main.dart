import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? userName;
  String? userEmail;
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          backgroundColor:  Color.fromARGB(255, 133, 121, 151),
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(

                      width: 100, // نفس عرض الصورة
                      height: 100, // نفس ارتفاع الصورة
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // لون الإطار
                          width: 2.0, // عرض الإطار
                        ),
                        borderRadius: BorderRadius.circular(60.0), // زوايا دائرية للإطار (اختياري)
                      ),
                      clipBehavior: Clip.hardEdge, // قص الصورة لتتطابق مع الإطار
                      child: Transform.scale(
                        scale: 1.4, // تكبير الصورة بنسبة 1.5x
                        child: Image.asset(
                          'assets/images/no_person.png',
                          fit: BoxFit.cover, // لتعبئة الصورة بالكامل داخل الإطار
                        ),
                      ),
                    ),
                    Expanded(child: ListTile(title: Text('Ali'),subtitle: Text('fottene4@gmail.com'),))
                  ],
                ),

                ListTile(title: Text('Homepage'),leading: Icon(Icons.home),onTap: (){},),
                ListTile(title: Text('About us'),leading: Icon(Icons.info),onTap: (){},),
                ListTile(title: Text('Contact us'),leading: Icon(Icons.contact_emergency),onTap: (){},)
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // تغيير لون أيقونة Drawer
            size: 24, // تغيير حجم الأيقونة
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 190, 130, 254)
                        .withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'العربية',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.language),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
          title: const Text('Login'),
          centerTitle: false,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        userName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                        if (value.length < 6) {
                          return ' اسم المستخدم قصير للغاية';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Color(0xff582da3),
                          labelText: 'username',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        userEmail = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                        final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'الإيميل مكتوب بطريقة خاطئة';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Color(0xff582da3),
                        labelText: 'email',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () {
                        //print(userName.text);
                        if (formState.currentState!.validate()) {
                          formState.currentState!.save();
                          print('name==============$userName');
                          print('email=============$userEmail');
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        width: double.infinity,
                        height: 45,
                      ),
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
