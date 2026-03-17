# Project Architecture

This is a flutter project using Domain First Design (DFD) approach. The project is structured into
three layers: domain, external, and ui.

lib/app/

- domain/

the actual domain layer

- external/

also known as data, it contains the implementations for data access and business logic.

- ui/

also known as presentation, separated by features it uses ChangeNotifier with State Patterns