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
			first_person: PERSON

			persons_to_read: INTEGER
			persons_read: INTEGER

			-- Helpers for printing
			person_to_print_index: INTEGER
			person_to_print: PERSON
		do
			Io.put_string ("Read People from Console, then print them!%N")

			-- How many PERSONs to read?
			from
				-- Initially, persons_to_read is 0, because that is the default value for INTEGERs
				-- Hence, the loop will always run at least once
			until
				1 <= persons_to_read
			loop
				Io.put_string ("Number of person entries to save (>=1): ")
				Io.read_integer
				persons_to_read := Io.last_integer
			end

			-- Read PERSONs
			Io.new_line
			first_person := read_person(1)

			from
				-- We have already read one person
				persons_read := 1
			until
				-- Think: Does it work for edge cases (i.e. lowest and maximum amount of iterations)?
				-- What if person_to_read is 1?
				--   -> Will it execute at least once and only once?
				persons_read = persons_to_read
			loop
				Io.new_line

				first_person.last_person.set_next_person (read_person(persons_read + 1))

				persons_read := persons_read + 1
			end

			-- Output data
			Io.new_line

			from
				-- This counter is now only necessary because print_person uses a number to get nicer output
				-- No longer needs any knowledge of length of list
				person_to_print_index := 1
				person_to_print := first_person
			until
				-- Again, consider edge cases
				-- Even works if we were to allow reading zero persons
				person_to_print = Void
			loop
				Io.new_line
				print_person(person_to_print, person_to_print_index)
				person_to_print := person_to_print.next_person
				person_to_print_index := person_to_print_index + 1
			end
		end

	print_person(a_person: PERSON; number: INTEGER)
		do
			Io.put_string ("Saved person data #" + number.out + ":")
			Io.new_line
			Io.put_string ("Name: " + a_person.name)
			Io.new_line
			-- Concatenate String with "INTEGER" by converting the latter to STRING before that (.out call)
			Io.put_string ("Year: " + a_person.birthyear.out)
			Io.new_line
		end

	read_person(number: INTEGER): PERSON
		local
			name: STRING
			birthyear: INTEGER
		do
			Io.put_string ("Enter person #" + number.out + "'s data%N")
			Io.put_string ("Name: ")
			Io.read_line
			name := Io.last_string.twin
			Io.put_string ("Year of birth: ")
			Io.read_integer
			birthyear := Io.last_integer
			-- No extra PERSON variable needed
			-- Since Result *is* already an implicitely defined PERSON variable
			create Result.make(name, birthyear)
		end

end
