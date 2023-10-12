/datum/effigy_message
	/// The endpoint we're using
	var/datum/effigy_message_type/endpoint
	/// API message content
	var/list/message_content
	/// HTTP message request
	var/datum/http_request/message_request

/datum/effigy_message/New(msg_type, box, int_id, ticket_id, link_id, title, message)
	endpoint = msg_type
	message_content = list(
		"box" = box,
		"int_id" = int_id,
		"link_id" = link_id,
		"ticket_id" = ticket_id,
		"title" = title,
		"message" = message,
	)

// Cleans up the request object when it is destroyed.
/datum/effigy_message/Destroy(force, ...)
	endpoint = null
	QDEL_NULL(message_request)
	return ..()

/// Effigy API Endpoint Config
/datum/effigy_message_type
	/// Message type of request
	var/endpoint
	/// API URL of the endpoint
	var/url
	/// The HTTP method of this endpoint
	var/method

/// Generates the request header
/datum/effigy_message_type/proc/construct_api_message_header(efapi_auth, efapi_key)
	var/list/processed_content = list(
		"Authorization" = "[efapi_auth] [efapi_key]",
		"content-type" = "application/x-www-form-urlencoded"
		)
	return processed_content

/// Generates the request body
/datum/effigy_message_type/proc/construct_api_message_body(list/raw_content)
	var/list/processed_content = list(
		"forum=[raw_content["box"]]",
		"author=[raw_content["link_id"]]",
		"topic=[raw_content["ticket_id"]]",
		"title=\[[GLOB.round_hex]-[raw_content["int_id"]]] [raw_content["title"]]",
		"post=[jointext(raw_content["message"], "<br>")]"
	)

	var/joined = jointext(processed_content, "&")
	return joined

/datum/effigy_message_type/proc/create_http_request(content)
	// Set up the required headers for the Effigy API
	var/list/headers = construct_api_message_header(SSeffigy.efapi_auth, SSeffigy.efapi_key)

	// Create the JSON body for the request
	var/body = construct_api_message_body(content)

	// Make the API URL
	url = "[SSeffigy.efapi_url][endpoint]"

	// Create a new HTTP request
	var/datum/http_request/request = new()

	// Set up the HTTP request
	request.prepare(method, url, body, headers)

	return request

/datum/effigy_account_link
	var/ckey
	var/effigy_id

/datum/effigy_account_link/New(ckey, effigy_id)
	src.ckey = ckey
	src.effigy_id = effigy_id

/datum/effigy_message_type/new_ticket
	endpoint = EFFIGY_ENDPOINT_NEW_TICKET
	method = RUSTG_HTTP_METHOD_POST

/datum/effigy_message_type/ticket_interaction
	endpoint = EFFIGY_ENDPOINT_TICKET_INTERACTION
	method = RUSTG_HTTP_METHOD_POST

/datum/effigy_message_type/get
	method = RUSTG_HTTP_METHOD_GET

/datum/effigy_message_type/poll_member_list
	method = RUSTG_HTTP_METHOD_GET
	endpoint = EFFIGY_ENDPOINT_GET_MEMBERS
