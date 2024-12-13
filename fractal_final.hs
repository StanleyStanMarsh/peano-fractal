import System.IO

-- ������� ��� ��������� ������ ������
derive :: Int -> [Char]
derive 0 = "L"
derive n = applyRules (derive (n - 1))

-- ���������� ������ � ������� ������� � ������
applyRules :: [Char] -> [Char]
applyRules s = concatMap applyRule s

-- ������� L-������� ��� ������ �����
applyRule :: Char -> [Char]
applyRule 'L' = "LFRFL+F+RFLFR-F-LFRFL"
applyRule 'R' = "RFLFR-F-LFRFL+F+RFLFR"
applyRule c   = [c]  -- ��������� ������ ������� ��� ���������

-- ������������� ������ ������ � ������ ��������� (x, y)
interpret :: Int -> [Char] -> [(Double, Double)]
interpret n commands = initialPos : eval commands initialPos initialAngle
  where
    initialPos = (0.5 * step, 0.5 * step)   -- ��������� �������
    initialAngle = 0    -- ��������� ���� (� ��������)
    step = 1 / (fromIntegral (3^n))   -- ���, ��������� �� ������� ��������
    eval :: [Char] -> (Double, Double) -> Double -> [(Double, Double)]
    eval [] _ _ = []
    eval (c:cs) (x,y) angle
      | c == 'F' = let dx = step * cos (angle * pi / 180)
                       dy = step * sin (angle * pi / 180)
                       x' = x + dx
                       y' = y + dy
                   in (x', y') : eval cs (x', y') angle
      | c == '+' = eval cs (x, y) (angle + 90)  -- ������� ����� �� 90 ��������
      | c == '-' = eval cs (x, y) (angle - 90)  -- ������� ������ �� 90 ��������
      | otherwise = eval cs (x, y) angle    -- ���������� ������ �������

-- ������� �������, ����������� ���������� ������ �����
peanoCurve :: Int -> [(Double, Double)]
peanoCurve n = interpret n (derive n)

main :: IO ()
main = do
  let n = 2  -- ������������ ������� ��������
  let initialPos = [(0.5, 0.5)]  -- ������ � ��������� ��������
  -- ���������� ������ ������� ��������� ��� ������ ������� �� 1 �� n
  let pointsList = initialPos : [ peanoCurve k | k <- [1..n] ]

  putStrLn $ "n=" ++ show n
  -- out <- openFile "C:/Users/iasta/peano_fractal.txt" WriteMode
  -- hPrint out pointsList
  -- hClose out
  print pointsList
