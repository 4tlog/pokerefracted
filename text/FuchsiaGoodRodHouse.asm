_FuchsiaGoodRodHouseFishingGuruText::
	text "Hey, that fisher"
	line "over there gave"
	cont "me this."

	para "But I don't like"
	line "fishing!"

	para "Will you take"
	line "it instead?"
	done

_FuchsiaGoodRodHouseFishingGuruReceivedGoodRodText::
	text "Awesome! I hope"
	line "you enjoy it!"

	para "Here you go!"
	line "Happy fishing!"

	para "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer
	text "!@"
	text_end

_FuchsiaGoodRodHouseFishingGuruThatsSoDisappointingText::
	text "Oh... That's so"
	line "disappointing..."
	done

_FuchsiaGoodRodHouseFishingGuruHowAreTheFishText::
	text "Hello there,"
	line "<PLAYER>!"

	para "How are the fish"
	line "biting?"
	done

_FuchsiaGoodRodHouseFishingGuruNoRoomText::
	text "Oh no!"

	para "You have no room"
	line "for it!"
	done
