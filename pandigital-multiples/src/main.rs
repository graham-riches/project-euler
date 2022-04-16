use std::{collections::HashSet};
const MAX_PANDIGITAL: u64 = 987654321;
const MAX_ITERATION: u64 = 493827161;

fn main() {
    let mut number = 1;
    while number < MAX_ITERATION {
        if let Some(x) = find_pandigital_multiple(number) {
            println!("Pandigital for {} is {}", number, x);
        }
        number += 1;
    }
}


fn is_pandigital(num: u64) -> bool {
    let mut set: HashSet<u64> = HashSet::new();    
    let unique = num.to_string()
        .chars()
        .map(|x| x.to_digit(10).unwrap() as u64)
        .fold(true, |acc, x| acc & set.insert(x));
    set.len() == 9 && unique
}

fn find_pandigital_multiple(num: u64) -> Option<u64> {
    let mut multiple = num;
    let mut it = 2;
    while multiple < MAX_PANDIGITAL {
        let next = num * it;
        let mut str = multiple.to_string();
        str.push_str(&next.to_string());
        multiple = str.parse::<u64>().unwrap();
        it += 1;
        if is_pandigital(multiple) {
            return Some(multiple);
        }
    }
    None
}


#[test]
fn test_is_pandigital() {
    assert_eq!(true, is_pandigital(123456789));
    assert_eq!(true, is_pandigital(987654321));
    assert_eq!(true, is_pandigital(192384576));
    assert_eq!(false, is_pandigital(19));

}

#[test]
fn test_find_pandigital_multiple() {
    assert_eq!(Some(192384576), find_pandigital_multiple(192));
}