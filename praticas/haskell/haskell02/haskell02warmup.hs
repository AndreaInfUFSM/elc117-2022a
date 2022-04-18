{-
  Aquecimento Prática Haskell 02
-}

square :: Int -> Int
square x = x^2
  
squareAll :: [Int] -> [Int]
squareAll lis = map square lis 
   
useHaskell :: String -> String
useHaskell fulano = fulano ++ ", use Haskell!"
   
sejamFelizes :: [String] -> [String]
sejamFelizes pessoas = map useHaskell pessoas
   
doutor :: String -> Bool
doutor nome = (take 2 nome) == "Dr"
   
adulto :: Int -> Bool
adulto idade = idade >= 18
