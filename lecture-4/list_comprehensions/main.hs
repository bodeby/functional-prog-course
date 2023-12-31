
{------------------------------------------------------------------------------}
{------------------------------  Exercises: -----------------------------------}
{------------------------------------------------------------------------------}


-- Exercise 0: generate a powerset of the set represented by list l, e.g.
-- powerset [1,2,3] = [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]

powerset :: [a] -> [[a]]
powerset l = undefined

v0 = powerset [1,2,3]
-- [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]


-- Exercise 1: generate lists whose elements are consecutive first N numbers
-- in decreasing order, e.g. genN 3 = [3,2,1,0].
-- NB: do not use 'reverse' function.
genN :: (Num a, Enum a) => a -> [a]

genN n = undefined
v1 = genN 3
-- [3,2,1,0]

-- Exercise 2: generate all prefixes of the list [0, 1, .., n], e.g.
-- genPrefixesN 5 = [[],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
genPrefixesN :: (Num a, Enum a) => a -> [[a]]

genPrefixesN n = undefined
v2 = genPrefixesN 5
-- [[],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]

-- Exercise 3:  generate all suffixes of the list [0, 1, .., n], e.g.
-- genSuffixesN 5 = [[],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
genSuffixesN :: (Num a, Enum a) => a -> [[a]]

genSuffixesN n = undefined
v3 = genSuffixesN 5
-- [[1,2,3,4,5],[2,3,4,5],[3,4,5],[4,5],[5]]


-- Exercise 4: generate all prefixes of a given list 
-- genPrefixex "haskell" = ["","h","ha","has","hask","haske","haskel","haskell"]
genPrefixes :: [a] -> [[a]]

genPrefixes l = undefined

v4 = genPrefixes "haskell"
-- ["","h","ha","has","hask","haske","haskel","haskell"]


-- Exercise 5: generate all suffixes of a given list 
-- genSuffixes "haskell" = ["haskell","askell","skell","kell","ell","ll","l",""]
genSuffixes :: [a] -> [[a]]

genSuffixes l = undefined

-- Exercise 6: generate all common prefixes of the two lists
-- e.g. commun_prefixes "haskell" "husky"
commun_prefixes :: (Eq a) => [a] -> [a] -> [[a]]
commun_prefixes l1 l2 = undefined

v5 = commun_prefixes "haskell" "husky"
-- ["","h"]

-- Exercise 7:  generate all sublists of a given list 
{- e.g. genSubs "haskell" =
 ["h","ha","has","hask","haske","haskel","haskell","a","as","ask","aske",
   "askel","askell","s","sk","ske","skel","skell","k","ke","kel","kell",
   "e","el","ell","ll","l"] -}
genSubs :: Eq a => [a] -> [[a]]

genSubs l = undefined

v6 = genSubs "haskell"
{- e.g. genSubs "haskell" =
 ["h","ha","has","hask","haske","haskel","haskell","a","as","ask","aske",
   "askel","askell","s","sk","ske","skel","skell","k","ke","kel","kell",
   "e","el","ell","ll","l"] -}

     
--Exercise 9: find all common sublists of two lists
common_subs :: Eq a => [a] -> [a] -> [[a]]


common_subs l1 l2 = undefined

v7 = common_subs "haskell" "ask"
-- ["a","as","ask","s","sk","k"]

