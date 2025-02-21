import 'package:flutter/material.dart';

class CustomAutocompleteTextField extends StatelessWidget {
  const CustomAutocompleteTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.focusNode,
    required this.options,
    this.hintText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.prefix,
    this.onSubmitted,
    this.onChanged,
    this.disabled = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final FocusNode focusNode;
  final Set<String> options;
  final String? hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? prefix;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RawAutocomplete<String>(
          textEditingController: controller,
          focusNode: focusNode,
          optionsBuilder: optionsBuilderHandler,
          optionsViewBuilder: (context, onSelected, options) =>
              optionsViewBuilderHandler(
                  context, onSelected, options, constraints),
          fieldViewBuilder: fieldViewBuilderHandler,
        );
      },
    );
  }

  Iterable<String> optionsBuilderHandler(TextEditingValue value) {
    if (value.text.isEmpty) {
      return const Iterable<String>.empty();
    }

    return options.where(
        (element) => element.toLowerCase().contains(value.text.toLowerCase()));
  }

  Widget optionsViewBuilderHandler(
    BuildContext context,
    void Function(String) onSelected,
    Iterable<String> options,
    BoxConstraints constraints,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(18),
            //
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                  if (onSubmitted != null) {
                    onSubmitted!(option);
                  }
                },
                child: Container(
                  // color: Colors.grey.withOpacity(.4),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    option,
                    // style: AppTextStyles.textStyle16w500Modal,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldViewBuilderHandler(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    void Function() _,
  ) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
