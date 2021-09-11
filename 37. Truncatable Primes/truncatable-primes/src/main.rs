use primes::{Sieve, PrimeSet};

fn main() {
    let mut pset = Sieve::new();
    let mut count = 0;
    let mut sum = 0;    
    
    let mut iter = pset.iter();

    while count != 11 {        
        match iter.next() {
            None => (),
            Some (x) => {
                let t = is_truncatable_prime(x);
                if t {
                    println!("Is truncatable: {}", x);
                    sum += x;
                    count += 1;
                }
            },   
        }        
    }
    println!("Sum value: {}", sum);
}


fn is_truncatable_prime(x: u64) -> bool {
    if x <= 7 {
        return false;
    }
    let chars = int_to_chars(x);
    let lt = left_truncatable(&chars);
    let rt = right_truncatable(&chars);    
    lt && rt
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

fn left_truncatable(chars: &Vec<char>) -> bool {
    if chars.len() == 1 {
        primes::is_prime(chars_to_int(chars))
    } else {
        let (_, tail) = chars.split_at(1);
        if !primes::is_prime(chars_to_int(&tail.to_vec())) {
            false
        } else {
            left_truncatable(&tail.to_vec())        
        }        
    }
}

fn right_truncatable(chars: &Vec<char>) -> bool {    
    if chars.len() == 1 {
        primes::is_prime(chars_to_int(chars))
    } else {
        let (head, _) = chars.split_at(chars.len() -1);
        if !primes::is_prime(chars_to_int(&head.to_vec())) {
            false
        } else {
            right_truncatable(&head.to_vec())        
        }
    }
}
