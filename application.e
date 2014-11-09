class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			name: STRING
			birthyear: INTEGER
		do
			Io.put_string ("Read People from Console, then print them!%N")
			Io.put_string ("Name: ")
			Io.read_line
				-- Io.last_string always refers to the same STRING object
				-- and will modify it when reading a new line, hence duplicate STRING
				-- when getting a specific input to preserve it, because a future
				-- Io.read_line would change it
			name := Io.last_string.twin
			Io.put_string ("Year of birth: ")
			Io.read_integer
			birthyear := Io.last_integer
		end

end
