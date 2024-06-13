class AuthState {
  final bool isLoading;

  final String? error;

  final bool obscurePassword;

  final String? imageName;

  AuthState({
    required this.obscurePassword,
    required this.isLoading,
    this.error,
    this.imageName,
  });

  factory AuthState.initial() => AuthState(
        isLoading: false,
        error: null,
        obscurePassword: true,
        imageName: null,
      );

  AuthState copyWith({
    bool? isLoading,
    bool? obscurePassword,
    String? error,
    String? imageName,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      imageName: imageName ?? this.imageName,
    );
  }
}
