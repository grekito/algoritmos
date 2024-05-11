--1a
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

--1b
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

--1c
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Ord, Eq, Show, Bounded)

--1d
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--3a
minimoElemento :: (Show a, Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

--3b
minimoElemento' :: (Show a, Bounded a, Ord a) => [a] -> a 
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

{--3c
ghci> minimoElemento [Fa, La, Sol, Re, Fa]
Re
ghci> 
--}

--4a
type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--4b Ciclista :: Modalidad -> Deportista

--4c
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista a):xs) = 1 + contar_velocistas xs
contar_velocistas (x:xs) = 0 + contar_velocistas xs

--4d
zonaFutbolista :: Zona -> Deportista -> Bool
zonaFutbolista Arco (Futbolista Arco x y z) = True
zonaFutbolista Defensa (Futbolista Defensa x y z) = True
zonaFutbolista Mediocampo (Futbolista Mediocampo x y z) = True
zonaFutbolista Delantera (Futbolista Delantera x y z) = True
zonaFutbolista _ _ = False

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas xs z = length (filter (zonaFutbolista z) xs)

--5a
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--5b
data Alteracion = Bemol | Natural | Sostenido deriving (Enum, Eq, Ord)

--5c
data NotaMusical = NotaMusical NotaBasica Alteracion

--5d
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (NotaMusical x Bemol) = sonidoNatural x - 1
sonidoCromatico (NotaMusical x Natural) = sonidoNatural x
sonidoCromatico (NotaMusical x Sostenido) = sonidoNatural x + 1

--5e
instance Eq NotaMusical where
    (==) nota1 nota2 = sonidoCromatico nota1 == sonidoCromatico nota2

--5f
instance Ord NotaMusical where
    (<=) nota1 nota2 = sonidoCromatico nota1 <= sonidoCromatico nota2

--6a
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

--7
data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

--7a1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ r) = Just r

--7a2
encolar :: Deportista -> Cola -> Cola
encolar x VaciaC = Encolada x VaciaC
encolar x (Encolada y r) = Encolada y (encolar x r)

--7a3
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC z = Nothing
busca (Encolada y r) z | zonaFutbolista z y == True = Just y 
                       | zonaFutbolista z y == False = busca r z

--7b Cola se asemeja a una lista recursiva, ya que va agregando valores a medida que sea necesario

--8
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b ) deriving Show

--type Diccionario = ListaAsoc String String
--type Padron = ListaAsoc Int String

--8a
--type GuiaTelefonica = ListaAsoc Int String

--8b1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b r) = 1 + la_long r

--8b2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia lista2 = lista2
la_concat (Nodo a b r) lista2 = Nodo a b (la_concat r lista2)

--8b3
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia x y = Nodo x y Vacia
la_agregar (Nodo a b r) x y | x == a = Nodo a y r 
                            | x /= a = Nodo a b (la_agregar r x y)

--8b4
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b r) = (a, b) : la_pares r

--8b5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo x y r) a | x == a = Just y
                        | x /= a = la_busca r a

--8b6
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a (Nodo x y r) | x == a = r
                         | x /= a = Nodo x y (la_borrar a r)

--9
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

type Prefijos = Arbol String
can , cana , canario , canas , cant , cantar , canto :: Prefijos
can = Rama cana "can" cant
cana = Rama canario "a" canas
canario = Rama Hoja "rio" Hoja
canas = Rama Hoja "s" Hoja
cant = Rama cantar "t" canto
cantar = Rama Hoja "ar" Hoja
canto = Rama Hoja "o" Hoja

--9a
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama (arbol1) a (arbol2)) = 1 + a_long (arbol1) + a_long (arbol2)

--9b
a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama arbol1 _ arbol2) = a_hojas arbol1 + a_hojas arbol2

--9c
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama arbol1 a arbol2) = Rama (a_inc arbol1) (a+1) (a_inc arbol2)

