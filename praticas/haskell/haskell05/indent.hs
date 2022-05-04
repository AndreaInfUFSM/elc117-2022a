-- https://en.wikibooks.org/wiki/Haskell/Indentation
-- GHC versions: 8.6.5

cond1 arg = if arg > 0 then "positive" else "not positive"

cond2 arg = 
  if arg > 0 
    then "positive" 
    else "not positive"
    
cond3 arg = 
  if arg > 0 
  then "positive" 
  else "not positive"
  
-- it works, even mixing 2-spaces and 4-spaces indents
cond4 arg =
  if arg > 0 
      then "positive" 
      else "not positive"
     
cond5 arg =
  if arg > 0 then "positive" 
  else "not positive"

-- it also works
cond6 arg =
  if arg > 0 then "positive" 
    else "not positive"
    
-- surprisingly, it also works!
cond7 arg =
      if arg > 0 
 then "positive" 
 else "not positive"

-- surprisingly, it also works!
cond8 arg =
      if arg > 0 then "positive" 
 else "not positive"

-- surprisingly, it also works!
-- see: https://stackoverflow.com/questions/46146029/violation-of-haskell-indentation-rules-for-if-then-else
cond9 arg = if arg > 0 
then "positive" 
   else "not positive"
 
-- this doesn't work
{--
  cond10 arg = if arg > 0 then "positive"  else "not positive"
--}

{--
-- This does not work
guardsInLet1 :: Int -> Int -> Int
guardsInLet1 a b =
    let 
        x = 512
    in
        | a >= x     = 1
        | a == b     = 2
        | otherwise  = 3

--}

-- This works
guardsInLet2 :: Int -> Int -> Int
guardsInLet2 a b =
    let 
        x = 512
        expr
            | a >= x     = 1
            | a == b     = 2
            | otherwise  = 3
    in
        expr
        

