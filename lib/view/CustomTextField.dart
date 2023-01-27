import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final String label; // 텍스트 필드 제목
  final bool isTime; // 시간 선택하는 텍스트 필드인지 여부
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;


  const CustomTextField({
    required this.label,
    required this.isTime,
    required this.onSaved,
    required this.validator,
    Key? key,
}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved, // 폼 저장 했을때 실행할 함수
            validator: validator, // 폼 검증했을 때 실행할 함수
            cursorColor: Colors.grey,
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTime
            ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
              :[],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixText: isTime ? '시' : null,
            ),
          ),
        )
      ],
    );
  }
}
