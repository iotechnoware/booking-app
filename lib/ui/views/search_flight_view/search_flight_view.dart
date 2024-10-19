import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';
import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
import 'package:gofly/ui/views/search_flight_view/suggestions_controller.dart';
import 'package:gofly/ui/views/search_flight_view/flight_info_page.dart';
import 'package:intl/intl.dart';

class SearchFlightView extends StatefulWidget {
  const SearchFlightView({Key? key}) : super(key: key);

  @override
  State<SearchFlightView> createState() => _SearchFlightViewState();
}

class _SearchFlightViewState extends State<SearchFlightView> {
  final SearchFlightController searchController = Get.put(SearchFlightController());
  final SuggestionsController suggestionController = Get.put(SuggestionsController(), permanent: false);
  DateTime? departureDate;
  DateTime? returnDate;

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDeparture ? (departureDate ?? DateTime.now()) : (returnDate ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      suggestionController.resetSuggestions();
    });
  }
  int adultCount = 1; // Default to 1 adult
  bool nonStop = true; // Default to non-stop option off

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Flights', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLocationField(true),
                  _buildSuggestionsList(true),
                  const SizedBox(height: 16),
                  _buildLocationField(false),
                  _buildSuggestionsList(false),
                  const SizedBox(height: 24),
                  _buildDateField(true),
                  const SizedBox(height: 16),
                  searchController.oneWay.value ? const SizedBox.shrink() : _buildDateField(false),
                  const SizedBox(height: 32),
                  _buildAdultCounter(), // Add adult counter here
                  const SizedBox(height: 16),
                  _buildNonStopSwitch(), // Add non-stop switch here
                  const SizedBox(height: 32),
                  _buildOneWaySwitch(),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _searchFlights,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Search Flights'),
                  ),
                ],
              );
            }
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationField(bool isOrigin) {
    return TextField(
      // onTap: (){FocusScope.of(context).unfocus();},
      // onSubmitted: (e){FocusScope.of(context).unfocus();},
      // onEditingComplete: (){FocusScope.of(context).unfocus();},
      controller: isOrigin ? searchController.fromController : searchController.toController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: isOrigin ? 'From' : 'To',
        prefixIcon: Icon(isOrigin ? Icons.flight_takeoff : Icons.flight_land),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (text) => _handleLocationChange(text, isOrigin),
    );
  }

  Widget _buildDateField(bool isDeparture) {
    return GestureDetector(
      onTap: () => _selectDate(context, isDeparture),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isDeparture
                  ? (departureDate == null ? 'Departure Date' : '${departureDate!.day}-${departureDate!.month}-${departureDate!.year}')
                  : (returnDate == null ? 'Return Date' : '${returnDate!.day}-${returnDate!.month}-${returnDate!.year}'),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  void _handleLocationChange(String text, bool isOrigin) {
    if (text.length >= 3) {
      if (isOrigin) {
        suggestionController.hideSuggestions.value = false;
        suggestionController.getSuggestionFrom(iata: text);
      } else {
        suggestionController.hideSuggestions2.value = false;
        suggestionController.getSuggestionTo(iata: text);
      }
    } else {
      if (isOrigin) {
        suggestionController.hideSuggestions.value = true;
        suggestionController.suggestionsDataFrom.clear();
      } else {
        suggestionController.hideSuggestions2.value = true;
        suggestionController.suggestionsDataTo.clear();
      }
    }
  }

  Widget _buildSuggestionsList(bool isOrigin) {
    return Obx(() {
      final suggestions = isOrigin
          ? suggestionController.suggestionsDataFrom
          : suggestionController.suggestionsDataTo;
      final isHidden = isOrigin
          ? suggestionController.hideSuggestions.value
          : suggestionController.hideSuggestions2.value;
      final isLoading = isOrigin
          ? suggestionController.isSuggestionsLoadingFrom
          : suggestionController.isSuggestionsLoadingTo;

      // If suggestions are hidden, return an empty widget
      if (isHidden) {
        return const SizedBox.shrink();
      }

      // If loading, show a loading indicator
      if (isLoading) {
        return const CircularProgressIndicator();
      }

      // If there are no suggestions available, show a message
      if (suggestions.isEmpty) {
        return const Text('No suggestions available');
      }

      return Container(
        height: 150,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index].data![index]; // Directly access the suggestion

            // Check if required fields are not null
            if (suggestion.name == null || suggestion.iataCode == null) {
              return const SizedBox.shrink(); // Skip this item if null
            }

            return ListTile(
              title: Text('${suggestion.name} (${suggestion.iataCode})'),
              onTap: () {
                if (isOrigin) {
                  searchController.fromController.text = suggestion.name!;
                  suggestionController.iataFrom.value = suggestion.iataCode!;
                } else {
                  searchController.toController.text = suggestion.name!;
                  suggestionController.iataTo.value = suggestion.iataCode!;
                }
                suggestionController.hideSuggestions.value = true;
                suggestionController.hideSuggestions2.value = true;
              },
            );
          },
        ),
      );
    });
  }

  void _searchFlights() {
    if (searchController.fromController.text.length >= 3 &&
        searchController.toController.text.length >= 3) {
      searchController.flightList.clear();
      searchController.resultList.clear();
      searchController.getFlights(
        origin: suggestionController.iataFrom.value,
        destination: suggestionController.iataTo.value,
        departureAt: departureDate != null ? DateFormat('yyyy-MM-dd').format(departureDate!) : '',
        returnAt: returnDate != null ? DateFormat('yyyy-MM-dd').format(returnDate!) : '',
        adult: adultCount,
        nonStop: nonStop
      );
      Get.to(() => const FlightInfoPage());
      print(departureDate);
    } else {
      CustomToast.showMessage(message: 'Please Enter The From and To Fields' , messageType: MessageType.WARNING);
    }
  }


  Widget _buildAdultCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Adults', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (adultCount > 1) adultCount--;
                });
              },
            ),
            Text('$adultCount', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  adultCount++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNonStopSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Non-stop Flights', style: TextStyle(fontSize: 16)),
        Switch(
          value: nonStop,
          onChanged: (value) {
            setState(() {
              nonStop = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildOneWaySwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('One Way Flight', style: TextStyle(fontSize: 16)),
        Switch(
          value: searchController.oneWay.value,
          onChanged: (value) {
            setState(() {
              searchController.oneWay.value = value;
            });
          },
        ),
      ],
    );
  }
}