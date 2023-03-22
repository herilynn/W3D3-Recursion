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

# p fib2(5)
# p fib2(6)

def bsearch(array, target)
    # if !array.include?(target)
    #     return nil
    # end
    # idx = array.length / 2
    # if array[idx] == target 
    #     return idx 
    # elsif target > array[idx]
    #     idx += bsearch(array[idx..-1], target)
    # elsif target < array[idx]
    #     bsearch(array[0...idx], target) #[1,3,5]
    # end

    if !array.include?(target)
        return nil
    end
    idx = array.length / 2
    sub1 = array[idx..-1]
    sub2 = array[0...idx]
    if array[idx] == target 
        return idx 
    end

    if target > array[idx]
        idx += bsearch(sub1, target)
    elsif target < array[idx]
        bsearch(sub2, target) #[1,3,5]
    end
end



p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    if array.length == 0
        return []
    elsif array.length == 1
        return array
    end
    middle = array.length / 2
    left = array[0...middle]
    right = array[middle..-1]
    if right.length == 1
        merge(left_sort, right)
    end
    left_sort = merge_sort(left)
    right_sort = merge_sort(right)

    merge(left_sort, right_sort)

end

def merge(left, right)
    arr = []
    (0...left.length).each do |i|
        (0...right.length).each do |i2|
            if left[i] > right[i2]
                arr << right[i2]
            else
                arr << left[i]
                break
            end
        end
    end
end
    

