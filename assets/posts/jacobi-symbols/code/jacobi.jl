# This file was generated, do not modify it. # hide
function jacobi(a, n)
    a %= n
    t = 1
    while a != 0
        while iseven(a)
            a = div(a, 2)
            ((n % 8) in [3, 5]) && (t *= -1)
        end
        a, n = n, a
        (a % 4 == n % 4 == 3) && (t *= -1)
        a = a % n
    end
    return n == 1 ? t : 0 
end