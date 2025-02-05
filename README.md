# Peano Fractal in Haskell (EN)

This is an implementation of the Peano curve (a space-filling curve) in Haskell. The program generates coordinates of points for constructing a Peano fractal of a given recursion depth.

## Description

The Peano curve is a continuous space-filling curve first described by Giuseppe Peano. This implementation uses an L-system to generate a sequence of commands, which are then interpreted into coordinates of points.

### Key Functions

- `derive` - generates a string of L-system commands for a given recursion depth.
- `interpret` - converts commands into a sequence of coordinates.
- `peanoCurve` - the main function for generating points of the Peano curve.

## Usage

1. Ensure you have GHC (Glasgow Haskell Compiler) installed.
2. Compile the program:
```bash
   ghc fractal_final.hs   
```
3. Run the program:
 ```bash
   ./fractal_final   
 ```

By default, the program generates a Peano curve of the second order (n=2). You can change the order of the curve by modifying the value of `n` in the `main` function.

## Output Format

The program outputs a list of point coordinates for each recursion level from 1 to n. The coordinates are represented as pairs (x, y), where x and y are in the range [0, 1].

The examples of a graphical representation of Peano fractal by coordinates via matplotlib (for `n=2` and `n=4`).

![n_2](https://github.com/user-attachments/assets/458b33d7-93ee-4565-a1da-4b0f432aed35 "n = 2")
![n_4](https://github.com/user-attachments/assets/6b4fbb08-b7dd-47f1-952d-3399e7ffdd08 "n = 4")

## [L-system](https://encyclopediaofmath.org/wiki/L-systems) commands

- `F` - move forward
- `+` - turn left by 90 degrees
- `-` - turn right by 90 degrees
- `L`, `R` - symbols for generating L-system rules

## Requirements

- GHC (Glasgow Haskell Compiler)
- Basic Haskell libraries

## Notes

In the current version, the results are printed to the console. Uncomment the code in the `main` function to save the results to a file.

# Фрактал Пеано на Haskell (RU)

Это реализация кривой Пеано (пространственно-заполняющей кривой) на языке Haskell. Программа генерирует координаты точек для построения фрактала Пеано заданной глубины рекурсии.

## Описание

Кривая Пеано - это непрерывная кривая, заполняющая пространство, впервые описанная Джузеппе Пеано. Эта реализация использует L-систему для генерации последовательности команд, которые затем интерпретируются в координаты точек.

### Основные функции

- `derive` - генерирует строку команд L-системы для заданной глубины рекурсии
- `interpret` - преобразует команды в последовательность координат
- `peanoCurve` - основная функция для генерации точек кривой Пеано

## Использование

1. Убедитесь, что у вас установлен GHC (Glasgow Haskell Compiler)
2. Скомпилируйте программу:   
```bash
   ghc fractal_final.hs   
```
3. Запустите программу:  
 ```bash
   ./fractal_final   
 ```

По умолчанию программа генерирует кривую Пеано второго порядка (n=2). Вы можете изменить порядок кривой, модифицировав значение `n` в функции `main`.

## Формат вывода

Программа выводит список координат точек для каждого уровня рекурсии от 1 до n. Координаты представлены в виде пар (x, y), где x и y находятся в диапазоне [0,1].

Примеры графического представления фрактала Пеано по координатам через matplotlib (для `n=2` и `n=4`).

![n_2](https://github.com/user-attachments/assets/458b33d7-93ee-4565-a1da-4b0f432aed35 "n = 2")
![n_4](https://github.com/user-attachments/assets/6b4fbb08-b7dd-47f1-952d-3399e7ffdd08 "n = 4")

## Команды [L-системы](https://encyclopediaofmath.org/wiki/L-systems)

- `F` - движение вперед
- `+` - поворот налево на 90 градусов
- `-` - поворот направо на 90 градусов
- `L`, `R` - символы для генерации правил L-системы

## Требования

- GHC (Glasgow Haskell Compiler)
- Базовые библиотеки Haskell

## Примечания

В текущей версии результаты выводятся в консоль. Раскомментируйте код в функции `main` для сохранения результатов в файл. 
