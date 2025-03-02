
#define EMOTE_DELAY (5 SECONDS) //To prevent spam emotes.

/mob
	var/nextsoundemote = 1 //Time at which the next emote can be played

/datum/emote
	cooldown = EMOTE_DELAY

//Disables the custom emote blacklist from TG that normally applies to slimes.
/datum/emote/living/custom
	mob_type_blacklist_typecache = list(/mob/living/brain)
	cooldown = 0
	stat_allowed = SOFT_CRIT

//me-verb emotes should not have a cooldown check
/datum/emote/living/custom/check_cooldown(mob/user, intentional)
	return TRUE


/datum/emote/imaginary_friend/custom/check_cooldown(mob/user, intentional)
	return TRUE


/datum/emote/living/blush
	sound = 'local/sound/emotes/generic/blush.ogg'

/datum/emote/living/quill
	key = "quill"
	key_third_person = "quills"
	message = "rustles their quills."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)
	vary = TRUE
	sound = 'local/sound/emotes/generic/voxrustle.ogg'


/datum/emote/living/cough/get_sound(mob/living/user)
	if(isvox(user))
		return 'local/sound/emotes/generic/voxcough.ogg'
	if(iscarbon(user))
		if(user.gender == MALE)
			return pick('local/sound/emotes/generic/male/male_cough_1.ogg',
						'local/sound/emotes/generic/male/male_cough_2.ogg',
						'local/sound/emotes/generic/male/male_cough_3.ogg')
		return pick('local/sound/emotes/generic/female/female_cough_1.ogg',
					'local/sound/emotes/generic/female/female_cough_2.ogg',
					'local/sound/emotes/generic/female/female_cough_3.ogg')
	return

/datum/emote/living/sneeze
	vary = TRUE

/datum/emote/living/sneeze/get_sound(mob/living/user)
	if(isvox(user))
		return 'local/sound/emotes/generic/voxsneeze.ogg'
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'local/sound/emotes/generic/male/male_sneeze.ogg'
		return 'local/sound/emotes/generic/female/female_sneeze.ogg'
	return

/datum/emote/flip/can_run_emote(mob/user, status_check, intentional)
	if(intentional && !HAS_TRAIT(user, TRAIT_FREERUNNING) && !isobserver(user))
		user.balloon_alert(user, "not nimble enough!")
		return FALSE
	return ..()

/datum/emote/living/peep
	key = "peep"
	key_third_person = "peeps"
	message = "peeps like a bird!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/peep_once.ogg'

/datum/emote/living/peep2
	key = "peep2"
	key_third_person = "peeps twice"
	message = "peeps twice like a bird!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/peep.ogg'

/datum/emote/living/snap2
	key = "snap2"
	key_third_person = "snaps twice"
	message = "snaps twice."
	message_param = "snaps twice at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	vary = TRUE
	sound = 'local/sound/emotes/voice/snap2.ogg'

/datum/emote/living/snap3
	key = "snap3"
	key_third_person = "snaps thrice"
	message = "snaps thrice."
	message_param = "snaps thrice at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	vary = TRUE
	sound = 'local/sound/emotes/voice/snap3.ogg'

/datum/emote/living/awoo
	key = "awoo"
	key_third_person = "awoos"
	message = "lets out an awoo!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/awoo.ogg'

/datum/emote/living/long_awoo
	key = "awoo2"
	message = "lets out an awoo!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/long_awoo.ogg'

/datum/emote/living/nya
	key = "nya"
	key_third_person = "nyas"
	message = "lets out a nya!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/nya.ogg'

/datum/emote/living/weh
	key = "weh"
	key_third_person = "wehs"
	message = "lets out a weh!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/weh.ogg'

/datum/emote/living/mothsqueak
	key = "msqueak"
	key_third_person = "lets out a tiny squeak"
	message = "lets out a tiny squeak!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/mothsqueak.ogg'

/datum/emote/living/mousesqueak
	key = "squeak"
	key_third_person = "squeaks"
	message = "squeaks!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'sound/effects/mousesqueek.ogg'

