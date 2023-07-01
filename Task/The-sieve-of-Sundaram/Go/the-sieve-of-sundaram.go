package main

import (
    "fmt"
    "math"
    "rcu"
    "time"
)

func sos(n int) []int {
    if n < 3 {
        return []int{}
    }
    var primes []int
    k := (n-3)/2 + 1
    marked := make([]bool, k) // all false by default
    limit := (int(math.Sqrt(float64(n)))-3)/2 + 1
    for i := 0; i < limit; i++ {
        p := 2*i + 3
        s := (p*p - 3) / 2
        for j := s; j < k; j += p {
            marked[j] = true
        }
    }
    for i := 0; i < k; i++ {
        if !marked[i] {
            primes = append(primes, 2*i+3)
        }
    }
    return primes
}

// odds only
func soe(n int) []int {
    if n < 3 {
        return []int{}
    }
    var primes []int
    k := (n-3)/2 + 1
    marked := make([]bool, k) // all false by default
    limit := (int(math.Sqrt(float64(n)))-3)/2 + 1
    for i := 0; i < limit; i++ {
        if !marked[i] {
            p := 2*i + 3
            s := (p*p - 3) / 2
            for j := s; j < k; j += p {
                marked[j] = true
            }
        }
    }
    for i := 0; i < k; i++ {
        if !marked[i] {
            primes = append(primes, 2*i+3)
        }
    }
    return primes
}

func main() {
    const limit = int(16e6) // say
    start := time.Now()
    primes := sos(limit)
    elapsed := int(time.Since(start).Milliseconds())
    climit := rcu.Commatize(limit)
    celapsed := rcu.Commatize(elapsed)
    million := rcu.Commatize(1e6)
    millionth := rcu.Commatize(primes[1e6-1])
    fmt.Printf("Using the Sieve of Sundaram generated primes up to %s in %s ms.\n\n", climit, celapsed)
    fmt.Println("First 100 odd primes generated by the Sieve of Sundaram:")
    for i, p := range primes[0:100] {
        fmt.Printf("%3d ", p)
        if (i+1)%10 == 0 {
            fmt.Println()
        }
    }
    fmt.Printf("\nThe %s Sundaram prime is %s\n", million, millionth)

    start = time.Now()
    primes = soe(limit)
    elapsed = int(time.Since(start).Milliseconds())
    celapsed = rcu.Commatize(elapsed)
    millionth = rcu.Commatize(primes[1e6-1])
    fmt.Printf("\nUsing the Sieve of Eratosthenes would have generated them in %s ms.\n", celapsed)
    fmt.Printf("\nAs a check, the %s Sundaram prime would again have been %s\n", million, millionth)
}