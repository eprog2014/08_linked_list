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

			name_2: STRING
			birthyear_2: INTEGER
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

			Io.put_string ("Enter second person's data%N")
			Io.put_string ("Name: ")
			Io.read_line
			name_2 := Io.last_string.twin
			Io.put_string ("Year of birth: ")
			Io.read_integer
			birthyear_2 := Io.last_integer

			-- Output data
			Io.new_line
			Io.put_string ("Saved person data:")
			Io.new_line
			Io.put_string ("Name: " + name)
			Io.new_line
			-- Concatenate String with "INTEGER" by converting the latter to STRING before that (.out call)
			Io.put_string ("Year: " + birthyear.out)

			Io.new_line
			Io.new_line
			Io.put_string ("Saved person data #2:")
			Io.new_line
			Io.put_string ("Name: " + name_2)
			Io.new_line
			-- No concatenation, just using regular put_integer
			Io.put_string ("Year: ")
			Io.put_integer (birthyear_2)
		end

end
