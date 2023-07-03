/obj/item/organ/internal/tongue/synth
	name = "synthetic voicebox"
	desc = "A voice synthesizer that allows synths to communicate with lifeforms. Tuned to sound less agressive than robotic voiceboxes."
	icon = 'local/icons/obj/medical/surgery.dmi'
	icon_state = "tongue-ipc"
	say_mod = "beeps"
	modifies_speech = TRUE
	taste_sensitivity = 25 // not as good as an organic tongue
	maxHealth = 100 //RoboTongue!
	organ_flags = ORGAN_ROBOTIC | ORGAN_ROBOTIC_FROM_SPECIES

/obj/item/organ/internal/tongue/synth/handle_speech(datum/source, list/speech_args)
	speech_args[SPEECH_SPANS] |= SPAN_ROBOT
