# PAM Project — Workout Tracker

Aplikacja do śledzenia treningów dla sportowców. Budowana w Flutter + Supabase.

## Stack technologiczny

- **Flutter** — framework UI
- **Supabase** — backend (auth, baza danych)
- **Riverpod** — zarządzanie stanem
- **Freezed** — immutable models
- **GoRouter** — nawigacja

## Wymagania

- Flutter SDK `>=3.3.0`
- Dart SDK `>=3.3.0`
- CMake (Linux desktop)
- Konto Supabase z skonfigurowaną bazą danych

### Linux

```bash
sudo apt install cmake ninja-build libgtk-3-dev clang
```

## Uruchomienie

### 1. Klonowanie repozytorium

```bash
git clone https://github.com/bsosnowicz/pam_project.git
cd pam_project
```

### 2. Instalacja zależności

```bash
flutter pub get
```

### 3. Generowanie kodu

Projekt używa generowania kodu (Riverpod, Freezed, JSON). Po każdej zmianie modeli lub providerów uruchom:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Uruchomienie aplikacji

**Linux desktop:**
```bash
flutter run -d linux
```

**Android (emulator lub urządzenie):**
```bash
flutter run -d android
```

**Sprawdzenie dostępnych urządzeń:**
```bash
flutter devices
```

## Struktura projektu

```
lib/
├── core/
│   ├── errors/          # Wyjątki aplikacji
│   ├── router/          # Konfiguracja nawigacji (GoRouter)
│   ├── supabase/        # Klient Supabase
│   ├── theme/           # Kolory i motyw aplikacji
│   └── utils/           # Narzędzia (kalkulatory, formatowanie dat)
├── features/
│   ├── auth/            # Logowanie i rejestracja
│   ├── analytics/       # Statystyki i wykresy
│   ├── history/         # Historia treningów
│   ├── live_tracking/   # Śledzenie treningu na żywo
│   ├── profile/         # Profil użytkownika
│   ├── workout_builder/ # Kreator treningu
│   └── workout_summary/ # Podsumowanie po treningu
└── shared/
    ├── providers/       # Globalne providery (motyw)
    └── widgets/         # Współdzielone widgety
```