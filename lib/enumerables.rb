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

    # arrs.flatten(1) 
    def my_zip(*arrs)
        zip = Array.new(self.length) {Array.new(array.length, nil)}
        zip[0] = self
        (1 .. self.length - 1).each do |index|
            zip[index] = 
        end

        zip.each do |sub_array|
            arrs.each do |ele| 

            end
        end
    end
end