/datum/emote/living/merp
	key = "merp"
	key_third_person = "merps"
	message = "merps!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/merp.ogg'

/datum/emote/living/bark
	key = "bark"
	key_third_person = "barks"
	message = "barks!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/bark2.ogg'

/datum/emote/living/bark2
	key = "bark2"
	message = "barks!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/bark1.ogg'

/datum/emote/living/squish
	key = "squish"
	key_third_person = "squishes"
	message = "squishes!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/slime_squish.ogg'

/datum/emote/living/meow
	key = "meow"
	key_third_person = "meows"
	message = "meows!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/generic/meow.ogg'

/datum/emote/living/hiss
	key = "hiss1"
	key_third_person = "hisses"
	message = "hisses!"
	emote_type = EMOTE_AUDIBLE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)
	vary = TRUE
	sound = 'local/sound/emotes/generic/hiss.ogg'

/datum/emote/living/feline_hiss //Ported from Horizon, originally by FedTheCat
	key = "fhiss"
	message = "hisses!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/feline_hiss.ogg'

/datum/emote/living/chitter
	key = "chitter"
	key_third_person = "chitters"
	message = "chitters!"
	emote_type = EMOTE_AUDIBLE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)
	vary = TRUE
	sound = 'local/sound/emotes/generic/mothchitter.ogg'

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'local/sound/emotes/generic/male/male_sigh.ogg'
		return 'local/sound/emotes/generic/female/female_sigh.ogg'
	return

/datum/emote/living/sniff
	vary = TRUE

/datum/emote/living/sniff/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'local/sound/emotes/generic/male/male_sniff.ogg'
		return 'local/sound/emotes/generic/female/female_sniff.ogg'
	return

/datum/emote/living/gasp/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return pick('local/sound/emotes/generic/male/gasp_m1.ogg',
						'local/sound/emotes/generic/male/gasp_m2.ogg',
						'local/sound/emotes/generic/male/gasp_m3.ogg',
						'local/sound/emotes/generic/male/gasp_m4.ogg',
						'local/sound/emotes/generic/male/gasp_m5.ogg',
						'local/sound/emotes/generic/male/gasp_m6.ogg')
		return pick('local/sound/emotes/generic/female/gasp_f1.ogg',
					'local/sound/emotes/generic/female/gasp_f2.ogg',
					'local/sound/emotes/generic/female/gasp_f3.ogg',
					'local/sound/emotes/generic/female/gasp_f4.ogg',
					'local/sound/emotes/generic/female/gasp_f5.ogg',
					'local/sound/emotes/generic/female/gasp_f6.ogg')
	return

/datum/emote/living/snore
	vary = TRUE
	sound = 'local/sound/emotes/generic/snore.ogg'

/datum/emote/living/burp
	vary = TRUE

/datum/emote/living/burp/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'local/sound/emotes/generic/male/burp_m.ogg'
		return 'local/sound/emotes/generic/female/burp_f.ogg'
	return

/datum/emote/living/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE
	audio_cooldown = 5 SECONDS
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)

/datum/emote/living/clap/get_sound(mob/living/user)
	return pick('local/sound/emotes/generic/clap1.ogg',
				'local/sound/emotes/generic/clap2.ogg',
				'local/sound/emotes/generic/clap3.ogg',
				'local/sound/emotes/generic/clap4.ogg')

/datum/emote/living/clap/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional)
	if(user.usable_hands < 2)
		return FALSE
	return ..()

/datum/emote/living/clap1
	key = "clap1"
	key_third_person = "claps once"
	message = "claps once."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)

/datum/emote/living/clap1/get_sound(mob/living/user)
	return pick('local/sound/emotes/generic/claponce1.ogg',
				'local/sound/emotes/generic/claponce2.ogg')

/datum/emote/living/clap1/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional)
	if(user.usable_hands < 2)
		return FALSE
	return ..()

/datum/emote/living/headtilt
	key = "tilt"
	key_third_person = "tilts"
	message = "tilts their head."
	message_AI = "tilts the image on their display."

