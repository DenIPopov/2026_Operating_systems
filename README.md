# 2026_Operating_systems
# Лабораторная работа_2 
## Установка Linux (развёртка, bootstraping)

Сделал лабу скриншотами, потому что только в конце увидел, что нужно записать видео))))))))))))))

1) Устанавливаем Oracle VirtualBox на ПК
<img width="491" height="383" alt="1" src="https://github.com/user-attachments/assets/993cab9f-fce7-42c5-ae32-ef7c95cb7933" /> 

2) Выбираем дистрибутив Debian, подбираем нужные параметры
<img width="852" height="392" alt="2" src="https://github.com/user-attachments/assets/dfaf9d5f-e165-4142-ab0f-8e576052a782" />
<img width="855" height="481" alt="3 1" src="https://github.com/user-attachments/assets/353a5d3a-427b-4dde-b6ea-3e104285b1c0" />
 
3) Скачиваем ISO образ на ПК
<img width="896" height="529" alt="4" src="https://github.com/user-attachments/assets/56bbbbb7-7f3f-48cc-9182-002a6654d3a3" />
<img width="895" height="528" alt="5" src="https://github.com/user-attachments/assets/1b02da8b-f496-472f-9c34-9e73dd6792db" />

4) Процесс устновки Linux
<img width="639" height="563" alt="6" src="https://github.com/user-attachments/assets/8b811b19-8a02-4131-a2aa-039c7e6911ac" />
<img width="1278" height="878" alt="7" src="https://github.com/user-attachments/assets/8bd46851-e2eb-4722-ad7a-86e458020786" />
<img width="533" height="801" alt="8" src="https://github.com/user-attachments/assets/76894fd7-f2bd-4c39-be54-d373d5eaa82c" />
<img width="1276" height="798" alt="9" src="https://github.com/user-attachments/assets/858cddf2-3137-40a2-a943-0833f5468934" />
<img width="501" height="798" alt="10" src="https://github.com/user-attachments/assets/45e870ec-8718-465c-8122-81d482379faf" />
<img width="581" height="191" alt="11" src="https://github.com/user-attachments/assets/540c7cd3-3735-45a0-9969-f000597c61b3" />
<img width="619" height="299" alt="12" src="https://github.com/user-attachments/assets/5260256e-99fa-44ba-b054-2b1e59934875" />
<img width="1284" height="338" alt="13" src="https://github.com/user-attachments/assets/aff8a34c-431c-4817-84f4-636c934b56bf" />
<img width="1597" height="934" alt="14" src="https://github.com/user-attachments/assets/12b6a3eb-55c9-4c70-b581-6bfb89bcf66d" />
<img width="653" height="200" alt="15" src="https://github.com/user-attachments/assets/7f6266f3-42d8-4e45-b77b-4e189e498fa1" />
<img width="473" height="47" alt="16" src="https://github.com/user-attachments/assets/efc10f78-02b1-4545-b402-679cf8eeddd9" />
<img width="1016" height="447" alt="17" src="https://github.com/user-attachments/assets/1fae756c-0bc8-405a-8785-d2fe0721d07c" />
<img width="1319" height="525" alt="18" src="https://github.com/user-attachments/assets/f55b939d-48b4-4d10-bf56-4ef7216cc796" />

5) Проверка ping (google.com)
<img width="466" height="290" alt="19" src="https://github.com/user-attachments/assets/63f7fd91-cb11-4348-a723-e6045da7599d" />
<img width="755" height="212" alt="20" src="https://github.com/user-attachments/assets/ae16fc7f-9814-4c7e-a476-bae9d80325a1" />
<img width="958" height="824" alt="21" src="https://github.com/user-attachments/assets/c7d28b92-382d-4e48-8272-8efe71e58f94" />

6) Делаем переброс портов
<img width="903" height="518" alt="22" src="https://github.com/user-attachments/assets/76117993-d8ef-4940-95f4-108ec7a50b96" />
<img width="638" height="384" alt="23" src="https://github.com/user-attachments/assets/d8c4331e-06a3-455a-9395-99348e625263" />
<img width="854" height="587" alt="24" src="https://github.com/user-attachments/assets/4ece725f-72cb-4694-bba6-615a45b3f871" />
<img width="840" height="582" alt="25" src="https://github.com/user-attachments/assets/b7f6ec7c-0a68-4988-ae01-1ad99cde0d04" />
<img width="739" height="490" alt="26" src="https://github.com/user-attachments/assets/2493a02d-2f31-49c8-9acc-c8880134d6e3" />

