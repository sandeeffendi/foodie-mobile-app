import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:assestment_restaurant_app/core/provider/add_review/add_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReview extends StatefulWidget {
  final RestaurantDetail restaurantDetail;

  const AddReview({super.key, required this.restaurantDetail});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _reviewController.clear();
  }

  Future<void> _submitReview(BuildContext context) async {
    final reviewProvider = context.read<AddReviewProvider>();
    if (_formKey.currentState!.validate()) {
      await reviewProvider.addReview(
        widget.restaurantDetail.id,
        _nameController.text,
        _reviewController.text,
      );
    }

    /// Show dialog if form succesfully submitted
    if (reviewProvider.isSuccess) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Review berhasil disubmit'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                /// reset form and provider state
                _resetForm();
                reviewProvider.resetState();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider = context.watch<AddReviewProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Add Restaurant Review
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Add Restaurant Review',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Divider(color: Color.fromARGB(128, 0, 0, 0)),

        /// Card Form Add Review
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:
                /// Form Add Review Container
                Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: 200,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      /// Name & Review Form
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            /// Name Form Field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                  labelText: 'Name',
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(128, 0, 0, 0),
                                      ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inverseSurface,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? 'Nama wajib di isi'
                                    : null,
                              ),
                            ),

                            /// Review Form Field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                minLines: 3,
                                maxLines: null,

                                controller: _reviewController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  filled: true,
                                  fillColor: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                  labelText: 'Review',
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(128, 0, 0, 0),
                                      ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inverseSurface,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? 'Review wajib di isi'
                                    : null,
                              ),
                            ),

                            /// Submit Form Button
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: reviewProvider.isLoading
                                    ? null
                                    : () {
                                        _submitReview(context);
                                      },
                                child: Center(
                                  child: reviewProvider.isLoading
                                      ? CircularProgressIndicator(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                        )
                                      : Text('Submit'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
          ),
        ),
      ],
    );
  }
}
