enum NavigationRoute {
  splash('/'),
  main('/main'),
  detail('/detail');

  const NavigationRoute(this.name);
  final String name;
}
