{-# OPTIONS_GHC -fno-warn-tabs #-}
{-#LANGUAGE GADTs, EmptyDataDecls, EmptyCase #-}

-- @author Alvaro Nicoli - 220159 - Universidad ORT
-- @author Noela Pence - 201375 - Universidad ORT

module ID3 where
  import Datos
  import Auxiliares
    
  data ArBin a b where {Hoja :: b -> ArBin a b ; Nodo :: a -> (ArBin a b) -> (ArBin a b) -> (ArBin a b) }
    deriving Show
    
  type ArDec = ArBin Atributo Clase

  --12
  -- Remueve un elemento de una lista
  splice1 :: Eq a => a -> [a] -> [a]
  splice1 = \p -> \ls -> case ls of {
    [] -> [];
    x : xs -> case (p == x) of {
      True -> xs;
      False -> x : (splice1 p xs)
    }
  }

  id3 :: [Registro] -> [Atributo] -> Clase -> ArDec
  id3 = \rs -> \ats -> \c -> case (length rs) == 0 of {
    True -> Hoja c;
    False -> case ((length ats) == 0) || (((length (regsClase (maxClase rs) rs)) == (length rs))) of {
      True -> Hoja (maxClase rs);
      False -> case (partAtr (minAtr ats rs) rs) of {
        (l, r) -> Nodo (minAtr ats rs) (id3 l (splice1 (minAtr ats rs) ats) (maxClase rs)) (id3 r (splice1 (minAtr ats rs) ats) (maxClase rs))
      }
    }
  }

  --13
  arbol :: ArDec
  arbol = id3 ejs atributos (maxClase ejs)

  --14
  clasificar :: ArDec -> (Nombre,[Bool]) -> (Nombre,Clase)
  clasificar = \arb -> \dta -> case dta of {
    (l, r) -> case arb of {
      Hoja c -> (l, c);
      Nodo atr br1 br2 -> case (r !! (fromEnum atr)) of {
        True -> clasificar br2 dta;
        False -> clasificar br1 dta
      }
    }
  }

  clasificacion :: [(Nombre,Clase)]
  clasificacion = map (clasificar arbol) tests
