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
end
