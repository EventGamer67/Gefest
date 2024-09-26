import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard"),);
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (MediaQuery.sizeOf(context).width > 640) {
  //     return Scaffold(
  //         key: _key,
  //         backgroundColor: Theme.of(context).colorScheme.surface,
  //         body: Row(
  //           children: [
  //             SidebarX(
  //               showToggleButton: false,
  //               controller: SidebarXController(selectedIndex: 0),
  //               theme: SidebarXTheme(
  //                   selectedIconTheme: const IconThemeData(color: Ca.primary),
  //                   decoration: BoxDecoration(
  //                       color: Theme.of(context).colorScheme.surface,
  //                       border: Border(
  //                           right: BorderSide(
  //                               width: 2,
  //                               color:
  //                                   Theme.of(context).colorScheme.onSurface)))),
  //               items: [
  //                 SidebarXItem(
  //                     iconBuilder: (selected, hovered) {
  //                       return SizedBox(
  //                         width: 44,
  //                         height: 44,
  //                         child: BaseIconButton(
  //                           icon: "assets/icons/home.svg",
  //                           onTap: () {
  //                             context.go('/dashboard');
  //                           },
  //                         ),
  //                       );
  //                     },
  //                     label: 'Home'),
  //                 SidebarXItem(
  //                     iconBuilder: (selected, hovered) {
  //                       return SizedBox(
  //                         width: 44,
  //                         height: 44,
  //                         child: BaseIconButton(
  //                           icon: "assets/icons/calendar.svg",
  //                           onTap: () {
  //                             context.go('/schedule');
  //                           },
  //                         ),
  //                       );
  //                     },
  //                     label: 'Home'),
  //               ],
  //             ),
  //           ],
  //         ));
  //   } else {
  //     return Scaffold(
  //         key: _key,
  //         backgroundColor: Theme.of(context).colorScheme.surface,
  //         drawer: SidebarX(
  //           controller: controller,
  //           items: const [
  //             SidebarXItem(icon: Icons.home, label: 'Home'),
  //             SidebarXItem(icon: Icons.search, label: 'Search'),
  //           ],
  //         ),
  //         body: Column(
  //           children: [
  //             Container(
  //               height: 65,
  //               padding: const EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                   border: Border(
  //                       bottom: BorderSide(
  //                           color: Theme.of(context).colorScheme.onSurface))),
  //               child: Row(
  //                 children: [
  //                   BaseIconButton(
  //                     icon: "assets/icons/home.svg",
  //                     onTap: () {
  //                       controller.setExtended(true);
  //                       _key.currentState!.openDrawer();
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const Center(
  //               child: Text("data"),
  //             )
  //           ],
  //         ));
  //   }
  // }
}
