-- PROYECTO 1 // MARUDES CONSTANTINO

--Ejercicios


--1. Programa las siguientes funciones

--1a
esCero :: Int -> Bool
esCero x = x==0

{--Ejemplos
ghci> esCero 0
True
ghci> esCero 5
False
ghci> esCero (-2)
False
ghci> 
--}

--1b
esPositivo :: Int -> Bool
esPositivo x = x > 0

{--Ejemplos
ghci> esPositivo 12
True
ghci> esPositivo 0
False
ghci> esPositivo (-1)
False
ghci>
--}

--1c
esVocal :: Char -> Bool
esVocal x | x == 'a' = True
          | x == 'e' = True
          | x == 'i' = True
          | x == 'o' = True
          | x == 'u' = True
          | otherwise = False

{--Ejemplos
ghci> esVocal 'r'
False
ghci> esVocal 'a'
True
ghci> esVocal 'E'
False
ghci> 
--}

--1d
valorAbsoluto :: Int -> Int
valorAbsoluto x | x >= 0 = x
                | x < 0 = -x

{--Ejemplos
ghci> valorAbsoluto 0
0
ghci> valorAbsoluto 5
5
ghci> valorAbsoluto (-312)
312
ghci>
--}

--2. Programa las siguientes funciones usando recursion o composicion

--2a
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

{--Ejemplos
ghci> paratodo [True, True, False]
False
ghci> paratodo [True, True]
True
ghci> paratodo []
True
ghci>
--}

--2b
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x+sumatoria xs

{--Ejemplos
ghci> sumatoria []
0
ghci> sumatoria [(-1),5,3]
7
ghci> sumatoria [10,3,41]
54
ghci> 
--}

--2c
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x*productoria xs

{--Ejemplos
ghci> productoria []
1
ghci> productoria [1,5,3]
15
ghci> productoria [(-8),2,3]
-48
ghci> 
--}

--2d
factorial :: Int -> Int
factorial 0 = 1
factorial n | n < 0 = error("Es un numero negativo!")
            | n > 0 = n*factorial (n-1)

{--Ejemplos
ghci> factorial (-3)
*** Exception: Es un numero negativo!
CallStack (from HasCallStack):
  error, called at PROYECTO1.hs:122:23 in main:Main
ghci> factorial 10
3628800
ghci> factorial 0
1
ghci> 
--}

--2e
promedio :: [Int] -> Int 
promedio [] = error("Error")
promedio x = div (sumatoria x) (length x)

{--Ejemplos
ghci> promedio []
*** Exception: Error
CallStack (from HasCallStack):
  error, called at PROYECTO1.hs:139:15 in main:Main
ghci> promedio [7,5,8]
6
ghci> promedio [(-2),5,8]
3
ghci>
--}

--3
pertenece :: Int -> [Int] -> Bool
pertenece x [] = False
pertenece x (y:xs) = x == y || pertenece x xs

{--Ejemplos
ghci> pertenece 0 [2,7,0,3]
True
ghci> pertenece 4 [9,2,3,6]
False
ghci> pertenece (-1) []
False
ghci> 
--}

--4a
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

{--Ejemplos
ghci> paratodo' [2,6,7] esPar
False
ghci> paratodo' [6,9,3] esPositivo 
True
ghci> paratodo' [] esCero
True
ghci> 
--}

--4b
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

{--Ejemplos
ghci> existe' [] esCero 
False
ghci> existe' [(-2), (-10), 0] esPositivo  
False
ghci> existe' [(-2), (-10), 0, 10] esPositivo  
True
ghci> 
--}

--4c
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

--4d
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t

--5
paratodo2 :: [Bool] -> Bool
paratodo2 x = paratodo' x id

--6a
--definimos una funcion que identifica numeros pares
esPar :: Int -> Bool
esPar x = mod x 2 == 0

todosPares :: [Int] -> Bool
todosPares [] = True
todosPares xs = paratodo' xs esPar

--6b
--definimos una funcion que identifica si un numero es multiplo de otro
esMultiplo :: Int -> Int -> Bool
esMultiplo x y = mod y x == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x xs = existe' xs (esMultiplo x)

--6c
--definimos una funcion que dado un numero devuelve su cuadrado
cuadrado :: Int -> Int
cuadrado x = x*x

sumaCuadrados :: Int -> Int
sumaCuadrados n | n < 0 = error("El numero es negativo!")
                | n >= 0 = sumatoria' [0..n] cuadrado

--6d
--definimos una funcion mod'
mod' :: Int -> Int -> Bool
mod' x y = mod x y == 0 

existeDivisor :: Int -> [Int] -> Bool
existeDivisor x xs = existe' xs (mod' x)

--6e
esPrimo :: Int -> Bool
esPrimo x = existeDivisor x [2..(x-1)] == False

--6f
factorial' :: Int -> Int
factorial' n = productoria [1..n]

--6g
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (filter esPrimo xs)

--6h
--definimos la funcion fib
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFib :: Int -> Bool
esFib n = pertenece n (map fib [0..n])

--6i
todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

