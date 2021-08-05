/// enum used in all screen & store for ui state
// busy enum is used for show loading only on button
// loading enum is used for show transparent loading on page content
// need to use multiple enum for loading/busy when there is more than 1 & different type of api call in same page
enum UIState {
  initial,
  busy,
  free,
  error,
  loading,
}
