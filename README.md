[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&random=false&width=435&lines=%D0%94%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F+%D0%BA+%D0%BA%D0%B5%D0%B9%D1%81%D1%83+%D0%B0%D0%B2%D0%B8%D1%82%D0%BE)](https://geekbattle.online/events/it-purple-hack)

---
Инструкция по развертыванию
>Чтобы запустить docker-compose, нужно перейти в корневую папку и прописать команду docker-compose up -d

---
Клиентская часть представляет из себя админ панель, с удобным UI.

При заходе на страницу, перед аналитиком появляются две вкладки:
"Изменение матриц" позволяет изменять, удалять и добавлять значения в выбранную матрицу. После изменений цены передаются в сервис отдачи цен.
"Составление стореджа" позволяет аналитику назначать активную бейз матрицу, выбирать назначение активных дисконт матриц, изменять их сегменты, а так же назначать/изменять сегменты для них после чего отправлять данные на сервис.

На стороне клиента НЕ поступают запросы для получения всех строк матриц, происходит поиск только по нужным категориям и локациям, цены устанавливаются как вручную, так и с возможность изменения цены сразу у нескольких строк в матрице.

---

Стек используемых технологий клиентской части:

* ![Static Badge](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
  
* ![Static Badge](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
  
* ![Static Badge](https://img.shields.io/badge/Vite-B73BFE?style=for-the-badge&logo=vite&logoColor=FFD62E)
  
* ![Static Badge](https://img.shields.io/badge/Material%20UI-007FFF?style=for-the-badge&logo=mui&logoColor=white)
  
* ![Static Badge](https://img.shields.io/badge/axios-671ddf?&style=for-the-badge&logo=axios&logoColor=white)
  
* ![Static Badge](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
  
* ![Static Badge](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

---
Стек используемых технологий серверной части:
* ![Static Badge](https://img.shields.io/badge/Node%20js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)

* ![Static Badge](https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E)

* ![Static Badge](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

* ![Static Badge](https://img.shields.io/badge/Express%20js-000000?style=for-the-badge&logo=express&logoColor=white)

* ![Static Badge](https://img.shields.io/badge/Sequelize-52B0E7?style=for-the-badge&logo=Sequelize&logoColor=white)

---
С точки зрения бэкенд-составляющей решение представляет собой два сервера: сервис для аналитиков и сервис для отдачи цен пользователям. Все существующие матрицы хранятся в базе данных (PostgreSQL). Каждая матрица помещается в отдельную таблицу, состоящую из колонок: microcategory_id (id микрокатегории), location_id (id локации), price (цена для пары локация/категория), id (id для пары локация/категория). Для удобства работы со всеми матрицами созданы две дополнительные таблицы: baselines и discounts. В них содержится основная информация по матрицам, созданным на данный момент. Эти таблицы состоят из столбцов: id (id матрицы), name (название матрицы), active (активна матрица на данный момент или нет). Для таблицы discounts также добавляется столбец segment (тот сегмент, который присвоен дисконтной матрице на данный момент).

Сервер для админ-панели

Проект первого сервера (предназначенного для аналитиков) включает в себя контроллеры и роутеры, предназначенные для взаимосвязи с клиентской стороной и базой данных; мидлвееры, необходимые для отлова ошибок; модели, описывающие таблицы в базе данных; статические объекты, описывающие заранее заданные локации, микрокатегории и сегменты, а также построенные из них деревья; файл db и index, описывающие базу данных и настройки сервера соответственно; файл ServerConfiguration, описывающий начальную конфигурацию сервера.

Во время инициализации сервера в его память из базы данных загружается информация обо всех существующих на данный момент матрицах (это информация содержит в себе имена и статусы активности baseline и discount матриц, но не сами матрицы) и сегментах (примененных и не примененных к discount матрицам). Эта же информация отправляется на клиентскую сторону в момент ее инициализации.

По необходимости клиентская сторона выборочно запрашивает строки какой-то матрицы, отфильтрованные по локациям и микрокатегориям. В момент изменения матрицы (равно создания новой) на сервер отправляется информация только об измененных строках. При этом если изменяются все подкатегории категории и/или все подлокации локации, то информация отправляется только по самой верхней (общей/исходной) категории и/или локации, а увеличение цен для подкатегорий и подлокаций происходит автоматически на сервере. Все это позволяет значительно сократить объем пересылаемых данных и использовать для этих целей стандартный JSON.

При изменении стораджа с клиентской стороны на сервер поступает информация об именах новых матриц (сами матрицы при этом не передаются), а с сервера админ-панели эта же информация передается на сервис отдачи цен.

Сервис отдачи цен

Сервис отдачи цен по своему устройству похож на сервер для админ-панели, но при этом имеет связь с пользователями с помощью одного get-запроса, не имеет связи с клиентской стороной админ-панели и имеет связь с сервером админ-панели.

В момент запуска сервера и во время изменения стораджа (об этом сервис отдачи цен узнает от сервера админ панели с помощью put-запроса) активные на данный момент baseline и discounts матрицы загружаются в память сервера. При этом во время изменения стораджа сервис не «встает» и продолжает отдавать цены пользователям, так как переключение стораджа произойдет только в тот момент, когда новый сторадж уже будет загружен в память сервера.

Матрицы загружаются в сервис отдачи цен в виде двумерных массивов, где первым индексом является microcategory_id, вторым location_id, а значением, лежащим под этими индексами, является цена, соответствующая этой паре категории и локации. Такая структура позволяет доставать стоимость из матрицы за время O(1) и не обращаться при этом к базе данных.

При поступлении в сервис get-запроса с интересующими категорией, локацией и id пользователя, сервис определяет, какие сегменты соответствуют заданному пользователю и пробует найти цену, начиная с самых старших скидочных матриц и заканчивая baseline матрице, постепенно поднимаясь по деревьям локаций и категорий для каждой матрицы.

