import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String customerName;
  final String customerReview;
  final String dateAdded;

  const ReviewCard({
    super.key,
    required this.customerName,
    required this.customerReview,
    required this.dateAdded,
  });

  @override
  Widget build(BuildContext context) {
    return
    /// Review Card
    ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 150, minWidth: 200, maxWidth: 250),

      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            /// Reviewer Name
            children: [
              Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        customerName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),

              /// Reviewer feedback
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  child: Text(
                    '"$customerReview"',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              /// Date reviewed
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  child: Text(
                    dateAdded,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
