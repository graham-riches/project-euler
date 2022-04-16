use primes::{Sieve, PrimeSet};
use std::collections::HashSet;
use std::hash::Hash;
const MAX_PANDIGITAL: u32 = 987654321;


fn main() {
    let mut pset = Sieve::new();    
    let mut max = 0;
    for (_, i) in pset.iter().enumerate().take_while( |(_, x)| x <= &(MAX_PANDIGITAL as u64)) {
        if is_pandigital(i as u32) {
            if primes::is_prime(i) {
                max = i;
                println!("Pandigital Prime: {}", i);
            }
        }                
    }           
    println!("Max pandigital prime: {}", max);     
}

fn is_pandigital(x: u32) -> bool {
    let chars = int_to_chars(x);
    let mut pandigital_set: HashSet<char> = HashSet::new();
    (1..=chars.len() as u32).into_iter().all(
        |x| -> bool {
            match char::from_digit(x, 10) {
                Some(x) => pandigital_set.insert(x),
                None => false
            }
        });    
    let number_set: HashSet<char> = chars.iter().cloned().collect();
    let diff = pandigital_set.difference(&number_set);
    has_unique_elements(chars) && diff.count() == 0
}

fn int_to_chars(x: u32) -> Vec<char> {
    let s: Vec<char> = x.to_string().chars().collect();
    s
}

fn has_unique_elements<T>(iter: T) -> bool
where
    T: IntoIterator,
    T::Item: Eq + Hash,
{
    let mut unique = HashSet::new();
    iter.into_iter().all(move |x| unique.insert(x))
}