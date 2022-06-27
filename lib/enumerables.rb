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

    

end