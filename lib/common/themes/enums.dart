import 'package:flutter/foundation.dart';

enum PaginationState {
  BUSY, // when api is calling
  FREE, // when there is no api call or initial state
  COMPLETED, // when last item of list is fetched
  ERROR, // when there is an error in data fetch
}


enum SlideAnimationType {
  RightToLeft, // right to left
  LeftToRight, // left to right
  TopToBottom, // top to bottom
  BottomToTop, // bottom to top
}

