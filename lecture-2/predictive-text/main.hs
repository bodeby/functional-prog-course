import Data.Maybe

{-| -------------------------------------------------------------------------
   Lecture 2. Part 3. T9 Predictive Text
   Based on the materials from J.C.Filliâtre Compilers lecture
    https://www.lri.fr/~filliatr/ens/compil/
   ------------------------------------------------------------------------- -}



{-| The T9 mode of mobile phones makes it easier to enter text on keyboards:
instead of tapping a key several times to scroll through the letters, a single
keystroke is enough and the phone automatically suggests the words that
correspond to the sequence of keys that have just been typed, from a dictionary
that it has in memory.

-------------------------
|       |  ABC  |  DEF  |
|   1   |   2   |   3   |
-------------------------
|  GHI  |  JKL  |  MNO  |
|   4   |   5   |   6   |
-------------------------
| PQRS  |  TUV  | WXYZ  |
|   7   |   8   |   9   |
-------------------------
|       |       |       |
|   *   |   0   |   #   |
-------------------------
For example, by successively typing the keys 8, 6, 4, 2, 6, 7 and 6 you would
obtain the word "unicorn". It is possible for a sequence of keys to correspond
to several words  Thus, the sequence 6, 6, 6 and 6 corresponds to the words
"mono","noon",and "moon".

The goal of this exercise is to program an efficient solution for finding
dictionary words that match a keystroke. To do this, we will represent the
dictionary by a digital tree data structure, or a Trie.

In a trie, each branch is labeled by the number of a telephone key and each
node by the words of the dictionary corresponding to the sequence of keys
leading from the root of the tree to this node.

For example, the tree that we obtain for the small computer dictionary
composed of the words {hd, if, in, get, to, void, unit} is the following:

                        {}
                       /  \
 		     4/    \8
  		     /      \
		   {}        {}
		  /  \        \
		6/    \3       \6
		/      \        \
	      {in}   {if,hd}    {to}
	                |        |
			|8       |4
			|        |
		      {get}     { }
		               /   \
			     3/     \8
			     /       \
			  {void}    {unit}

-}

{-| To represent such a digital tree, we define the following type in Haskell: -}

data Trie = Trie { wordlist :: [String], branches :: [(Int, Trie)] }

{-| ie each node of the tree is a record where the words field contains the list
of words corresponding to this node and where the branches field is a list
of pairs associating digital trees with integers
(this is precisely called an association list ).

To access fields, we can just use functional application, i.e. for a value
(t :: Trie) we can write (branches t) :: [(Int, Trie)].

To obtain a value where a field is updated, we can use the following syntax:

 t { wordlist = ["a"] }
 t { wordlist = "a":(wordlist t) }

so that we have for instance

wordlist (empty {wordlist = "a":(wordlist empty)}) == ["a"]. -}


{-|----------------------------------------------------------------------------}
{-| Copy here the implementations for the functions from the previous part so
    that we can use them to implement T9 -}

_TODO0_ = []

list_map :: (t -> a) -> [t] -> [a]
list_map f l = _TODO0_

fold_left :: (t1 -> t2 -> t1) -> t1 -> [t2] -> t1
fold_left f acc l = acc -- TODO

list_lookup :: Eq a => a -> [(a, b)] -> Maybe b
list_lookup a l = Nothing


change_assoc :: Eq t1 => t1 -> t2 -> [(t1, t2)] -> [(t1, t2)]
change_assoc i t l = _TODO0_

{-|----------------------------------------------------------------------------}

{-|  Here is the value corresponding to the empty dictionary. -}

empty :: Trie
empty = Trie { wordlist = [], branches = [] }

_TODO1_ = empty

{-| Exercise 3.1. Define 't' corresponding to the dictionary {a, at, as, cv}  -}

t :: Trie
t = _TODO1_


{-| Exercise 3.2.
Write a 'key' function which associates the lowercase letters
of the alphabet with the corresponding number on the keyboard of a mobile phone.
For any other character return -1. -}
key :: Char -> Int

key c = -1 {-| TODO -}


{-| Exercise 3.3.
Write a 'find' function returning the list of words stored
in the node designated by the list of integers passed as an argument. -}
find_trie :: Trie -> [Int] -> [String]

find_trie t il = _TODO0_


{-| Exercise 3.4.
Write an 'add' function adding a word to the dictionary,
the list of integers corresponding to the word being passed as an argument.
Use the 'change_assoc' from above. -}
add :: Trie -> String -> [Int] -> Trie

add t s il = _TODO1_


{-| Exercise 3.5.
Write a function 'intlist_of_string' which converts a word into the list of integers
corresponding to its entry on the telephone keyboard. Write two variants, one using
recursion, and one using 'map' function. -}
intlist_of_string :: String -> [Int]

intlist_of_string s = _TODO0_

intlist_of_string' :: String -> [Int]
intlist_of_string' s = _TODO0_

{-| Exercise 3.6.
Write a function 'add_word' adding a word in the T9 dictionary. -}
add_word :: Trie -> String -> Trie

add_word t w = _TODO1_

{-| Exericse 3.7.
Construct the dictionary dict_t corresponding to the following list of words.
-}

dict = ["lex", "key", "void", "caml", "camk", "unix", "for", "while", "done",
  "let", "fold", "val", "exn", "rec", "else", "then", "type",
  "try", "with", "to", "find", "do", "in", "if", "hd", "tl",
  "iter", "map", "get", "copy", "and", "as", "begin", "class",
  "downto", "end", "exception", "false", "fun", "function",
  "match", "mod", "mutable", "open", "or", "true", "when",
  "load", "mem", "length", "bash", "unit", "site", "php", "sql",
  "ssh", "spam", "su", "qt", "root", "bsd", "boot", "caml", "bash",
  "ocaml", "kde", "gtk", "gcc", "haskell", "silver", "unicorn"]

dict_t :: Trie
dict_t = _TODO1_

-- ["unicorn"]
t0 = (find_trie dict_t [8, 6, 4, 2, 6, 7, 6])

{-| Exericse 3.8.
Construct the dictionary dict_t from a given list of strings. -}
make_dict :: [String] -> Trie
make_dict l = _TODO1_


{-| ------------------------------------------------------------------------- -}
{-| Main function for testing -}
{-| ------------------------------------------------------------------------- -}

{-|
  Input:  6 6 6 6
  Output: ["mono","noon","moon"]
-}
main = do
  l <- readFile "dictionary.txt"
  let ls = lines l
  let dc = make_dict ls
  x <- map read . words <$> getLine
  print (find_trie dc x)
