import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/sample_data.dart';

class User {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoURL;

  User({
    required this.uid,
    this.displayName,
    this.email,
    this.photoURL,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['id'] as String,
      displayName: json['name'] as String?,
      email: json['email'] as String?,
      photoURL: json['profileImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'name': displayName,
      'email': email,
      'profileImage': photoURL,
    };
  }
}

class AuthProvider extends ChangeNotifier {
  static const String _userKey = 'user';
  static const String _userDataKey = 'userData';
  
  final SharedPreferences _prefs;
  User? _currentUser;
  Map<String, dynamic>? _userData;
  bool _isLoading = false;
  String? _error;

  AuthProvider._({required SharedPreferences prefs}) : _prefs = prefs {
    _loadSavedUser();
  }

  static Future<AuthProvider> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AuthProvider._(prefs: prefs);
  }

  // Getters
  User? get currentUser => _currentUser;
  Map<String, dynamic>? get userData => _userData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;

  void _loadSavedUser() {
    final userJson = _prefs.getString(_userKey);
    final userDataJson = _prefs.getString(_userDataKey);

    if (userJson != null) {
      _currentUser = User.fromJson(SampleData.sampleUserData);
      _userData = SampleData.sampleUserData;
      notifyListeners();
    }
  }

  Future<void> _saveUser(User user, Map<String, dynamic> userData) async {
    await _prefs.setString(_userKey, user.toJson().toString());
    await _prefs.setString(_userDataKey, userData.toString());
    _currentUser = user;
    _userData = userData;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // For demo, accept any email/password combination
      if (email.isNotEmpty && password.isNotEmpty) {
        final user = User.fromJson(SampleData.sampleUserData);
        await _saveUser(user, SampleData.sampleUserData);
      } else {
        throw Exception('Invalid email or password');
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // For demo, accept any valid input
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        final userData = Map<String, dynamic>.from(SampleData.sampleUserData)
          ..update('name', (value) => name)
          ..update('email', (value) => email);

        final user = User.fromJson(userData);
        await _saveUser(user, userData);
      } else {
        throw Exception('Please fill in all fields');
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _prefs.remove(_userKey);
      await _prefs.remove(_userDataKey);
      _currentUser = null;
      _userData = null;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? photoURL,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      if (_currentUser != null) {
        final updatedUser = User(
          uid: _currentUser!.uid,
          displayName: name ?? _currentUser!.displayName,
          email: email ?? _currentUser!.email,
          photoURL: photoURL ?? _currentUser!.photoURL,
        );

        final updatedUserData = Map<String, dynamic>.from(_userData ?? {})
          ..update('name', (value) => name ?? value)
          ..update('email', (value) => email ?? value)
          ..update('profileImage', (value) => photoURL ?? value);

        await _saveUser(updatedUser, updatedUserData);
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
} 