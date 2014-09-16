note
	description: "Summary description for {DATABASE_API}."
	author: ""
	date: "$Date: 2013-05-20 06:34:55 -0700 (Mon, 20 May 2013) $"
	revision: "$Revision: 92549 $"

class
	DATABASE_API
create
	make

feature -- Initialization

	make
		do
			create orders.make (10)
		end

feature -- Access

	orders: HASH_TABLE [ORDER, STRING]

;note
	copyright: "2011-2012, Javier Velilla and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
end
