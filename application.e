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
			person_list: PERSON_LIST

			persons_to_read: INTEGER
			persons_read: INTEGER
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
			create person_list.make (read_person(1))

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

				-- Since person_list actually is a list, not just a person with some tacked-on list functionality
				-- it makes sense that it provides features to modify that list (of course it could have been added to PERSON too earlier)
				person_list.append(read_person(persons_read + 1))

				persons_read := persons_read + 1
			end

			-- Output data
			Io.new_line
			-- self documenting code, place code into separate feature such that its name explains
			-- what the entire *named* code block does by aptly naming it
			-- reduces code size of primary feature and improves its readability
			-- Would require another parameter if we hadn't removed the loop's dependency on # of persons read!
			print_all_persons(person_list)

		end

	print_all_persons(person_list: PERSON_LIST)
		local
			person_to_print_index: INTEGER
			-- Argument person_list is non writable, hence we need an additional variable
			current_node: PERSON_LIST
		do
			from
				-- This counter is now only necessary because print_person uses a number to get nicer output
				-- No longer needs any knowledge of length of list
				person_to_print_index := 1
				current_node := person_list
			until
				-- Again, consider edge cases
				-- Even works if we were to allow reading zero persons
				current_node = Void
			loop
				Io.new_line
				print_person(current_node.person, person_to_print_index)
				current_node := current_node.tail
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
