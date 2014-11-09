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
			person_1, person_2, person_3, person_4, person_5: PERSON

			persons_to_read: INTEGER
		do
			Io.put_string ("Read People from Console, then print them!%N")

			from
				-- Initially, persons_to_read is 0, because that is the default value for INTEGERs
				-- Hence, the loop will always run at least once
			until
				1 <= persons_to_read and persons_to_read <= 5
			loop
				Io.put_string ("Number of person entries to save (1-5): ")
				Io.read_integer
				persons_to_read := Io.last_integer
			end

			Io.new_line
			person_1 := read_person(1)

			if persons_to_read >= 2 then
				Io.new_line
				person_2 := read_person(2)
			end

			if persons_to_read >= 3 then
				Io.new_line
				person_3 := read_person(3)
			end

			if persons_to_read >= 4 then
				Io.new_line
				person_4 := read_person(4)
			end

			if persons_to_read >= 5 then
				Io.new_line
				person_5 := read_person(5)
			end

			-- Output data
			Io.new_line
			print_person(person_1, 1)
			if persons_to_read >= 2 then
				Io.new_line
				print_person(person_2, 2)
			end
			if persons_to_read >= 3 then
				Io.new_line
				print_person(person_3, 3)
			end
			if persons_to_read >= 4 then
				Io.new_line
				print_person(person_4, 4)
			end
			if persons_to_read >= 5 then
				Io.new_line
				print_person(person_5, 5)
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
