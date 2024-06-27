import 'package:flutter/material.dart';

Widget label(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontFamily: 'LeagueSpartan',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1,
    ),
    softWrap: true,
  );
}

Widget textBox(
    TextEditingController controller,
    String placeholder,
    bool readOnly,
    bool numberOnly,
    VoidCallback? onTap,
    int index,
    Function update) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 0, // Spread radius
          blurRadius: 4, // Blur radius
          offset: const Offset(0, 3), // Shadow offset (x, y)
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: numberOnly ? TextInputType.number : TextInputType.text,
      onTap: onTap,
      onChanged: (value) {
        update(value, index);
      },
      style: const TextStyle(
        fontFamily: 'LeagueSpartan',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9), width: 0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9), width: 0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9)),
        ),
      ),
    ),
  );
}

Widget dropdown(List<String> options, TextEditingController controller,
    int index, Function update) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 0, // Spread radius
          blurRadius: 4, // Blur radius
          offset: const Offset(0, 3), // Shadow offset (x, y)
        ),
      ],
    ),
    child: DropdownButtonFormField<String>(
      value: controller.text.isEmpty ? null : controller.text,
      decoration: const InputDecoration(
        hintText: '---Pilih salah satu---',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9), width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9), width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFe9e9e9)),
        ),
      ),
      items: options
          .map((String option) => DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (String? newValue) {
        update(index, newValue);
      },
    ),
  );
}

Widget buttonGroupContainer(List<String> items, String selectedValue,
    String group, int index, Function update) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 0, // Spread radius
          blurRadius: 4, // Blur radius
          offset: const Offset(0, 3), // Shadow offset (x, y)
        ),
      ],
    ),
    child: items.length <= 3
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return buttonGroup(item, selectedValue, group, index, update);
            }).toList(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .asMap()
                        .entries
                        .where((entry) => entry.key % 2 == 0)
                        .map((item) {
                      return buttonGroup(
                          item.value, selectedValue, group, index, update);
                    }).toList()),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .asMap()
                        .entries
                        .where((entry) => entry.key % 2 == 1)
                        .map((item) {
                      return buttonGroup(
                          item.value, selectedValue, group, index, update);
                    }).toList()),
              )
            ],
          ),
  );
}

Widget buttonGroup(
    String item, String selectedValue, group, int index, Function update) {
  return Theme(
    data: ThemeData(
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return const Color.fromRGBO(0, 147, 92, 1.0);
          }
          return Colors.grey;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const Color.fromRGBO(0, 147, 92, 1.0);
            }
            return Colors.grey.withOpacity(0.2);
          },
        ),
      ),
    ),
    child: InkWell(
      onTap: () {
        update(item, index);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Radio<String>(
            value: item,
            groupValue: selectedValue,
            splashRadius: 12,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              update(value, index);
            },
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color.fromRGBO(0, 147, 92, 1.0);
              }
              return Colors.grey;
            }),
          ),
          // const SizedBox(width: 2), // Adjust the width to close the gap
          Expanded(child: label(item)),
        ],
      ),
    ),
  );
}

Widget checkBoxGroupContainer(int selectIndex, List<String> items,
    List<bool> selectedValue, Function(int, int) update) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 0, // Spread radius
          blurRadius: 4, // Blur radius
          offset: const Offset(0, 3), // Shadow offset (x, y)
        ),
      ],
    ),
    child: items.length <= 3
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .asMap()
                .entries
                .map((entry) => checkBoxGroup(
                    selectIndex, entry.key, entry.value, selectedValue, update))
                .toList(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .asMap()
                        .entries
                        .where((entry) => entry.key % 2 == 0)
                        .map((entry) => checkBoxGroup(selectIndex, entry.key,
                            entry.value, selectedValue, update))
                        .toList()),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .asMap()
                        .entries
                        .where((entry) => entry.key % 2 == 1)
                        .map((entry) => checkBoxGroup(selectIndex, entry.key,
                            entry.value, selectedValue, update))
                        .toList()),
              )
            ],
          ),
  );
}

Widget checkBoxGroup(int selectIndex, int index, String item,
    List<bool> selectedValue, Function(int, int) update) {
  return Theme(
    data: ThemeData(
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return const Color.fromRGBO(0, 147, 92, 1.0);
          }
          return Colors.grey;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const Color.fromRGBO(0, 147, 92, 1.0);
            }
            return Colors.grey.withOpacity(0.2);
          },
        ),
      ),
    ),
    child: InkWell(
      onTap: () {
        update(selectIndex, index);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            value: selectedValue[index],
            splashRadius: 12,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              update(selectIndex, index);
            },
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (selectedValue[index]) {
                return const Color.fromRGBO(0, 147, 92, 1.0);
              }
              return Colors.grey;
            }),
          ),
          Expanded(child: label(item)),
        ],
      ),
    ),
  );
}
