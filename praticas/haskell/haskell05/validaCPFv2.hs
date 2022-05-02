{-
   Programa em Haskell para validar os digitos de um CPF
   Mais info em: http://pt.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas
-}
import Data.Char
 
  
cpfDV :: [Int] -> [Int] -> Int
cpfDV digits mults = if expr < 2 then 0 else 11-expr
  where expr = (sum $ zipWith (*) digits mults) `mod` 11
      
cpfValid :: [Int] -> Bool
cpfValid cpf =
  let digits = take 9 cpf
      dv1 = cpfDV digits [10,9..]
      dv2 = cpfDV (digits ++ [dv1]) [11,10..]
   in dv1 == cpf !! 9 && dv2 == cpf !! 10


main :: IO()
main = do
  putStr "Digite o CPF:"
  cpf <- getLine
  let digitos = (map digitToInt cpf)
  putStrLn (if cpfValid digitos then "CPF valido" else "CPF invalido")
  


