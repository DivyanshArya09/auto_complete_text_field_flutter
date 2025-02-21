Flutter Autocomplete Text Field
===============================

An open-source **Flutter** widget for an autocomplete text field with dynamic options. This project demonstrates how to implement an autocomplete feature where users can select a state, and the corresponding city options update dynamically.

🚀 Features
-----------

-   📌 Smart filtering for real-time suggestions
-   🎯 Dynamic city selection based on the chosen state
-   🔄 Smooth focus handling for a seamless user experience
-   🔧 Fully customizable and easy to integrate

📸 Demo
---

https://github.com/user-attachments/assets/65ce44d9-9951-412b-ac2c-cc1772344bcd

----

🛠️ Installation
----------------

1.  **Clone the repository**

    ```
    https://github.com/DivyanshArya09/auto_complete_text_field_flutter.git

    ```

2.  **Navigate to the project folder**

    ```
    cd auto_complete_text_field_flutter

    ```

3.  **Get dependencies**

    ```
    flutter pub get

    ```

4.  **Run the app**

    ```
    flutter run

    ```

🔧 Usage
--------

### 1\. Add the `CustomAutocompleteTextField` Widget

```
CustomAutocompleteTextField(
  controller: _stateTC,
  focusNode: _stateFN,
  hintText: 'Select State',
  options: indiaStatesAndDistricts.keys.toSet(),
),

CustomAutocompleteTextField(
  controller: _cityTC,
  focusNode: _cityFocusNode,
  hintText: 'Select City',
  options: indiaStatesAndDistricts[_stateTC.text] ?? [],
),

```

### 2\. Define State & City Data

```
final Map<String, List<String>> indiaStatesAndDistricts = {
  'Maharashtra': ['Mumbai', 'Pune', 'Nagpur'],
  'Karnataka': ['Bangalore', 'Mysore'],
  'Delhi': ['New Delhi'],
};

```

🤝 Contributing
---------------

Contributions are welcome! Feel free to open an issue or submit a pull request. 😊

📜 License
----------

This project is licensed under the **MIT License**. See the `LICENSE` file for details.

📬 Contact
----------

For any queries, reach out via [LinkedIn](https://www.linkedin.com/in/divyansh-arya-4a25b2284/) or open an issue!

* * * * *

Made with ❤️ by **Divyansh**
