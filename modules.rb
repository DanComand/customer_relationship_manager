#modules.rb

module Perimeter
	end

	class Rectangle
			def initialize (length, width)
				@length = length
				@width = width
		    end

		    def sides
			[@length, @width, @length, @width]
		    end
	end
end
	class Square
	end
