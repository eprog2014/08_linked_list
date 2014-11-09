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
			Io.put_string ("Enter person #1's data%N")
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
			create person_1.make(name, birthyear)

			if persons_to_read >= 2 then
				Io.new_line
				Io.put_string ("Enter person #2's data%N")
				Io.put_string ("Name: ")
				Io.read_line
				name := Io.last_string.twin
				Io.put_string ("Year of birth: ")
				Io.read_integer
				birthyear := Io.last_integer
				create person_2.make(name, birthyear)
			end

			if persons_to_read >= 3 then
				Io.new_line
				Io.put_string ("Enter person #3's data%N")
				Io.put_string ("Name: ")
				Io.read_line
				name := Io.last_string.twin
				Io.put_string ("Year of birth: ")
				Io.read_integer
				birthyear := Io.last_integer
				create person_3.make(name, birthyear)
			end

			if persons_to_read >= 4 then
				Io.new_line
				Io.put_string ("Enter person #4's data%N")
				Io.put_string ("Name: ")
				Io.read_line
				name := Io.last_string.twin
				Io.put_string ("Year of birth: ")
				Io.read_integer
				birthyear := Io.last_integer
				create person_4.make(name, birthyear)
			end

			if persons_to_read >= 5 then
				Io.new_line
				Io.put_string ("Enter person #5's data%N")
				Io.put_string ("Name: ")
				Io.read_line
				name := Io.last_string.twin
				Io.put_string ("Year of birth: ")
				Io.read_integer
				birthyear := Io.last_integer
				create person_5.make(name, birthyear)
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

end
