import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class CustomCheckboxWidget extends FormField<bool> {
  final bool value;
  final Widget titleWidget;

  CustomCheckboxWidget({
    Key key,
    @required this.value,
    @required FormFieldSetter<bool> onSaved,
    @required this.titleWidget,
  }) : super(
          key: key,
          initialValue: value,
          onSaved: onSaved,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => Validators.validateCheckbox(v: v),
          builder: (state) {
            return CheckboxListTile(
              dense: state.hasError,
              value: state.value,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: state.didChange,
              title: titleWidget,
              subtitle: state.hasError
                  ? Builder(
                      builder: (_) => Text(
                        state.errorText,
                        style: TextStyle(color: Theme.of(_).errorColor),
                      ),
                    )
                  : null,
            );
          },
        );
}
