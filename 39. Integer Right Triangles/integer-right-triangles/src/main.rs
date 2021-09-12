

struct Solution {
    count: u32,
    value: u32,
}

fn main() {    
    let mut solution = Solution{count: 0, value: 0};
    for i in 1..=1000 {
        let count = get_triangle_combination_count(i);
        if count > solution.count {
            solution.count = count;
            solution.value = i;
        }
    }

    println!("Max right triangles: {}", solution.value);
}

fn get_triangle_combination_count(x: u32) -> u32 {
    let p = x;
    let mut count = 0;
    for a in 1..=x/2 {
        if (p*p - 2*p*a) % (2* (p - a)) == 0 {
            count += 1;
        }
    }
    count
}
