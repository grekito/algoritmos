-- ejercicio 14
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Text.XHtml (base)
{-# HLINT ignore "Redundant bracket" #-}

promedio :: Float -> Float -> Float
promedio x y = (x + y) / 2

-- ejercicio 18

signo :: Int -> Int
signo x | x > 0 = 1
        | x < 0 = -1
        | x == 0 = 0

entre0y9 :: Int -> Bool
entre0y9 x | x < 9 && x > 0 = True
           | otherwise = False

absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | x < 0 = (-x)

esMultiplo2 :: Int -> Bool
esMultiplo2 x | even x = True -- mod x 2 == 0
              | otherwise = False

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod y x == 0 = True
                 | otherwise = False

esBisiesto :: Int -> Bool
esBisiesto x | mod x 4 == 0 && mod x 100 /= 0 = True
             | otherwise = False

rangoPrecio :: Int -> String
rangoPrecio x | x < 2000 = "Muy Barato"
              | x > 5000 = "Demasiado Caro"
              | x > 2000 && x < 5000 = "Hay que verlo bien"
              | x < 0 = "Esto no puede ser!"

dispersion :: Int -> Int -> Int -> Int
dispersion x y z = max (max x y) z - min (min x y) z

celsiusToFahr :: Float -> Float
celsiusToFahr x = (x * 1.8) + 32

fahrToCelsius :: Float -> Float
fahrToCelsius x = (x-32)/1.8

haceFrioF :: Float -> Bool
haceFrioF x | fahrToCelsius (x) < 8 = True
            | otherwise = False

-- ejercicio 25

segundo3 :: (Int, Int, Int) -> Int
segundo3 (a, b, c) = b 

ordena :: (Int, Int) -> (Int, Int)
ordena (a, b) = (min a b, max a b)

rangoPrecioParametrizado :: Int -> (Int, Int) -> String
rangoPrecioParametrizado x (a, b) | x < 0 = "Esto no puede ser!"
                                  | x > a && x < b = "hay que verlo bien"
                                  | x < a = "Muy barato"
                                  | x > b = "Demasiado caro"

mayor3 :: (Int, Int, Int) -> (Bool, Bool, Bool)
mayor3 (a, b, c) = (a>3, b>3, c>3)

todosIguales :: (Int, Int, Int) -> Bool
todosIguales (a, b, c) | a==b && b==c = True
                       | otherwise = False