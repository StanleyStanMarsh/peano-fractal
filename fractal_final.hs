import System.IO

-- Функция для генерации строки команд
derive :: Int -> [Char]
derive 0 = "L"
derive n = applyRules (derive (n - 1))

-- Применение правил к каждому символу в строке
applyRules :: [Char] -> [Char]
applyRules s = concatMap applyRule s

-- Правила L-системы для кривой Пеано
applyRule :: Char -> [Char]
applyRule 'L' = "LFRFL+F+RFLFR-F-LFRFL"
applyRule 'R' = "RFLFR-F-LFRFL+F+RFLFR"
applyRule c   = [c]  -- Оставляем другие символы без изменений

-- Интерпретация строки команд в список координат (x, y)
interpret :: Int -> [Char] -> [(Double, Double)]
interpret n commands = initialPos : eval commands initialPos initialAngle
  where
    initialPos = (0.5 * step, 0.5 * step)   -- Начальная позиция
    initialAngle = 0    -- Начальный угол (в градусах)
    step = 1 / (fromIntegral (3^n))   -- Шаг, зависящий от глубины рекурсии
    eval :: [Char] -> (Double, Double) -> Double -> [(Double, Double)]
    eval [] _ _ = []
    eval (c:cs) (x,y) angle
      | c == 'F' = let dx = step * cos (angle * pi / 180)
                       dy = step * sin (angle * pi / 180)
                       x' = x + dx
                       y' = y + dy
                   in (x', y') : eval cs (x', y') angle
      | c == '+' = eval cs (x, y) (angle + 90)  -- Поворот влево на 90 градусов
      | c == '-' = eval cs (x, y) (angle - 90)  -- Поворот вправо на 90 градусов
      | otherwise = eval cs (x, y) angle    -- Игнорируем другие символы

-- Главная функция, вычисляющая координаты кривой Пеано
peanoCurve :: Int -> [(Double, Double)]
peanoCurve n = interpret n (derive n)

main :: IO ()
main = do
  let n = 2  -- Максимальная глубина рекурсии
  let initialPos = [(0.5, 0.5)]  -- Список с начальной позицией
  -- Генерируем список списков координат для каждой глубины от 1 до n
  let pointsList = initialPos : [ peanoCurve k | k <- [1..n] ]

  putStrLn $ "n=" ++ show n
  -- out <- openFile "C:/Users/iasta/peano_fractal.txt" WriteMode
  -- hPrint out pointsList
  -- hClose out
  print pointsList
