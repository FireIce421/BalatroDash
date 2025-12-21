SMODS.Challenge {
    key = 'levelOne',
    loc_txt = {
        name = "Not So Gud"
    },
    jokers = {
        { id = 'j_gj_gudDetri', edition = 'negative', eternal = true },
    },
    button_colour = HEX('450061')
}
SMODS.Challenge {
    key = 'levelTwo',
    loc_txt = {
        name = "Stellarity"
    },
    jokers = {
        { id = 'j_gj_flower', edition = 'negative' },
        { id = "j_astronomer", eternal = true},
        { id = "j_gj_challengeExtender1", eternal = true}
    },
    restrictions = {
        banned_cards = {
            { id = 'j_gj_aralin' },
        }
    },
    button_colour = HEX('450061')
}