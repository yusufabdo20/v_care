import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password must contain:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 8),
        _buildValidationRow('Lowercase letter', hasLowerCase),
        _buildValidationRow('Uppercase letter', hasUpperCase),
        _buildValidationRow('Special character', hasSpecialChar),
        _buildValidationRow('Number', hasNumber),
        _buildValidationRow('Minimum 8 characters', hasMinLength),
      ],
    );
  }
  
  _buildValidationRow(String text, bool ahhsValidated) {
    return Row(
      children: [
        Icon(
          ahhsValidated ? Icons.check_box_rounded : Icons.cancel,
          color: ahhsValidated ? Colors.green : Colors.red,
          size: 14,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: ahhsValidated ? Colors.black : Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            decoration: ahhsValidated ? TextDecoration.none : TextDecoration.lineThrough,
            decorationColor: Colors.red,
            decorationThickness: 2,),
        ),
      ],
    );
  }
}
