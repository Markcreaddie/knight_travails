def my_func(array, result = [])
    arr_len = array.length
    return if arr_len == 0
    array.each do |item|
        result << item
        p "#{array}  #{result}"
        my_func(array[1..arr_len-1], result[0..result.length])
        result.pop()
    end
    return
end

my_func([1,2,3])