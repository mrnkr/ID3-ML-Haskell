{-# OPTIONS_GHC -fno-warn-tabs #-}
{-#LANGUAGE GADTs, EmptyDataDecls, EmptyCase #-}

module ID3 where
  import Datos
  import Auxiliares
    
  data ArBin a b where {Hoja :: b -> ArBin a b ; Nodo :: a -> (ArBin a b) -> (ArBin a b) -> (ArBin a b) }
    deriving Show
    
  type ArDec = ArBin Atributo Clase

  --12
  splice1 :: Eq a => a -> [a] -> [a]
  splice1 = \p -> \ls -> case ls of {
    [] -> [];
    x : xs -> case (p == x) of {
      True -> xs;
      False -> x : (splice1 p xs)
    }
  }

  id3 :: [Registro] -> [Atributo] -> Clase -> ArDec
  id3 = \rs -> \ats -> \c -> case rs of {
    [] -> Hoja c;
    x : xs -> case (partAtr (minAtr ats rs) rs) of {
        (l, r) -> Nodo (minAtr ats rs) (id3 l (splice1 (minAtr ats rs) ats) c) (id3 r (splice1 (minAtr ats rs) ats) c)
      }
  }

  --13
  arbol :: ArDec
  arbol = undefined
  --14
  clasificar :: ArDec -> (Nombre,[Bool]) -> (Nombre,Clase)
  clasificar = undefined
  clasificacion :: [(Nombre,Clase)]
  clasificacion = undefined