/datum/emote/beep
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/generic/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living) //Beep already exists on brains and silicons

/datum/emote/living/blink2
	key = "blink2"
	key_third_person = "blinks twice"
	message = "blinks twice."
	message_AI = "has their display flicker twice."

/datum/emote/living/rblink
	key = "rblink"
	key_third_person = "rapidly blinks"
	message = "rapidly blinks!"
	message_AI = "has their display port flash rapidly!"

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints"
	message = "squints."
	message_AI = "zooms in."

/datum/emote/living/smirk
	key = "smirk"
	key_third_person = "smirks"
	message = "smirks."

/datum/emote/living/eyeroll
	key = "eyeroll"
	key_third_person = "rolls their eyes"
	message = "rolls their eyes."

/datum/emote/living/huff
	key = "huffs"
	key_third_person = "huffs"
	message = "huffs!"

/datum/emote/living/etwitch
	key = "etwitch"
	key_third_person = "twitches their ears"
	message = "twitches their ears!"

/datum/emote/living/clear
	key = "clear"
	key_third_person = "clears their throat"
	message = "clears their throat."

// Avian revolution
/datum/emote/living/bawk
	key = "bawk"
	key_third_person = "bawks"
	message = "bawks like a chicken."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/bawk.ogg'

/datum/emote/living/caw
	key = "caw"
	key_third_person = "caws"
	message = "caws!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/caw.ogg'

/datum/emote/living/caw2
	key = "caw2"
	key_third_person = "caws twice"
	message = "caws twice!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/caw2.ogg'

/datum/emote/living/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "whistles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/blep
	key = "blep"
	key_third_person = "bleps"
	message = "bleps their tongue out. Blep."
	message_AI = "shows an image of a random blepping animal. Blep."
	message_robot = "bleps their robo-tongue out. Blep."

/datum/emote/living/bork
	key = "bork"
	key_third_person = "borks"
	message = "lets out a bork."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/bork.ogg'

/datum/emote/living/hoot
	key = "hoot"
	key_third_person = "hoots"
	message = "hoots!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/hoot.ogg'

/datum/emote/living/growl
	key = "growl"
	key_third_person = "growls"
	message = "lets out a growl."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	vary = TRUE
	sound = 'local/sound/emotes/voice/growl.ogg'

/datum/emote/living/rawr //Ported from Horizon, originally by FedTheCat
	key = "rawr"
	key_third_person = "rawrs"
	message = "lets out a rawr!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/rawr.ogg'

/datum/emote/living/woof
	key = "woof"
	key_third_person = "woofs"
	message = "lets out a woof!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/woof.ogg'

/datum/emote/living/woof2
	key = "woof2"
	message = "lets out a woof!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/woof2.ogg'

/datum/emote/living/whine1 //Ported from Horizon, originally by FedTheCat
	key = "whine1"
	key_third_person = "whines"
	message = "lets out a whine!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/whine1.ogg'

/datum/emote/living/whine2 //Ported from Horizon, originally by FedTheCat
	key = "whine2"
	message = "lets out a whine!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/whine2.ogg'

/datum/emote/living/yelp1 //Ported from Horizon, originally by FedTheCat
	key = "yelp"
	message = "lets out a yelp!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/yelp1.ogg'

/datum/emote/living/yelp2 //Ported from Horizon, originally by FedTheCat
	key = "yelp2"
	message = "lets out a yelp!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/yelp2.ogg'

/datum/emote/living/baa
	key = "baa"
	key_third_person = "baas"
	message = "lets out a baa."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/baa.ogg'

/datum/emote/living/baa2
	key = "baa2"
	key_third_person = "baas"
	message = "bleats."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/baa2.ogg'

/datum/emote/living/wurble
	key = "wurble"
	key_third_person = "wurbles"
	message = "lets out a wurble."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/wurble.ogg'

/datum/emote/living/rattle
	key = "rattle"
	key_third_person = "rattles"
	message = "rattles!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	vary = TRUE
	sound = 'local/sound/emotes/voice/rattle.ogg'

