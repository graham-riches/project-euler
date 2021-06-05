open System

let digits = [2..1000]

let rec getFractionalCycles count remainders numerator denominator = 
    let root = int (numerator / denominator)
    let remainder = numerator % denominator
    if List.exists ((=) remainder) remainders then
        count
    else
        let newRemainders = remainder::remainders
        match root with
        | 0 -> getFractionalCycles (count+1) newRemainders (10*numerator) denominator 
        | _ ->
            match remainder with
            | 0 -> count
            | _ -> getFractionalCycles (count + 1) newRemainders (remainder*10) denominator 

let m = 
    digits 
    |> List.map (getFractionalCycles 0 [] 1)
    |> List.zip digits
    |> List.maxBy snd


printfn "Max recurring value: 1/%d length: %d" (fst m) (snd m)
