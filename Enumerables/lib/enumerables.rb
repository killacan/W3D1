class Array

    def my_each(&proc)
        i = 0

        while i < self.length
            puts proc.call(self[i])
            i += 1
            
        end
        return self
    end

    def my_select(&proc)
        selected = []

        self.my_each do |ele|
            selected << ele if proc.call(ele)
        end
        return selected
    end

    def my_reject(&proc)
        selected = []

        self.my_each do |ele|
            selected << ele if !proc.call(ele)
        end
        return selected
    end

    def my_any?(&proc)
        accpected = false
        self.my_each do |ele|
            accpected = true if proc.call(ele)
        end
        accpected
    end

    def my_all?(&proc)
        accpected = true
        self.my_each do |ele|
            accpected = false if !proc.call(ele)
        end
        accpected
    end

    def my_flatten
        if !self.is_a?(Array)
            return [self]
        end

        res = []
        self.each do |el|
            if el.is_a?(Array)
                res += el.my_flatten
            else
                res << el
            end
        end
        res
    end

    # create zip, contains a lot of sub arrays. Put self into first sub array, 
    # and additional arguments we put in the rest of the sub array. 


    #[[stuff][stuff]] unshift([self]) [[self][stuff][otherstuff]].transpose
    # arrs.flatten(1) 

    # [[1, 2], [4,5,6], [7,8,9]]

    # [[1, 2][ 4, 5, 6 ][ 7, 8, 9 ]]
    # [[nil, nil, nil][nil, nil nil]]

    # if one of the sub_arrays has a length that is longer than self, then index into a j that
    # does not exist. do a (0 ... self.length).each do |num|

    def my_zip(*arrs)
        zip = Array.new(self.length) {Array.new(arrs.length + 1, nil)}
        array = arrs.unshift(self)

        array.each.with_index do |sub_array, i| 
            (0...self.length).each do |j| 
                zip[j][i] = sub_array[j]
            end
        end
        return zip
    end

    def my_rotate(num=1)
        rotated = []
        index = num % self.length

        rotated += self[index.. -1] 
        rotated += self[0 ... index]
        return rotated
    end

    def my_join(char="")
        str = "" 

        self.each do |el| 
            str += (el + char)
        end
        if char == ""
            return str
        else
            return str[0 ... - 1]
        end
    end

    def my_reverse
        arr = []

        self.each do |el|
            arr.unshift(el)
        end
        return arr
    end
end

