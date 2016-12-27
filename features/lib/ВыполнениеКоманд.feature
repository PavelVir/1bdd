# language: ru

Функционал: Получение версии продукта
    Как Пользователь
    Я хочу иметь возможность выполнять команды
    Чтобы я мог проще автоматизировать больше действий на OneScript

Контекст: Очищаю параметры команды
  Допустим Я очищаю параметры команды "git" в контексте 
  И я включаю отладку лога с именем "git"
  И я выключаю отладку лога с именем "git"

Сценарий: Выполнение команды без параметров
    Когда Я выполняю команду "git"
    Тогда Вывод команды "git" содержит "[--version]"
    И Код возврата команды "git" равен 1

Сценарий: Выполнение команды с параметрами в одной строке
    Когда Я выполняю команду "git" c параметрами "--version"
    Тогда Я сообщаю вывод команды "git"
    И Вывод команды "git" содержит "version"
    И Код возврата команды "git" равен 0

Сценарий: Выполнение команды с параметрами, добавляемыми раздельно
    Когда Я добавляю параметр "--version" для команды "git"
    И Я выполняю команду "git"
    Тогда Я сообщаю вывод команды "git"
    И Вывод команды "git" содержит "version"
    И Код возврата команды "git" равен 0
