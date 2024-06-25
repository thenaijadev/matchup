import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void changeCountry(context, onSelect) {
  showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        searchTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        flagSize: 25,

        backgroundColor: Theme.of(context).colorScheme.background,
        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 350, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          filled: true,
          fillColor: Colors.transparent,
          // suffixIcon: suffixIcon,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'satoshi'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inverseSurface,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inverseSurface,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: "Search country...",
        ),
      ),
      onSelect: onSelect);
}
