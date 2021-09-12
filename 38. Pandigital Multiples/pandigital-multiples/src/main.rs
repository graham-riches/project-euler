use itertools::Itertools;

fn main() {    
    let pandigitals = vec!['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    for permutation in pandigitals.into_iter().permutations(9) {
        println!("{:?}", permutation);        
        let factors = get_factors(chars_to_int(&permutation));
        println!("{:?}", factors);
        break;
    }
    
}


fn int_to_chars(x: u64) -> Vec<char> {
    let s: Vec<char> = x.to_string().chars().collect();
    s
}

fn chars_to_int(chars: &Vec<char>) -> u64 {
    let num: String = chars.iter().collect();
    let num: u64 = num.parse().unwrap();
    num
}

fn get_factors(n: u64) -> Vec<u64> {
    let vec: Vec<u64> = (1..=n).into_iter().filter(|&x| n % x == 0).collect();
    vec
}
