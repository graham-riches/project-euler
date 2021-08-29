use primes::{Sieve, PrimeSet};

fn main() {
    let mut pset = Sieve::new();
    let mut count = 0;
    for (_ix, n) in pset.iter().enumerate().take_while(|&(_i, x)| x <= 1_000_000) {
        let mut s: Vec<char> = n.to_string().chars().collect();
        let mut all_prime = true;
        for _i in 0..s.len() {
            s.rotate_left(1);
            let new_num: String = s.iter().collect(); 
            let new_num: u64 = new_num.parse().unwrap();
            if !primes::is_prime(new_num) {
                all_prime = false;
                break;
            }
        }
        if all_prime {
            println!("Circular Prime: {}", n);
            count += 1;
        }
    }
    println!("Total circular primes: {}", count);
}
