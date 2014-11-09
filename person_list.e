class
	PERSON_LIST

create
	make

feature{NONE}
	make(a_person: PERSON)
		require
			a_person_not_void: a_person /= Void
		do
			person := a_person
		end

	make_with_tail(a_person: PERSON; a_tail: PERSON_LIST)
		require
			a_person_not_void: a_person /= Void
			-- a_tail may be Void, it's the default value anyway
		do
			person := a_person
			tail := a_tail
		ensure
			person_set: person = a_person
			tail_set: tail = a_tail
		end

feature
	person: PERSON
	-- The "rest" of the list, conventionally called "tail"
	tail: PERSON_LIST

	set_person (a_person: PERSON)
		require
			-- We require that our every node in our list always points to a PERSON object
			-- cf. invariant
			no_empty_nodes_allowed: person /= Void
		do
			person := a_person
		ensure
			person_updated: person = a_person
		end

	set_tail(a_tail: PERSON_LIST)
		-- sets the next node of the list, since that "node" is itself a list with possible successors (i.e. it has a tail)
		-- we essentially set the tail
		require
			-- We should check that we don't introduce any loops
		do
			tail := a_tail
		ensure
			tail_updated: tail = a_tail
		end

	last_node: PERSON_LIST
		-- Node which has no tail
		do
			from
				Result := Current
			invariant
				Result /= Void
			until
				Result.tail = Void
			loop
				Result := Result.tail
			end
		ensure
			last_person_exists: Result /= Void
			has_no_successor: Result.tail = Void
		end

	append(a_person: PERSON)
		-- Take PERSON obj, wrap it in a PERSON_LIST, then append that list to the end of the current list
		require
			a_person_not_void: a_person /= Void
		do
			-- Create an instance of PERSON_LIST without binding it to a variable, you could say it's "anonymous"
			-- create {...}.make(...) IS an expression!
			-- Its value is the newly created object, i.e. a PERSON_LIST, which is why you can pass it as an argument to set_tail
			-- In contrast: the regular create entity.creation_procedure() is NOT an expression, it's an instruction and has no value
			--   -> As such, it couldn't be passed as an argument
			last_node.set_tail (create {PERSON_LIST}.make (a_person))
		end

invariant
	-- No node in our list can not point to a PERSON object
	-- Simplifies iterating over the list by letting us know that we need not do any Void checks
	-- when accessing an element while iterating
	never_empty: person /= Void
end
