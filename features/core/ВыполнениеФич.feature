# language: ru

Функционал: Выполнение фич
	Как Разработчик
	Я Хочу, чтобы у меня была возможность выполнять фичи из feature-файлов

Сценарий: Выполнение фичи из одного файла

	Когда я подготовил тестовый каталог для фич
	И установил тестовый каталог как текущий
	И я подготовил специальную тестовую фичу "ПередачаПараметров"
	И я подставил файл шагов с уже реализованными шагами для фичи "ПередачаПараметров"
	Тогда проверка поведения фичи "ПередачаПараметров" закончилась с кодом возврата 0

Структура сценария: Выполнение фич из каталога <Каталог>
	Когда я подготовил тестовый каталог для фич
	И установил тестовый каталог как текущий
	И я подготовил специальную тестовую фичу "ПередачаПараметров"
	И я подставил файл шагов с уже реализованными шагами для фичи "ПередачаПараметров"
	Тогда проверка поведения фич с передачей параметра "" из каталога <ПутьКаталога> закончилась с кодом возврата 0

Примеры:
		| Каталог | ПутьКаталога |
		| . | . |
		| с использованием полного пути каталога | КаталогТестовыйПолный |
		| с использованием относительного пути каталога | КаталогТестовыйОтносительный |

Сценарий: Выполнение фич в каталоге, в котором есть обычные os-скрипты, не являющиеся файлами шагов
	Когда я подготовил тестовый каталог для фич
	И установил тестовый каталог как текущий
	И я создал файл "ПустойСкрипт.os" с текстом
	"""
	// Пустой скрипт
	"""
	
	Тогда проверка поведения фич с передачей параметра "" из каталога "." закончилась с кодом возврата 0

# Контекст: Каталог проекта устанавливаю как текущий
# 	Допустим установил каталог проекта "tests/fixtures" как текущий

Сценарий: После ошибочного шага следующие шаги сценария не выполняются
	Допустим установил каталог проекта "tests/fixtures" как текущий
	Тогда  проверка поведения фичи "ПадающийШаг" закончилась с кодом возврата 2
	И в лог-файле запуска продукта есть строка "ЯЗапускаюПадающийШагСПараметром-Первый падающий шаг"
	И в лог-файле запуска продукта отсутствует строка "ДоЭтогоШагаВыполнениеДойтиНеДолжно"
	И в лог-файле запуска продукта есть строка "2 Шаг ( 0 Пройден, 0 Не реализован, 1 Сломался, 1 Не выполнялся )"

Сценарий: При указании ключа быстрого останова на первой ошибке выполнение останавливается на первом же упавшем сценарии
	Допустим установил каталог проекта "tests/fixtures" как текущий
	Тогда проверка поведения фичи "ПадающиеСценарии" с передачей параметра "-fail-fast" закончилась с кодом возврата 2
	И в лог-файле запуска продукта есть строка "ЯЗапускаюПадающийШагСПараметром-Первый падающий шаг из первого сценария"
	И в лог-файле запуска продукта отсутствует строка "Второй неверный сценарий"
	И в лог-файле запуска продукта отсутствует строка "Первый падающий шаг из второго сценария"
	И в лог-файле запуска продукта есть строка "3 Сценарий ( 0 Пройден, 0 Не реализован, 1 Сломался, 2 Не выполнялся )"
	И в лог-файле запуска продукта есть строка "6 Шаг ( 0 Пройден, 0 Не реализован, 1 Сломался, 5 Не выполнялся )"

Сценарий: Без указания ключа быстрого останова на первой ошибке выполнение не останавливается на первом же упавшем сценарии
	Допустим установил каталог проекта "tests/fixtures" как текущий
	Тогда проверка поведения фичи "ПадающиеСценарии" с передачей параметра "" закончилась с кодом возврата 2
	И в лог-файле запуска продукта есть строка "ЯЗапускаюПадающийШагСПараметром-Первый падающий шаг из первого сценария"
	И в лог-файле запуска продукта есть строка "Второй неверный сценарий"
	И в лог-файле запуска продукта есть строка "Первый падающий шаг из второго сценария"
	И в лог-файле запуска продукта есть строка "3 Сценарий ( 0 Пройден, 0 Не реализован, 3 Сломался, 0 Не выполнялся )"
	И в лог-файле запуска продукта есть строка "6 Шаг ( 0 Пройден, 0 Не реализован, 3 Сломался, 3 Не выполнялся )"

Сценарий: Прогон фич из каталога при наличии падающих фич выдает правильный код возврата
	Допустим установил каталог проекта "tests/fixtures" как текущий
	Тогда проверка поведения фич с передачей параметра "" из каталога "." закончилась с кодом возврата 2

Сценарий: Проверка лога при запуске нереализованного шага сценария
	Допустим установил каталог проекта "tests/fixtures" как текущий
  Когда я подготовил тестовый каталог для фич
  И установил тестовый каталог как текущий
  И я создал файл фичи "НесуществующийШаг" с текстом
  """
    # language: ru
    Функционал: Просто функционал
    Сценарий: Просто сценарий
      Тогда выполняется несуществующий шаг
  """

  Тогда проверка поведения фичи "НесуществующийШаг" закончилась с кодом возврата 1
	И в лог-файле запуска продукта есть строка 
		"""
			Функциональность Просто функционал
			   Сценарий Просто сценарий
			      выполняется несуществующий шаг
			            Не реализован
		"""
	И в лог-файле запуска продукта есть строка "1 Сценарий ( 0 Пройден, 1 Не реализован, 0 Сломался, 0 Не выполнялся )"
	И в лог-файле запуска продукта есть строка "1 Шаг ( 0 Пройден, 1 Не реализован, 0 Сломался, 0 Не выполнялся )"
