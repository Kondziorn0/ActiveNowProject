Active Now Project
Ten projekt został stworzony przy użyciu Ruby on Rails 7.2.1 oraz Ruby 3.3.0.

Celem projektu jest stworzenie podstawowego systemu zarządzania planem lekcyjnym. Aplikacja umożliwia tworzenie użytkowników, przypisywanie ich do poszczególnych klas oraz zarządzanie nauczycielami, klasami i całą szkołą. Główna funkcjonalność, na której się skupiłem, to kalendarz zajęć, dbając o to, by był jak najbardziej funkcjonalny i estetyczny.

Narzędzia użyte w projekcie:

Devise – system logowania
Tailwind CSS – stylowanie
Hotwire/Turbo – interaktywność bez potrzeby pełnego odświeżania strony
SQLite – baza danych
RSpec – testy
FactoryBot – generowanie danych testowych

Projekt uruchamiany jest przy pomocy bin/dev. Nie zdążyłem stworzyć własnego pliku Dockerfile oraz docker-compose, ale projekt jest w pełni funkcjonalny bez nich.

Użytkownicy mają swoje role i w zależności od tego jaką role mają taki posiadają poziom dostępu np:
 - Rola student pozwala tylko na edytowanie swojego hasła i maila oraz sprawdzenie planu lekcyjnego.
 - Rola teacher pozwala na spojrzenie na więcej rzeczy takich jak grupy studentów, uczniowie nauczyciele przedmioty itd ale nie pozwala edytować.
 - Rola administratora ma pełen dostęp do wszytkich fukcjnonalności.

Warto zaznaczyć że użytkownik który się loguje ma podstawowo role studenta i nie ma dostępu do wszytkich fukcjnonalności
