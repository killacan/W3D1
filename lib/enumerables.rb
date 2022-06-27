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

end