arbolEjemplo :: Arbol Int
arbolEjemplo =
    Rama
        (Rama
            (Rama Hoja 3 Hoja)
            2
            (Rama Hoja 4 Hoja))
        1
        (Rama
            (Rama Hoja 6 Hoja)
            5
            (Rama Hoja 7 Hoja))

--9d
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map z Hoja = Hoja
a_map z (Rama arbol1 a arbol2) = Rama (a_map z arbol1) (z a) (a_map z arbol2)

a_inc' :: Num a => Arbol a -> Arbol a
a_inc' Hoja = Hoja
a_inc' arbol = a_map (+1) arbol 

--10a
data ABB a = VacioABB | RamaABB (ABB a) a (ABB a) deriving (Show, Eq)

--10b
insertarABB :: Ord a => a -> ABB a -> ABB a
insertarABB a VacioABB = RamaABB (VacioABB) a (VacioABB)
insertarABB a (RamaABB (arbol1) y (arbol2)) | a < y = (RamaABB (insertarABB a arbol1) y (arbol2))
                                            | a > y = (RamaABB (arbol1) y (insertarABB a arbol2))
                                            | otherwise = (RamaABB (arbol1) y (arbol2))

--10c
buscarEnArbol :: Eq a => a -> ABB a -> Bool
buscarEnArbol a VacioABB = False
buscarEnArbol a (RamaABB (arbol1) y (arbol2)) = a == y || buscarEnArbol a (arbol1) || buscarEnArbol a (arbol2)

--10d

--definimos ambas funciones auxiliares

mayor_a_todos :: Ord a => a -> ABB a -> Bool
mayor_a_todos a VacioABB = True
mayor_a_todos a (RamaABB (arbol1) y (arbol2)) = a > y && mayor_a_todos a (arbol1) && mayor_a_todos a (arbol2)

menor_a_todos :: Ord a => a -> ABB a -> Bool
menor_a_todos a VacioABB = True
menor_a_todos a (RamaABB (arbol1) y (arbol2)) = a < y && menor_a_todos a (arbol1) && menor_a_todos a (arbol2)

--ahora definimos la funcion verificarABB

verificarABB :: Ord a => ABB a -> Bool
verificarABB VacioABB = True
verificarABB (RamaABB (arbol1) a (arbol2)) = mayor_a_todos a (arbol1) && menor_a_todos a (arbol2)

ejemplo1 = RamaABB (RamaABB VacioABB 10 VacioABB)
                    2
                   (RamaABB VacioABB 11 VacioABB)

{--Resultado de ejecutar verificarABB con el ejemplo1
ghci> verificarABB ejemplo1 
False
ghci> 
--}

ejemplo2 = RamaABB
        (RamaABB
            (RamaABB VacioABB 10 VacioABB)
            8
            (VacioABB))
        5
        (RamaABB
            (RamaABB VacioABB 1 VacioABB)
            3
            (RamaABB VacioABB 7 VacioABB))

{--Resultado de ejecutar verificarABB con el ejemplo2
ghci> verificarABB ejemplo2 
False
ghci> 
--}

--Paso a definir dos Arboles ABB a de manera tal que al verificar con la funcion anterior nos den True como resultado

ejemplo3 = RamaABB
            (RamaABB
                (RamaABB VacioABB 4 VacioABB)
                7
                (RamaABB VacioABB 9 VacioABB )
            )
            10
            (RamaABB
                (RamaABB VacioABB 11 VacioABB)
                12
                (RamaABB VacioABB 13 VacioABB)
            )


ejemplo4 = RamaABB
            (RamaABB
                (RamaABB VacioABB 1 VacioABB)
                3
                (RamaABB VacioABB 4 VacioABB )
            )
            5
            (RamaABB
                (RamaABB VacioABB 6 VacioABB)
                7
                (RamaABB VacioABB 10 VacioABB)
            )
