import Data.Numbers.Primes
import Control.Monad

findPrimeSum ps
	| isPrime sumps = Just sumps
	| otherwise		= findPrimeSum (tail ps) `mplus` findPrimeSum (init ps)
	where
	sumps = sum ps