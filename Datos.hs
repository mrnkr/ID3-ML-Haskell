{-# OPTIONS_GHC -fno-warn-tabs #-}
module Datos where

	data Atributo = Fiebre | Moco | Rubor | DolorArtic | DolorCabeza
		deriving (Eq,Ord,Enum,Show)
			
	data Clase = Enfermo | Sano | Incubando
		deriving  (Eq,Ord,Enum,Show)
		
	type Nombre = String
		
	type Registro = (Nombre,Clase,[Bool])
	type Datos = [Registro]

	ejs :: Datos
	ejs = [ ("Diego",Enfermo,[True,True,True,True,True]),
			("Juan",Sano,[False,False,False,False,False]),
			("Manuela",Incubando,[False,True,True,False,True]),
			("Nora",Sano,[False,True,False,False,True]),
			("JPablo",Enfermo,[True,True,False,False,True]),
			("Lucia",Enfermo,[True,False,False,False,True]),
			("Valeria",Enfermo,[True,False,False,True,False]),
			("Joaquin",Enfermo,[False,True,False,True,False])]

	-- el resultado de arDec deberá ser:
	-- Nodo Fiebre (Nodo Rubor (Nodo DolorCabeza (Nodo DolorArtic (Hoja Sano) (Hoja Enfermo)) (Hoja Sano)) (Hoja Incubando)) (Hoja Enfermo)
	-- Pasa la prueba
		
		
	tests :: [(Nombre,[Bool])]
	tests = [("Mauricio",[False,True,True,False,True]),
			("Federico",[False,False,False,False,True]),
			("Igor",[False,True,False,True,True]),
			("Bruno",[True,True,False,False,False]),
			("Ignacio",[False,True,False,True,False])]
			
	-- la clasificacion de estos tests deberá ser:
	-- [("Mauricio",Incubando),("Federico",Sano),("Igor",Enfermo),("Bruno",Enfermo),("Ignacio",Enfermo)]
	-- Pasa la prueba

	-- Ejemplo de atributos sacados de fotos de superheroes de Batman

{-data Atributo = Hombre | Mascara | Capa | Corbata | Orejas | Fumador
	deriving  (Eq,Ord,Enum,Show)
	
data Clase = Bueno | Malo
	deriving  (Eq,Ord,Enum,Show)

type Nombre = String

type Registro = (Nombre,Clase,[Bool])


ejs :: [Registro]
ejs = [ ("batman",Bueno,[True,True,True,False,True,False]),
	("batichica",Bueno,[False,True,True,False,True,False]),
	("robin",Bueno,[True,True,True,False,False,False]),
	("alfred",Bueno,[True,False,False,True,False,False]),
	("pinguino",Malo,[True,False,False,True,False,True]),
	("gatubela",Malo,[False,True,False,False,True,False]),
	("guason",Malo,[True,False,False,False,False,False])]

-- arDec = Nodo Capa (Nodo Hombre (Hoja Malo) (Nodo Mascara (Nodo Orejas (Nodo Corbata (Hoja Malo) (Nodo Fumador (Hoja Bueno) (Hoja Malo))) (Hoja Malo)) (Hoja Malo))) (Hoja Bueno)
-- Pasa la prueba

tests :: [(Nombre,[Bool])]
tests = [("acertijo",[True,True,False,False,False,False]),
	 ("mujermaravilla",[False,False,True,False,True,False])]

-- clasificacion = [("acertijo",Malo),("mujermaravilla",Bueno)]
-- Pasa la prueba
-}

{-data Atributo = Humedad | Frio | SolFuerte | Viento 
	deriving (Eq,Ord,Enum,Show)
	
data Clase = Juego | NoJuego
	deriving (Eq,Ord,Enum,Show)

type Nombre = String

type Registro = (Nombre,Clase,[Bool])
type Datos = [Registro]

ejs :: Datos
ejs = [ ("lunes1",NoJuego,[True,False,True,False]),
	("martes2",NoJuego,[True,False,True,True]),
	("miercoles3",Juego,[True,False,True,False]),
	("jueves4",Juego,[False,True,True,False]),
	("viernes5",Juego,[False,True,False,False]),
	("sabado6",NoJuego,[False,True,False,True]),
	("domingo7",Juego,[True,True,False,True]),
	("lunes8",NoJuego,[True,True,True,False]),
	("martes9",Juego,[True,True,False,False]),
	("miercoles10",Juego,[False,True,False,False]),
	("jueves11",Juego,[True,True,False,True]),
	("viernes12",NoJuego,[True,True,True,True]),
	("sabado13",Juego,[True,False,False,False]),
	("domingo14",NoJuego,[False,True,True,True])]

-- arDec = Nodo Frio (Nodo Humedad (Hoja Juego) (Nodo SolFuerte (Hoja Juego) (Nodo Viento (Hoja Juego) (Hoja NoJuego)))) (Nodo SolFuerte (Nodo Humedad (Nodo Viento (Hoja Juego) (Hoja NoJuego)) (Hoja Juego)) (Nodo Humedad (Nodo Viento (Hoja Juego) (Hoja NoJuego)) (Hoja NoJuego)))
-- Pasa la prueba

tests :: [(Nombre,[Bool])]
tests = [("lunes15",[False,True,True,False]),
	("martes16",[True,True,True,False])]
	
-- clasificacion = [("lunes15",Juego),("martes16",NoJuego)]\
-- Pasa la prueba
-}