/datum/emote/living/cackle
	key = "cackle"
	key_third_person = "cackles"
	message = "cackles hysterically!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/hyena/cackle.ogg'

/datum/emote/living/cackle_giggle //Ported from Horizon
	key = "cackle2"
	message = "cackles hysterically!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/hyena/cackle_giggle.ogg'

/datum/emote/living/hyena_laugh //Ported from Horizon
	key = "hlaugh"
	message = "laughs!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/hyena_laugh/get_sound(mob/living/user)
	return pick('local/sound/emotes/voice/hyena/laugh_bright.ogg',
				'local/sound/emotes/voice/hyena/laugh_low.ogg',
				'local/sound/emotes/voice/hyena/laugh_short.ogg',
				'local/sound/emotes/voice/hyena/laugh_twice.ogg',
				'local/sound/emotes/voice/hyena/laugh1.ogg',
				'local/sound/emotes/voice/hyena/laugh2.ogg')

/datum/emote/living/whoop //Ported from Horizon
	key = "whoop"
	key_third_person = "whoops"
	message = "lets out a whoop!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/hyena/whoop.ogg'

/datum/emote/living/whoop2 //Ported from Horizon
	key = "whoop2"
	message = "lets out a whoop!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/hyena/whoop_long.ogg'

/mob/living/proc/do_ass_slap_animation(atom/slapped)
	do_attack_animation(slapped, no_effect=TRUE)
	var/image/gloveimg = image('icons/effects/effects.dmi', slapped, "slapglove", slapped.layer + 0.1)
	gloveimg.pixel_y = -5
	gloveimg.pixel_x = 0
	slapped.flick_overlay_view(gloveimg, 1 SECONDS)

	// And animate the attack!
	animate(gloveimg, alpha = 175, transform = matrix() * 0.75, pixel_x = 0, pixel_y = -5, pixel_z = 0, time = 3)
	animate(time = 1)
	animate(alpha = 0, time = 3, easing = CIRCULAR_EASING|EASE_OUT)

//Froggie Revolution
/datum/emote/living/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warbles!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/warbles.ogg'

/datum/emote/living/trills
	key = "trills"
	key_third_person = "trills!"
	message = "trills!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/trills.ogg'

/datum/emote/living/rpurr
	key = "rpurr"
	key_third_person = "purrs!"
	message = "purrs!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/raptor_purr.ogg'

/datum/emote/living/purr //Ported from CitRP originally by buffyuwu.
	key = "purr"
	key_third_person = "purrs!"
	message = "purrs!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/feline_purr.ogg'

/datum/emote/living/catchirp //Ported from Horizon, originally by FedTheCat
	key = "catchirp"
	message = "chirps!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/catchirp.ogg'

/datum/emote/living/moo
	key = "moo"
	key_third_person = "moos!"
	message = "moos!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/moo.ogg'

/datum/emote/living/honk
	key = "honk1"
	key_third_person = "honks loudly like a goose!"
	message = "honks loudly like a goose!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'local/sound/emotes/voice/goose_honk.ogg'

/datum/emote/living/gnash
	key = "gnash"
	key_third_person = "gnashes"
	message = "gnashes."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'sound/weapons/bite.ogg'

/datum/emote/living/thump
	key = "thump"
	key_third_person = "thumps"
	message = "thumps their foot!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'sound/effects/glassbash.ogg'

/**
 * Returns a boolean based on whether or not the string contains a comma or an apostrophe,
 * to be used for emotes to decide whether or not to have a space between the name of the user
 * and the emote.
 *
 * Requires the message to be HTML decoded beforehand. Not doing it here for performance reasons.
 *
 * Returns TRUE if there should be a space, FALSE if there shouldn't.
 */
/proc/should_have_space_before_emote(string)
	var/static/regex/no_spacing_emote_characters = regex(@"(,|')")
	return no_spacing_emote_characters.Find(string) ? FALSE : TRUE
