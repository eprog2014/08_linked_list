class
	PERSON

create
	make

feature {NONE}
	make(a_name: STRING; a_birthyear: INTEGER)
		do
			name := a_name
			birthyear := a_birthyear
		end

feature
	name: STRING
	birthyear: INTEGER
	-- Violates SOC - "separation of concerns"
	-- http://programmers.stackexchange.com/questions/32581/how-do-you-explain-separation-of-concerns-to-others
	-- Person isn't supposed to "know" that it's saved in a list or that in this particular application
	-- we want to save multiple PERSONs

	-- Also, with this implementation, a person is inherently associated with one particular list
	-- and cannot be in multiple lists with different tails
	-- This does not conform to the expecation of what a PERSON is and is thus a *bad* implementation

	-- Void by default: i.e. this is the last person in the list
	next_person: PERSON

	set_next_person(a_person: PERSON)
		require
			-- Setting next_person to void may make sense, i.e. cutting of the end of the list
			-- dont_set_to_void: a_person /= Void
		do
			next_person := a_person
		end

	last_person: PERSON
		-- Iterate over list until person without successor is found
		do
			from
				-- Initialize with currently "active instance", i.e. the target of last_person call
				-- That is, if x.last_person executes, the next line would effectively read
				-- Result := x
				-- This makes sense because the current person is the "last" person if it itself has no successor
				Result := Current
			invariant
				Result /= Void
			until
				Result.next_person = Void
			loop
				-- UNTIL-condition does *not* hold, hence Result has a successor
				Result := Result.next_person
			end
		ensure
			last_person_exists: Result /= Void
			has_no_successor: Result.next_person = Void
		end
end
