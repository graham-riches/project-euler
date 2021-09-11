// Learn more about F# at http://fsharp.org

open System

let rec toDigits number = 
    number / 10, number % 10


[<EntryPoint>]
let main argv =
    96 |> toDigits |> fst |> printfn "%d"
    0 // return an integer exit code
