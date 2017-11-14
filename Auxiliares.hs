{-# OPTIONS_GHC -fno-warn-tabs #-}
module Auxiliares where
  import Datos
    
  --1
  atributos :: [Atributo]
  atributos = [toEnum 0 ..]

  -- fromEnum Fiebre = 0
  -- fromEnum Moco = 1
  -- fromEnum Rubor = 2
  -- fromEnum DolorArtic = 3
  -- fromEnum DolorCabeza = 4

  clases :: [Clase]
  clases = [toEnum 0 ..]

  -- fromEnum Enfermo = 0
  -- fromEnum Sano = 1
  -- fromEnum Incubando = 2

  --2
  clase :: Nombre -> [Registro] -> Clase
  clase = \n -> \r -> case r of {
    [] -> Sano;
    x : xs -> case x of {
      (a,b,c) -> case (a == n) of {
        True -> b;
        False -> clase n xs
      }
    }
  }

  --3
  valorAtr :: Atributo -> Registro -> Bool
  valorAtr = \a -> \r -> case r of {
    (x,y,z) -> z !! (fromEnum a)
  }
  --4
  regsAtrB :: Atributo -> Bool -> [Registro] -> [Registro]
  regsAtrB = \a -> \v -> \rs -> case rs of {
    [] -> [];
    x : xs -> case ((valorAtr a x) == v) of {
      True -> x : regsAtrB a v xs;
      False -> regsAtrB a v xs
    }
  }

  --5	
  regsClase :: Clase -> [Registro] -> [Registro]
  regsClase = \c -> \rs -> case rs of {
    [] -> [];
    x : xs -> case x of {
      (a,b,d) -> case (b == c) of {
        True -> x : regsClase c xs;
        False -> regsClase c xs
      }
    }
  }

  --6
  -- inter es la interseccion de dos listas
  inter :: Eq a => [a] -> [a] -> [a]
  inter = \ls -> \ly -> case ls of {
    [] -> [];
    x : xs -> case (elem x ly) of {
      True -> x : (inter xs ly);
      False -> inter xs ly
    }
  }

  prop :: Clase -> Atributo -> [Registro] -> Float
  prop = \c -> \a -> \rs -> case rs of {
    [] -> 0.0;
    x : xs -> (fromIntegral (length (inter (regsAtrB a True rs) (regsClase c rs))) / fromIntegral (length (regsClase c rs)))
  }

  --7
  entrAtrClase :: Clase -> Atributo -> [Registro] -> Float
  entrAtrClase = \c -> \a -> \rs -> case rs of {
    [] -> 0.0;
    x : xs -> case (prop c a rs) == 0 of {
      True -> 0.0;
      False -> prop c a rs * log(prop c a rs)
    }
  }

  --8
  entrAtr :: [Atributo] -> [Registro] -> Atributo -> Float
  entrAtr = \ats -> \rs -> \a -> case (elem a ats) of {
    True -> case rs of {
      [] -> 0.0;
      x : xs -> - sum (map (\x -> entrAtrClase x a rs) clases)
    };
    False -> 1.0
  }

  --9
  minAtr :: [Atributo] -> [Registro] -> Atributo
  minAtr = \ats -> \rs -> case ats of {
    [] -> error "Manda atributos";
    x : xs -> case ((minimum (map (entrAtr atributos rs) ats)) == entrAtr atributos rs x) of {
      True -> x;
      False -> minAtr xs rs
    }
  }

  --10				
  partAtr :: Atributo -> [Registro] -> ([Registro],[Registro])
  partAtr = \a -> \rs -> ((regsAtrB a False rs), (regsAtrB a True rs))

  --11
  -- Retorna el indice del elemento en la lista
  indexOf :: Eq a => a -> [a] -> Int
  indexOf = \e -> \ls -> case ls of {
    [] -> -1;
    x : xs -> case (x == e) of {
      True -> 0;
      False -> indexOf e xs + 1
    }
  }

  maxClase :: [Registro] -> Clase
  maxClase = \rs -> toEnum (indexOf (maximum (map (\x -> length (regsClase x rs)) clases)) (map (\x -> length (regsClase x rs)) clases))

  ocurrencias :: [Registro] -> [(Clase,Int)]
  ocurrencias = \rs -> map (\x -> (toEnum (indexOf x (map (\x -> length (regsClase x rs)) clases)), x)) (map (\x -> length (regsClase x rs)) clases)
