import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  // Corrected: Using the named constructor {required ...}
  AuthBloc({required this.authRepository}) : super(const AuthInitial()) {
    // Corrected: The handler call is properly linked to the method below
    on<RegisterEvent>(_onRegister);
  }

  // DEFINITION: The method handler must be defined within the class body
  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    // Optional: Basic input validation before hitting the repository
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(const AuthFailure("Email and password fields cannot be empty."));
      return;
    }

    emit(const AuthLoading());
    try {
      final success = await authRepository.register(
        email: event.email,
        password: event.password,
      );

      if (success) {
        emit(const AuthSuccess());
      } else {
        // Simulating a business error response
        emit(const AuthFailure("Registration failed: User already exists."));
      }
    } catch (e) {
      // Handle network errors or unexpected exceptions
      emit(AuthFailure("Registration failed due to error: ${e.toString()}"));
    }
  }
}
