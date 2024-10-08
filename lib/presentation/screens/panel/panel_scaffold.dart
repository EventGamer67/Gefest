import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gefest/presentation/shared/theme_button.dart';
import 'package:gefest/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../shared/shared.dart';

class PanelScaffold extends ConsumerStatefulWidget {
  final Widget child;
  const PanelScaffold({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PanelScaffoldState();
}

class _PanelScaffoldState extends ConsumerState<PanelScaffold> {
  final SidebarXController controller =
      SidebarXController(selectedIndex: 0, extended: false);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 640) {
      return Scaffold(
          key: _key,
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Row(
            children: [
              SidebarX(
                showToggleButton: false,
                controller: SidebarXController(selectedIndex: 0),
                theme: SidebarXTheme(
                    selectedIconTheme: const IconThemeData(color: Ca.primary),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border(
                            right: BorderSide(
                                width: 2,
                                color:
                                    Theme.of(context).colorScheme.onSurface)))),
                items: [
                  SidebarXItem(
                      iconBuilder: (selected, __) {
                        return SizedBox(
                          width: 44,
                          height: 44,
                          child: BaseIconButton(
                            icon: "assets/icons/home.svg",
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                            onTap: () {
                              controller.selectIndex(0);
                              context.go('/dashboard');
                            },
                          ),
                        );
                      },
                      label: 'Home'),
                  SidebarXItem(
                    selectable: false,
                      iconBuilder: (selected, hovered) {
                        log(selected.toString());
                        return SizedBox(
                          width: 44,
                          height: 44,
                          child: BaseIconButton(
                            icon: "assets/icons/calendar.svg",
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                            onTap: () {
                              controller.selectIndex(1);
                              context.go('/schedule');
                            },
                          ),
                        );
                      },
                      label: 'Home'),
                  SidebarXItem(
                      iconBuilder: (selected, hovered) {
                        return SizedBox(
                          width: 44,
                          height: 44,
                          child: BaseIconButton(
                            icon: "assets/icons/persons.svg",
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                            onTap: () {
                              context.go('/teachers');
                            },
                          ),
                        );
                      },
                      label: 'teachers'),
                  SidebarXItem(
                      iconBuilder: (selected, hovered) {
                        return SizedBox(
                          width: 44,
                          height: 44,
                          child: BaseIconButton(
                            icon: "assets/icons/persons.svg",
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                            onTap: () {
                              context.go('/groups');
                            },
                          ),
                        );
                      },
                      label: 'groups'),
                ],
                footerItems: [
                  SidebarXItem(
                      iconBuilder: (selected, hovered) {
                        return SizedBox(
                            width: 44,
                            height: 44,
                            child: ThemeButton(
                              color: Theme.of(context).colorScheme.onSurface,
                            ));
                      },
                      label: 'Theme'),
                ],
              ),
              Expanded(child: widget.child)
            ],
          ));
    } else {
      return Scaffold(
          key: _key,
          backgroundColor: Theme.of(context).colorScheme.surface,
          drawer: SidebarX(
            controller: controller,
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 65,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface))),
                child: Row(
                  children: [
                    BaseIconButton(
                      icon: "assets/icons/home.svg",
                      onTap: () {
                        controller.setExtended(true);
                        _key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text("data"),
              )
            ],
          ));
    }
  }
}
