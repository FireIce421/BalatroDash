SMODS.JimboQuip({
	key = 'vessel1',
	type = 'loss',
    loc_txt = {
            "TRY AGAIN",
            "{E:1,C:red}IF YOU DARE"
    },
    extra = {
        center = 'j_gj_vessel',
        particle_colours = {
            HEX('450061'),
            HEX('FFFFFF'),
            G.C.DARK_EDITION
        }
    },
    filter = function(self, type)
	if next(SMODS.find_card('j_gj_vessel')) then
		return true, {weight = 1000}
	end
end
})


SMODS.JimboQuip({
	key = 'pry1',
	type = 'loss',
    loc_txt = {
            "can you lock the fuck in",
    },
    extra = {
        center = 'j_gj_pr',
        particle_colours = {
            G.C.YELLOW,
            HEX('FF0000'),
            HEX('FF00FF')
        }
    },
    filter = function(self, type)
	if next(SMODS.find_card('j_gj_pr')) then
		return true, {weight = 1000}
	end
end
})

SMODS.JimboQuip({
	key = 'fireice1',
	type = 'loss',
    loc_txt = {
            "Did you forget,",
            "that {C:dark_edition,E:1}cards must score{}?"
    },
    extra = {
        center = 'j_gj_fireicerealjokerlol',
        particle_colours = {
            G.C.PURPLE,
            HEX('450061'),
            G.C.WHITE
        }
    },
    filter = function(self, type)
	if next(SMODS.find_card('j_gj_fireicerealjokerlol')) then
		return true, {weight = 1000}
	end
end
})

-- //jokers past this point\\

SMODS.Joker {
    key = "challengeExtender1",
    loc_txt = {
        name = "Challenge Extender",
        text = {
            "Sets Winning Ante to 16",
            "{C:inactive,s:0.9}Does not appear in the collection"
        }
    },
    rarity = 'gj_detri',
    pos = { x = 0, y = 0 },
    no_collection = true,
    config = { extra = { ante = 16 }},
    
set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.win_ante = 16
                            return true
                        end
                    }))
                    return true
                end,
                message = "Winner Ante set to " .. 16 .. "!",
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Good Luck!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}