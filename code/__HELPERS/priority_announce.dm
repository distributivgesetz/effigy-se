/**
 * Make a big red text announcement to
 *
 * Formatted like:
 *
 * " Message from sender "
 *
 * " Title "
 *
 * " Text "
 *
 * Arguments
 * * text - required, the text to announce
 * * title - optional, the title of the announcement.
 * * sound - optional, the sound played accompanying the announcement
 * * type - optional, the type of the announcement, for some "preset" announcement templates. "Priority", "Captain", "Syndicate Captain"
 * * sender_override - optional, modifies the sender of the announcement
 * * has_important_message - is this message critical to the game (and should not be overridden by station traits), or not
 * * players - a list of all players to send the message to. defaults to all players (not including new players)
 * * encode_title - if TRUE, the title will be HTML encoded
 * * encode_text - if TRUE, the text will be HTML encoded
 */
/proc/priority_announce(text, title = "", sound, type, sender_override, has_important_message = FALSE, list/mob/players, encode_title = TRUE, encode_text = TRUE)
	if(!text)
		return

	if(encode_title && title && length(title) > 0)
		title = html_encode(title)
	if(encode_text)
		text = html_encode(text)
		if(!length(text))
			return

	var/announcement
	if(!sound)
		sound = SSstation.announcer.get_rand_alert_sound()
	else if(SSstation.announcer.event_sounds[sound])
		sound = SSstation.announcer.event_sounds[sound]

	// EffigyEdit Change - Announcements
	/*
	if(type == "Priority")
		announcement += "<h1 class='alert'>Priority Announcement</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[title]</h2>"
	else if(type == "Captain")
		announcement += "<h1 class='alert'>Captain Announces</h1>"
		GLOB.news_network.submit_article(text, "Captain's Announcement", "Station Announcements", null)
	else if(type == "Syndicate Captain")
		announcement += "<h1 class='alert'>Syndicate Captain Announces</h1>"

	else
		if(!sender_override)
			announcement += "<h1 class='alert'>[command_name()] Update</h1>"
		else
			announcement += "<h1 class='alert'>[sender_override]</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[title]</h2>"

		if(!sender_override)
			if(title == "")
				GLOB.news_network.submit_article(text, "Central Command Update", "Station Announcements", null)
			else
				GLOB.news_network.submit_article(title + "<br><br>" + text, "Central Command", "Station Announcements", null)

	///If the announcer overrides alert messages, use that message.
	if(SSstation.announcer.custom_alert_message && !has_important_message)
		announcement += SSstation.announcer.custom_alert_message
	else
		announcement += "[span_alert(text)]"
	announcement += "<br>"
	*/

	announcement += "<div class='efchatalert'>"

	if(type == "Priority")
		announcement += "[EFSPAN_ANNOUNCE_MAJ_TITLE("Priority Announcement")]<br>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[title]</h2>"
	else if(type == "Captain")
		announcement += "[EFSPAN_ANNOUNCE_MAJ_TITLE("Captain's Announcement")]<br>"
		GLOB.news_network.submit_article(text, "Captain's Announcement", "Station Announcements", null)
	else if(type == "Syndicate Captain")
		announcement += "[EFSPAN_ANNOUNCE_MAJ_TITLE("Syndicate Captain's Announcement")]<br>"

	else
		if(!sender_override)
			announcement += "[EFSPAN_ANNOUNCE_MAJ_TITLE("[command_name()] Update")]<br>"
		else
			announcement += "[EFSPAN_ANNOUNCE_MAJ_TITLE(sender_override)]<br>"
		if(title && length(title) > 0)
			announcement += "[EFSPAN_ANNOUNCE_MIN_TITLE(title)]<br>"

		if(!sender_override)
			if(title == "")
				GLOB.news_network.submit_article(text, "Central Command Update", "Station Announcements", null)
			else
				GLOB.news_network.submit_article(title + "<br><br>" + text, "Central Command", "Station Announcements", null)

	///If the announcer overrides alert messages, use that message.
	if(SSstation.announcer.custom_alert_message && !has_important_message)
		announcement += SSstation.announcer.custom_alert_message
	else
		announcement += "[EFSPAN_ANNOUNCE_MAJ_TEXT(text)]"
	announcement += "</div>"
	// EffigyEdit Change End

	if(!players)
		players = GLOB.player_list

	var/sound_to_play = sound(sound)
	for(var/mob/target in players)
		if(!isnewplayer(target) && target.can_hear())
			to_chat(target, announcement)
			if(target.client.prefs.read_preference(/datum/preference/toggle/sound_announcements))
				SEND_SOUND(target, sound_to_play)

