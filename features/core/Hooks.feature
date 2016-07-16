# language: ru

Функционал: Проверка хуков в файле шагов
	Как Разработчик
	Я Хочу, чтобы у меня была возможность использовать хуки ПередЗапускомСценария/ПослеЗапускаСценария в файлах шагов

Контекст: Подготовка файла фичи "ПроверкаХуков"
  Когда я подготовил тестовый каталог для фич
  И установил тестовый каталог как текущий
  И я создал файл фичи "ПроверкаХуков" с текстом
  """
    # language: ru
    Функционал: Проверка хуков
    Сценарий: Хуки
      Тогда я записываю "ШагСценария" в файл журнала
  """
  И я запустил генерацию шагов фичи "ПроверкаХуков"
  И я получил сгенерированный os-файл "ПроверкаХуков" в ожидаемом каталоге

Сценарий: Проверка выполнения хуков

  Тогда проверка поведения фичи "ПроверкаХуков" закончилась с кодом возврата 1
  И я подставил файл шагов фичи "ПроверкаХуков" из каталога "tests\fixtures"
  И проверка поведения фичи "ПроверкаХуков" закончилась с кодом возврата 0
  И текст файла-журнала равен "ПередЗапускомСценария;ШагСценария" 