{--7
La funcion map (de tipo (a -> b) -> [a] -> [b]) toma un predicado y lo aplica a todos los elementos
de una lista, devolviendo asi una nueva lista con el resultado del proceso anterior.
La funcion filter (de tipo (a -> Bool) -> [a] -> [a]) toma un predicado y lo aplica a todos
los elementos de una lista, devolviendo asi una lista con los numeros que luego de haberles 
aplicado la funcion predicado, den resultado True

ghci> map succ [1, -4, 6, 2, -8]
[2,-3,7,3,-7]
ghci>

ghci> filter esPositivo  [1, -4, 6, 2, -8]
[1,6,2]
ghci>
--}

--8a
duplicado :: [Int] -> [Int]
duplicado [] = []
duplicado (x:xs) = 2*x : duplicado xs

--8b
duplicado' :: [Int] -> [Int]
duplicado' xs = map (*2) xs

--9a
soloPrimos :: [Int] -> [Int]
soloPrimos [] = []
soloPrimos (x:xs) | esPrimo x == True = x : soloPrimos xs
                  | esPrimo x == False = soloPrimos xs

--9b
soloPrimos' :: [Int] -> [Int]
soloPrimos' xs = filter esPrimo xs

--9c A mi parecer no la puedo mejorar ya que ya la habia hecho con la funcion filter

--10a
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = n : primIgualesA n xs
                      | otherwise = primIgualesA n []

--10b
primIgualesA' :: (Eq a) => a -> [a] -> [a]
primIgualesA' x xs = takeWhile (==x) xs

--11a
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales (x:y:xs) | x==y = x : primIguales (y:xs)
                     | otherwise = [x]

--11b
primIguales' :: (Eq a) => [a] -> [a]
primIguales' (x:xs) = primIgualesA' x xs

--12
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = op (t x) (cuantGen op z xs t) 

--Funciones del ejercicio 4 reescritas con la funcion cuantGen
--4a
paratodo'' :: [a] -> (a -> Bool) -> Bool
paratodo'' xs t = cuantGen (&&) True xs t

--4b
existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs t = cuantGen (||) False xs t

--4c
sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs t = cuantGen (+) 0 xs t

--4d
productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs t = cuantGen (*) 1 xs t

--13
distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] [] = 0
distanciaEdicion [] (y:ys) = length (y:ys)
distanciaEdicion (x:xs) [] = length (x:xs)
distanciaEdicion (x:xs) (y:ys) | x==y = length xs + length ys
                               | x /= y = 1 + length xs + length ys

--14
primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen ls p = takeWhile p ls

{--15 a)
f :: (a, b) -> ...
f (x , y) = ...
Esta bien tipado y cubre todos los casos // subexpresiones: x :: a, y :: b, (x, y) :: (a, b)

15 b)
f :: [(a, b)] -> ...
f (a , b) = ...
Esta mal tipado ya que la funcion pide una lista de tuplas y solo le estamos dando una tupla //
subexpresiones: a :: a, b :: b, (a, b) :: (a, b)

15 c)
f :: [(a, b)] -> ...
f (x:xs) = ...
Esta bien tipado; no cubre el caso de la lista vacia // subexpresiones: x :: (a, b), xs :: [(a, b)]

15 d)
f :: [(a, b)] -> ...
f ((x, y) : ((a, b) : xs)) = ...
Esta bien tipado; no cubre caso de lista vacia ni caso de una sola tupla // subexpresiones:
x :: a, y :: b, a :: a, b :: b, xs :: [(a, b)]

15 e)
f :: [(Int, a)] -> ...
f [(0, a)] = ...
Esta mal tipado; no cubre caso de lista vacia ni de entero /= 0 // subexpresiones: 0 :: Int,
a :: a, (0, a)

15 f)
f :: [(Int, a)] -> ...
f ((x, 1) : xs) = ...
Esta bien tipado; no cubre caso de lista vacia ni de 'a' /= 1 // subexpresiones: x :: Int,
1 :: a, (x, 1) :: (Int, a), xs :: [(Int, a)]

15 g)
f :: (Int -> Int) -> Int -> ...
f a b = ...
Esta bien tipado; cubre todos los casos // subexpresiones: a :: (Int -> Int), b :: Int

15 h)
f :: (Int -> Int) -> Int -> ...
f a 3 = ...
Esta bien tipado; no cubre casos donde Int sea /= 3 // subexpresiones: a :: (Int -> Int), 3 :: Int

15 i)
f :: (Int -> Int) -> Int -> ...
f 0 1 2 = ...
Esta mal tipado, se piden 2 elementos y se ingresan 3, ademas el primer elemento debe ser 
una funcion no un numero.

--}

{-- 
16 a)
f :: (a, b) -> b
f (x, y) = y

16 b)
f' :: (a, b) -> c
f' (x, y) = x + y
f' (x, y) = x * y

16 c)
f'' :: (a -> b) -> a -> b
f'' p x = p x

16 d)
f''' :: (a -> b) -> [a] -> [b]
f''' p (x:xs) = p x : f''' xs

--}
