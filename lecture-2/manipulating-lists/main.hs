
{-| -------------------------------------------------------------------------
   Lecture 2. Part 2. Functions manipulating lists.
   -------------------------------------------------------------------------- -}

{-|----------------------------------------------------------------------------}
_TODO0_ = []
{-| Exercise 2.1.a.
Implement list of squares of a given list using recursion.  -}
squares :: [Int] -> [Int]
squares l = _TODO0_

{-| Exercise 2.2.
Implement list_map that applies a function f to all elements of the list. -}
list_map :: (t -> a) -> [t] -> [a]
list_map f l = _TODO0_

{-| Exercise 2.3.
Implement list of squares using list_map  -}
squares_map l = _TODO0_

{-| Understand the following definition unfolding
and using it on some simple examples. -}
fold_left :: (t1 -> t2 -> t1) -> t1 -> [t2] -> t1
fold_left f acc [] = acc
fold_left f acc (x:xs) = fold_left f (f acc x) xs

list_length l = fold_left (\a x -> 1 + a) 0 l

list_reverse l = fold_left (\a x -> x:a) [] l

{-| Exercise 2.4.
Implement the sum of squares of a given list using recursion.  -}
squares_sum :: [Int] -> Int
squares_sum l = 0 {-| TODO -}

{-| Exercise 2.5.
Implement list_map using fold_left. -}
list_map' :: (t -> a) -> [t] -> [a]

list_map' f l = _TODO0_

{-| Exercise 2.6.
Implement list_lookup that returns Nothing if there is no binding for the key
and otherwise returns Just v where v is the value associated with the key k. -}
list_lookup :: Eq a => a -> [(a, b)] -> Maybe b

list_lookup a l = Nothing {-| TODO -}

test_l0 = list_lookup 3 [(1,"a"), (2, "b")]
test_l1 = list_lookup 2 [(1,"a"), (2, "b")]



{-| Exercise 2.7.
Implement change_assoc that updates the binding i with the value t in
the association list. If there is no binding for i, it simply adds the
 (i,t) to the association list. -}
change_assoc :: Eq a => a -> b -> [(a, b)] -> [(a, b)]

change_assoc i t l = _TODO0_

test1 = change_assoc 3 "new_val" [(1,"a"), (2, "b")]
test2 = change_assoc 2 "new_val" [(1,"a"), (2, "b")]


{-| Exercise 2.8.
Implement a powerset function that returns all subsets of a given set
represented as a list. -}
powerset :: [a] -> [[a]]
powerset l = [[]]
