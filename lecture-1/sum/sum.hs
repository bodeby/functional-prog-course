main :: IO ()
main = do
    putStrLn "Enter a number:"
    n <- readLn
    let result = sum1n n
    putStrLn $ "The sum of numbers from 1 to " ++ show n ++ " is " ++ show result

sum1n :: Int -> Int

sum1n 0 = 0
sum1n n = n + sum1n (n-1)