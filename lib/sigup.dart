import 'package:flutter/material.dart';
import 'login.dart';  // นำเข้าหน้า login

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _gender;
  String? _phoneNumber;
  bool _subscribe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // โลโก้
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/logo.png', height: 150),
              ),
              const SizedBox(height: 10),

              // ส่วนหัว "Sign Up"
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Row สำหรับ First Name และ Last Name
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildTextField(
                      labelText: 'First Name',
                      onSaved: (value) => _firstName = value,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildTextField(
                      labelText: 'Last Name',
                      onSaved: (value) => _lastName = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              // ช่องกรอกอีเมล
              _buildTextField(
                labelText: 'Email address',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),

              // ช่องกรอกรหัสผ่าน
              _buildTextField(
                labelText: 'Password',
                obscureText: true,
                onSaved: (value) => _password = value,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),

              // ช่องกรอกยืนยันรหัสผ่าน
              _buildTextField(
                labelText: 'Confirm Password',
                obscureText: true,
                onSaved: (value) => _confirmPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty || value != _password) {
                    return 'Confirm Password not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),

              // ส่วนที่ใส่เบอร์โทรศัพท์และเพศใน Box เดียวกัน
              Row(
                children: <Widget>[
                  // ช่องกรอกเบอร์โทรศัพท์ (70% ของความกว้าง)
                  Expanded(
                    flex: 7,
                    child: _buildTextField(
                      labelText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _phoneNumber = value,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // ช่องเลือกเพศ (30% ของความกว้าง)
                  Expanded(
                    flex: 3,
                    child: _buildDropdown(
                      labelText: 'Gender',
                      value: _gender,
                      onChanged: (String? newValue) {
                        setState(() {
                          _gender = newValue!;
                        });
                      },
                      items: ['Male', 'Female', 'Other'],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              // ช่องทำเครื่องหมาย
              Row(
                children: [
                  Checkbox(
                    value: _subscribe,
                    onChanged: (bool? value) {
                      setState(() {
                        _subscribe = value!;
                      });
                    },
                  ),
                  const Text('Sign Up for emails to get updates from Dogs \n and Cats.'),
                ],
              ),
              const SizedBox(height: 5),

              // ปุ่มสร้างบัญชี
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // ทำงานเมื่อฟอร์มถูกต้อง
                    print('First Name: $_firstName');
                    print('Last Name: $_lastName');
                    print('Email: $_email');
                    print('Phone Number: $_phoneNumber');
                    print('Password: $_password');
                    print('Confirm Password: $_confirmPassword');
                    print('Gender: $_gender');

                    // หลังจากสร้างบัญชีเสร็จแล้ว นำทางไปหน้า Login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()), // assuming Login is your login page class
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Create account', style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 5),

              // ข้อความ "Already have an account?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      // นำทางไปยังหน้า Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text('Login', style: TextStyle(color: Colors.orange)),
                  ),
                ],
              ),

              // รูปภาพแมว
              Center(
                child: Image.asset('assets/1.png', height: 250),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // สร้างช่องกรอกข้อมูล
  Widget _buildTextField({
    required String labelText,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  // สร้าง Dropdown สำหรับเลือกเพศ
  Widget _buildDropdown({
    required String labelText,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        value: value,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