# Лабораторная работа_1
**Тема:** Исследование компилятора GCC, языка ассемблера, Makefile, Git. Добавление параллельного процесса с синхронизацией.
# Вариант: с вычислением факториала на языке C++
## Файл с написаной функции выполнен в VS Code (жалею об этом)
## Цель работы

1. Изучить этапы компиляции программы на C++.
2. Исследовать ассемблерный код, генерируемый компилятором GCC с разными уровнями оптимизации (0, 1, 2, 3).
3. Научиться создавать Makefile и работать с Git.
4. Реализовать многопоточное вычисление с синхронизацией доступа к общему ресурсу.

## Ход работы

1) Для начала мы создали программы на C++ для вычисления факториала, а именно: factorial.cpp; factorial.h; 
2) Затем была создана программа с параллельным потоком: paral.cpp; 
3) Он вычисляет факториал и записывает в файл res.tet (итоговый результат). Вычисление факториала от 1-20;

4) Генерация ассемблерного кода. Файлы: factorial_O0.s; factorial_O1.s; factorial_O2.s; factorial_O3.s;

5) Создание Makefile

6) Создание Git коммитов

## Напишем программу, вычисляющую факториал заданного числа на C++
<img width="560" height="326" alt="image" src="https://github.com/user-attachments/assets/5b0254ac-c894-452c-920b-83de9443c1b0" />

## Вывод программы. Программа вычисляет факториал в диапазоне от 0 до 20.
<img width="1184" height="158" alt="image" src="https://github.com/user-attachments/assets/2270b741-34d3-440e-8b8d-56c26e09855c" />

## Ассемблерный код
1) cmd строка. Из языка C++ в assembler
<img width="726" height="614" alt="image" src="https://github.com/user-attachments/assets/f207bec2-724d-4d09-8674-25f3c6c2c24d" />

2) Без оптимизации -O0. Часть кода с комментариями.
<img width="763" height="916" alt="image" src="https://github.com/user-attachments/assets/dbfad744-21e3-46bd-811f-2af2f6eef317" />

3) С оптимизацией -O1. Полный код.
<img width="760" height="918" alt="image" src="https://github.com/user-attachments/assets/e2dfeed8-91b5-444c-a2c8-d48792883568" />
<img width="761" height="850" alt="image" src="https://github.com/user-attachments/assets/aa0151ad-924e-4e91-949e-ae7eda5dda77" />
<img width="760" height="812" alt="image" src="https://github.com/user-attachments/assets/c3591d84-e0d2-4d6b-81f6-192012a39a3e" />

4) С оптимизацией -O3 Часть кода.
<img width="755" height="839" alt="image" src="https://github.com/user-attachments/assets/0980d134-0c2a-4054-99b3-540375e22b3c" />

## Вывод
1) Мы поработали c С++ и разработали программу для вычисления факториала
2) Получили оптимизацию при помощи ассемеблерного кода через cmd
3) К одному из ассемблерных кодов добавлены комментарии для лучшего понимания кода
4) Создали Makefile
5) Создали паралельный поток вычислений с синхронизацией через файл
6) Поработали с Git

# Лабораторная работа_3a
## Реализация скрипта bash
## Вариант: в текстовых файлах (.txt) найти заданную в параметре сценария строку, из найденных файлов составить список, сохранить его в файл

Тема: Поиск строки в текстовых файлах и сохранение списка найденных файлов.

Написание кода в bash
<img width="1066" height="503" alt="Снимок экрана 2026-05-18 011840" src="https://github.com/user-attachments/assets/45fcfbd8-484f-4272-b3f7-34242435f612" />

Результат работы. В первом тесте обнаружено "hello" из файла find_string.sh
<img width="452" height="166" alt="31" src="https://github.com/user-attachments/assets/c05d7d01-c56f-4958-8fb2-608608cf79a3" />

## Вывод
1) Разработан скрипт на bash для поиска строки в текстовых файлах (.txt)
2) Изучены основные команды: find, grep, перенаправление ввода/вывода
3) Реализована обработка параметров командной строки
4) Результат работы сохраняется в файл и выводится на экран (bash)

# Лабораторная работа_3b
## Реализация скрипта на Windows PowerShell
## Тема: Поиск строки в текстовых файлах и сохранение списка найденных файлов (аналог bash-скрипта).
