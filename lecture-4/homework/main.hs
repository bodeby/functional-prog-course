{------------------------------------------------------------------------------}
{-------------------------------- Lecture 4. Part 1 ---------------------------}
{------------------------------------------------------------------------------}

{---------------------------------------}
 -- 1. List Generators 
{---------------------------------------}

gen10 = [1..10]
-- [1,2,3,4,5,6,7,8,9,10]

genAZ = ['a'..'z']
-- abcdefghijklmnopqrstuvwxyz

genf :: Enum a => a -> a -> [a]
genf x y = [x..y]

-- No instance for (Enum String) arising from a use of ‘genf’
-- genv = genf "a" "x"

{---------------------------------------}
 -- 2. List Comprehensions
{---------------------------------------}

fid :: [a] -> [a]
fid xs = [ x | x <- xs ]

v1 = fid [1,2,4,8]
--[1,2,4,8]

bin7  = [ 1 | x <- [1..3] ]
-- [1,1,1]

bin15 = [ 1 | _ <- [1..4] ]
-- [1,1,1,1]

--  Variable not in scope: y
-- f_wrong1 xs = [ y | x <- xs ]

onesN n = [ 1 | _ <- [1..n] ]
vn1 = onesN 10
-- [1,1,1,1,1,1,1,1,1,1]

replN n = [ n | _ <- [1..n] ]
vn3 = replN 10
-- [10,10,10,10,10,10,10,10,10,10]

fstsN n = [ x | x <- [1..n] ]
vn2 = fstsN 10
-- [1,2,3,4,5,6,7,8,9,10]


nilsN n = [ [] | x <- [1..n] ]
vn4 = nilsN 10
-- [[],[],[],[],[],[],[],[],[],[]]

eltsN n = [ [x] | x <- [1..n] ]
vn5 = eltsN 10
-- [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]


-- We can also use several generators and nested comprehensions

eltsNM m = [ (k,l) | k <- [1..m], l <- [k..m] ]
vnm = eltsNM 3
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


replL xs = [[ y | y <- xs ] | _ <- xs ]
rl = replL [1,2,3]
-- [[1,2,3],[1,2,3],[1,2,3]]

rfL m = [ [ (k,l) | l <- [k..m] ] | k <-[1..m] ]
-- [[(1,1),(1,2),(1,3)],[(2,2),(2,3)],[(3,3)]]

replL' m = concat (rfL m)
rl' = replL' 3
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


{---------------------------------------}
 -- 3. Guards
{---------------------------------------}

evenN n = [x | x <- [1..n], (x `mod` 2 == 0)]

gv1 = evenN 12
-- [2,4,6,8,10,12]

eltsNM' m = [ (x,y) | x <- [1..m], y <- [1..m], x <= y  ]
vnm' = eltsNM' 3
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


factors_ n = [x | x <- [1..n], n `mod` x == 0]
factors__ n = [x | x <- [1..(n `div` 2)]++[n], n `mod` x == 0]
-- factors__ 0
-- Exception: divide by zero

factors n =
  if n == 0 then error "Div by Zero"
  else  [x | x <- [1..(n `div` 2)]++[n], n `mod` x == 0]

gv28 = factors 28
--  [1,2,4,7,14,28]

gv13 = factors 13
--  [1,13]

is_prime n = factors n == [1,n]

p93 = is_prime 93
-- False

primes n = [x | x <- [2..n], is_prime x]
pr40 = primes 40
-- [2,3,5,7,11,13,17,19,23,29,31,37]

{---------------------------------------}
 -- 3. Back to generic lists 
{---------------------------------------}

copyL :: [t] -> [[t]]
copyL xs = [ xs | _ <- xs ]
vc1 = copyL [('a', 8), ('b',34)]
-- [[('a',8),('b',34)],[('a',8),('b',34)]]

-- returns the list of all values that are associated with
-- a given key in a table can be defined as follows
findI :: Eq a => a -> [(a,b)] -> [b]
findI k t = [v | (k', v) <- t, k == k']
fv = findI 'b' [('a',1),('b',2),('c',3),('b',4)]
-- [2,4]

-- returns the list of all positions at which a value occurs in a list,
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x',i) <- zip xs [0..(length xs)], x == x']
vp = positions False [True, False, True, False]
-- [1,3]

vz = zip ['a','b','c'] [1,2,3]
-- [('a',1),('b',2),('c',3)]

{------------------------------------------------------------------------------}
{-------------------- Homework Exercises Part 1. ------------------------------}
{------------------------------------------------------------------------------}

-- Exercise 5.7.1
sqrs_sum = sum [ (x*x) | x <- [1..100]] 
-- 338350

-- Exercise 5.7.2
grid n m = [(x,y) | x <- [0..n], y <- [0..m]]

grid12 = grid 1 2
-- [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]

-- Exercise 5.7.3
square n = [(y,z) | (y,z) <- grid n n, y /= z ] 

square2 = square 2
-- Exercise [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]

-- Exercise 5.7.7
{-
Show how the list comprehension [(x,y) | x <- [1,2], y <- [3,4]] with two
generators can be re-expressed using two comprehensions with single generators.
Hint: nest one comprehension within the other and make use of the library
function concat :: [[a]] -> [a]. -}
c =  [(x,y) | x <- [1,2], y <- [3,4]]
-- [(1,3),(1,4),(2,3),(2,4)]

-- wrong
attempt1 = [[y | y <- [3,4]] | _ <- [1,2]]
-- [[3,4],[3,4]]

-- almost
attempt2 = [ [(x,y) | y <- [3,4]]  | x <- [1,2]]
-- [[(1,3),(1,4)],[(2,3),(2,4)]]

-- works
attempt3 = Prelude.concat [[(x,y) | y <- [3,4]] | x <- [1,2]]
-- [(1,3),(1,4),(2,3),(2,4)]

-- just rewriting
apply_fx f = [ f x  | x <- [1,2]]
attempt2bis = apply_fx (\x -> [(x,y) | y <- [3,4]])
-- [[(1,3),(1,4)],[(2,3),(2,4)]]

-- 5.7.9

-- wrong
scalarproduct_attempt1 l1 l2 = sum [ x*y | x <- l1, y <- l2]
-- scalarproduct_attempt1 [1,2,3] [4,5,6] = 90 

-- works
scalarproduct l1 l2 = sum [ x*y | (x,y) <- zip l1 l2]
sp32 = scalarproduct [1,2,3] [4,5,6]
-- scalarproduct [1,2,3] [4,5,6] = 32


{------------------------------------------------------------------------------}
{------------------------  More Examples Part 1. ------------------------------}
{------------------------------------------------------------------------------}

-- Example 1: Checks if the number is perfect
isPerfectNum :: Integral a => a -> Bool
isPerfectNum n = (sum (factors n) - n) == n

ip28 = isPerfectNum 28
-- sum [1,2,4,7,14] = 28

-- Exercise 2: Generate first N prime numbers, ex. first 15 prime numbers are
-- [2,3,5,7,11,13,17,19,23,29,31,37].

fst_primes_aux l n m res =
    if length res == l then res
    else
      if length res < l 
      then
        let ps = [x | x <- [n..m], is_prime x]
        in fst_primes_aux l (m+1) (2*m + 1 - n) (res++ps)
      else take l res

fst_primes l = fst_primes_aux l 1 100 []
--[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]


fprs15 = fst_primes 15
-- [2,3,5,7,11,13,17,19,23,29,31,37]
