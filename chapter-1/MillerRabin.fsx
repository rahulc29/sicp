open System
module Prng = 
    let random = Random()
    let RandomInt n = 
        random.Next(n)

let modMul a b modulo =
    ((a * b) % modulo)
let squareMod x modulo = modMul x x modulo
let isEven x = (x % 2 = 0)
let rec expModIter a n product modulo = 
    let handleEven () = 
        let square = squareMod a modulo
        if square = 1 && a <> 1 && a <> (modulo - 1) then 0 
        else square 
    if n = 0 then product 
    elif isEven n then expModIter (handleEven ()) (n / 2) product modulo
    else expModIter a (n - 1) (modMul a product modulo) modulo
    
let expMod a n modulo = 
    expModIter a n 1 modulo

let millerRabinIter n =
    let tryIt a = 
        ((expMod a (n - 1) n) = 1)
    tryIt (Prng.RandomInt n)
    
let rec millerRabin n k = 
    if k = 0 then true
    elif millerRabinIter n then millerRabin n (k - 1)
    else false
    
