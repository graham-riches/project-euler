
fn main() {        
    let indices = [1, 10, 100, 1000, 10000, 100000, 1000000];
    let mut multiple: u64 = 1;
    let mut index = 0;    
    let mut total_length = 0;

    for value in 1..=1_000_000 {
        let s = int_to_chars(value);        
        if total_length + s.len() >= indices[index] {            
            let i = indices[index] - total_length - 1;
            match s[i as usize].to_digit(10) {
                Some(x) => {
                    multiple *= x as u64;
                },
                None => (),
            }            
            index += 1;
            if index == indices.len() {
                break;
            }
        }
        total_length += s.len();
    }
    println!("Value of the product: {}", multiple);
}

fn int_to_chars(x: u64) -> Vec<char> {
    let s: Vec<char> = x.to_string().chars().collect();
    s
}
