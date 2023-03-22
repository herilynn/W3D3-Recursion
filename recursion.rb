# def exp(b, n)
#     return 1 if n == 0 
#     b * exp(b, n - 1)
# end

def exp(b, n)
    if n == 0 
        return 1
    elsif n == 1
        return b
    else
        if n.even?
            exp(b, n/ 2) ** 2
        else
            b * (exp(b, (n - 1) / 2) ** 2)
        end
    end
end

# p exp(3, 5)
# p exp(2, 4)
# p exp(4, 0)

def deep_dup(array)
    if array.length == 0
        return []
    end
    new_arr = []
    array.each do |ele|
        if !ele.is_a?(Array)
            new_arr << ele
        else
            new_arr << deep_dup(ele)
        end
    end
    new_arr
end

# p deep_dup([1, [2], [3, [4]]])

def fib1(n)
    if n == 0 
        return []
    elsif n == 1
        return [0]
    elsif n == 2 
        return [0, 1]
    end

    prev = fib1(n - 1)
    prev << prev[-1] + prev[-2]
    return prev
end

def fib2(n)
    if n == 0 
        return []
    elsif n == 1
        return [0]
    elsif n == 2 
        return [0, 1]
    end
    start = [0, 1]
    
    while n > start.length
        new_num = start[-1] + start[-2]
        start << new_num
    end
    start
end

p fib2(5)
p fib2(6)