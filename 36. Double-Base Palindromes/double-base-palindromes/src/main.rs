fn main() {
    //!< Note: We can make use of the fact that any even number ends in 
    //!< binary 0, which cannot be palindromic as per the rules
    let mut sum: u64 = 0;
    for n in (1..1_000_000).step_by(2){
        let bin = decimal_to_binary_u32(n);
        let s: Vec<char> = n.to_string().chars().collect();

        if is_palindomic(&bin) && is_palindomic(&s) {
            print!("{}: ", n);
            for i in bin.iter() {
                let a: u32 = if *i {1} else {0};
                print!("{}", a);
            }
            println!("");
            sum += n as u64;
        }
    }
    println!("Sum of double-base palindromes: {}", sum);
}

/* TODO: replace with a generic? */
fn decimal_to_binary_u32(n: u32) -> Vec<bool>{
    let mut bit_vector: Vec<bool> = Vec::new();
    let mut value = 0;
    let mut index = 0;
    while value != n {
        bit_vector.push(n & (0x01 << index) > 0);        
        value += n & (0x01 << index);
        index += 1;
    }
    bit_vector
}

fn is_palindomic<T>(v: &[T]) -> bool 
where 
    T: Eq,
{
    v.iter().eq(v.iter().rev())
}