SMODS.Challenge {
    key = 'levelOne',
    jokers = {
        { id = 'j_gj_gudDetri', edition = 'negative', eternal = true },
    },
    button_colour = HEX('450061')
}
SMODS.Challenge {
    key = 'levelTwo',
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
if next(SMODS.find_mod("ocstobalatro")) then
SMODS.Challenge {
    key = 'levelEX1',
    jokers = {
        { id = 'j_ocstobal_reclusivevessel',eternal = true },
        { id = "j_gj_vessel", edition = 'negative', eternal = true},
    },
    button_colour = HEX('000000')
}
end