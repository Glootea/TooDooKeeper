# TooDooKeeper
Приложение для сохранения to-do. Каждая задача может включать описание, крайний срок выполнения и важность.

[Скачать актуальную версию приложенения](https://disk.yandex.ru/d/dC19bKlyPLOG5Q)
## Приложение состоит из 2 экранов:
### To-do list
Список всех to-do с возможностью добавления новых. Каждый to-do содержит краткую информацию. Возможно отметить выполнение нажатием на checkbox или смещением задачи вправо. Смещение влево удалит задачу. Разные уровни важности отмечаются значками. Крайняя дата показывается при наличии. При нажатии на задачу можно перейти к ее редактированию. Список to-do сортируется по важности и факту выполнения, выполненные задачи можно скрыть
### Edit
Содержит поле ввода описания, выбор важности задачи и ее дедлайна. Можно сохранить или удалить to-do, а также отметить изменения.

---
### Тестирование
Реализованы unit-тесты для 2 bloc, управляющих поведением экранов, и ToDoRepository, отвечающего за работу с локальным и удаленным хранилищами. Integration тест проверяет сценарий добавления задачи с ее последующим отображением на главном экране, а также изменения ее постояния.
### Локальная работа
Если приложению не удается отправить данные в сеть, оно уведомляет пользователя с помощью красного заголовка на главном экране. При каждом изменении данных приложение старается объединить удаленные и локальные данные, предпочтение отдается последнему по времени изменению.
### Deeplinks 
С помощью deeplink можно открыть экран создания заметки (ссылка -> https://toodookeeper.web.app/new или команда -> adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d https://toodookeeper.web.app/new com.glootea.toodookeeper) или импортировать задачу, как показано далее.  
## Скриншоты
<p align="middle">
  <img src="https://drive.google.com/uc?export=view&id=1wY71XHbRueFAVCm2K1D9DIFJwfP6v3uE" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1wC1g6NGjFBkq-Thou-aR-P8JwlBu1Ikn" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1wKp4iEO__03SP9mFr2NRRAEII8gEQwCO" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1wGIIrYZ-210_KkmOr3kCi9u9qQ08uByp" width="24%" />
</p>
<p align="middle">

  <img src="https://drive.google.com/uc?export=view&id=1XeMCnd7hd7teW9KCkR8XbKPVx9lSR-FU" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=16FHGB6nV2r39DZm601Gyj-a3AU2BkAgF" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1chJwp8OHlwCwQ0C_6xng4Btmoulkvt-e" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=12q1gnMUoRyFse_E_9e8AWFObv0oI5jpO" width="24%" />
</p>

# Библиотеки
В качестве стейт-менеджмента используется [bloc](https://pub.dev/packages/flutter_bloc), локальная база данных - [drift](https://pub.dev/packages/drift), работа с бэкендом осуществляется с помощью [dio](https://pub.dev/packages/dio), интернализация - [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html) и [intl](https://pub.dev/packages/intl). Уникальные ключи для id to-do и deviceID создаются через [uuid](https://pub.dev/packages/uuid). Линтер - [very_good_analysis](https://pub.dev/packages/very_good_analysis).
<p align="middle">
  <img src="https://drive.google.com/uc?export=view&id=1SkhO-lwbi1GFurndsEaJ6M54xTqO_lt3" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1-SdnkRJFtRAQ677J9uGmjiglmXBxON2W" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1uXCfI2woOEUwhpfIxZC-qNZzF7DU9Pjd" width="24%" />
  <img src="https://drive.google.com/uc?export=view&id=1Gn6vxcsLkoGSGjYVn-cSxGMVqQ_zKWrY" width="24%" />
</p>

## Прочее
Само приложение поддерживает edge-to-edge, корректно обрабатывая различные способы навигации. Иконка приложения адаптируется под material you. Debug и release сборки разделены, что облегчает пользование и тестирование.
<p align="middle">
  <img src="https://drive.google.com/uc?export=view&id=1kwvhxBl-MzXAgj7o8qdqR5mmthfZUvU4" width="32%" />
  <img src="https://drive.google.com/uc?export=view&id=1kr6m2PLQYP7NbQ5chIzYzSih4Llb4Hyn" width="32%" />
  <img src="https://drive.google.com/uc?export=view&id=1kgkwOMpDS6NVQVdA83rJMlmdquuQhYn1" width="32%" />
</p>

### Yandex LoginSDK
Получение токенов, необходимых для взаимодействия с бэкендом, с последующим сохранением в [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)

### Поделиться по ссылке
[Видео](https://drive.google.com/file/d/1oUf2CsXi2GpA8HbKefmwbAN3MM9_CS_6/preview)

После создания задачи можно нажать кнопку поделиться (пока только на android) или скопировать ссылку, которая проходит через сервис сокращения (spoo.me). Когда получатель откроет ссылку, он попадет на экран редактирования с полностью заполненной задачей, которую можно изменить и сохранить. Для этого в настройках необходимо разрешить приложению открывать ссылки.

### Предиктивый жест назад (только на android >= 14)