/proc/print_command_report(text = "", title = null, announce=TRUE)
	if(!title)
		title = "Classified [command_name()] Update"

	if(announce)
		priority_announce("A report has been downloaded and printed out at all communications consoles.", "Incoming Classified Message", SSstation.announcer.get_rand_report_sound(), has_important_message = TRUE)

	var/datum/comm_message/M = new
	M.title = title
	M.content = text

	SScommunications.send_message(M)

/**
 * Sends a minor annoucement to players.
 * Minor announcements are large text, with the title in red and message in white.
 * Only mobs that can hear can see the announcements.
 *
 * message - the message contents of the announcement.
 * title - the title of the announcement, which is often "who sent it".
 * alert - whether this announcement is an alert, or just a notice. Only changes the sound that is played by default.
 * html_encode - if TRUE, we will html encode our title and message before sending it, to prevent player input abuse.
 * players - optional, a list mobs to send the announcement to. If unset, sends to all palyers.
 * sound_override - optional, use the passed sound file instead of the default notice sounds.
 * should_play_sound - Whether the notice sound should be played or not.
 */
/proc/minor_announce(message, title = "Attention:", alert, html_encode = TRUE, list/players = null, sound_override = null, should_play_sound = TRUE)
	if(!message)
		return

	if (html_encode)
		title = html_encode(title)
		message = html_encode(message)

	if(!players)
		players = GLOB.player_list

	for(var/mob/target in players)
		if(isnewplayer(target))
			continue
		if(!target.can_hear())
			continue

		// EffigyEdit Change - Announcements
		/*
		to_chat(target, "[span_minorannounce("<font color = red>[title]</font color><BR>[message]")]<BR>")
		if(should_play_sound && target.client?.prefs.read_preference(/datum/preference/toggle/sound_announcements))
			var/sound_to_play = sound_override || (alert ? 'sound/misc/notice1.ogg' : 'sound/misc/notice2.ogg')
			SEND_SOUND(target, sound(sound_to_play))
		*/

		to_chat(target, "<div class='efchatalert'>[EFSPAN_ANNOUNCE_MIN_TITLE(title)]<br>[EFSPAN_ANNOUNCE_MIN_TEXT(message)]</div>")
		if(target.client?.prefs.read_preference(/datum/preference/toggle/sound_announcements))
			var/sound_to_play = sound_override || (alert ? 'sound/misc/notice1.ogg' : 'sound/misc/notice2.ogg')
			SEND_SOUND(target, sound(sound_to_play))

/proc/level_announce(message, title, alert, html_encode = TRUE, list/players, sound_override, divcolor = SEC_LEVEL_GREEN)
	if(!message)
		return

	title = html_encode(title)
	message = html_encode(message)

	for(var/mob/target in GLOB.player_list)
		if(isnewplayer(target))
			continue
		if(!target.can_hear())
			continue

		to_chat(target, "<div class='efchatalert_[divcolor]' >[EFSPAN_ANNOUNCE_MIN_TITLE(title)]<br>[EFSPAN_ANNOUNCE_MIN_TEXT(message)]</div>")
		if(target.client?.prefs.read_preference(/datum/preference/toggle/sound_announcements))
			var/sound_to_play = sound_override || 'sound/misc/notice2.ogg'
			SEND_SOUND(target, sound(sound_to_play))

// EffigyEdit Change End
