note
	description : "REST Buck server"
	date        : "$Date: 2013-09-06 06:59:05 -0700 (Fri, 06 Sep 2013) $"
	revision    : "$Revision: 92915 $"

class RESTBUCKS_SERVER

inherit

	WSF_ROUTED_SKELETON_SERVICE
		undefine
			requires_proxy
		end

	WSF_URI_TEMPLATE_HELPER_FOR_ROUTED_SERVICE

	WSF_HANDLER_HELPER

	WSF_DEFAULT_SERVICE

	WSF_NO_PROXY_POLICY

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		do
				print ("Starting restbucks server on port " + argument (1) + "...%N")
				initialize_router
				set_service_option ("port", argument (1).to_integer)
				make_and_launch
		end

	setup_router
		local
			order_handler: ORDER_HANDLER
			doc: WSF_ROUTER_SELF_DOCUMENTATION_HANDLER
		do
			create order_handler.make_with_router (router)
			router.handle_with_request_methods ("/order", order_handler, router.methods_POST)
			router.handle_with_request_methods ("/order/{orderid}", order_handler, router.methods_GET + router.methods_DELETE + router.methods_PUT)
			create doc.make_hidden (router)
			router.handle_with_request_methods ("/api/doc", doc, router.methods_GET)
		end


note
	copyright: "2011-2014, Javier Velilla and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
