part of 'register_cubit.dart';

enum FormStatus { invalid, posting, valid, validating }

sealed class RegisterState extends Equatable {
  final String email;
  final Password password;
  final Username username;
  final bool isValid;
  final FormStatus status;

  const RegisterState({
    required this.email,
    required this.password,
    required this.username,
    required this.status,
    required this.isValid,
  });

  RegisterInitial copyWith({
    FormStatus? status,
    String? email,
    Password? password,
    Username? username,
    bool? isValid,
  });

  @override
  List<Object> get props => [status, email, password, username];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial({
    super.email = '',
    super.password = const Password.pure(),
    super.username = const Username.pure(),
    super.status = FormStatus.invalid,
    super.isValid = false,
  });

  @override
  RegisterInitial copyWith({
    FormStatus? status,
    String? email,
    Password? password,
    Username? username,
    bool? isValid,
  }) => RegisterInitial(
    status: status ?? this.status,
    email: email ?? this.email,
    password: password ?? this.password,
    username: username ?? this.username,
    isValid: isValid ?? this.isValid,
  );
}
