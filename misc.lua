SMODS.JimboQuip({
	key = 'vessel1',
	type = 'loss',
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
	type = 'loss',ra = {
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
SMODS.JimboQuip({
	key = 'fireice2',
	type = 'loss',
    extra = {
        center = 'j_gj_fireicerealjokerlol',
        particle_colours = {
            G.C.PURPLE,
            HEX('450061'),
            G.C.WHITE
        },
        times = 1, -- number of times to play sounds
	    pitch = 1, -- pitch of sounds
	    sound = 'gj_laugh1'
    },
    filter = function(self, type)
	if next(SMODS.find_card('j_gj_fireicerealjokerlol')) then
		return true, {weight = 1000}
	end
end
})
SMODS.JimboQuip({
	key = 'fireice3',
	type = 'loss',
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

-- \\sound//
SMODS.Sound {
    key = "laugh1",
    path = "snd_laugh1.ogg"
}

-- other things

function bdash_event_bonus_new_round(blind_key, extra_config)
    G.RESET_JIGGLES = nil
    delay(0.4)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
            G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
            G.GAME.current_round.hands_played = 0
            G.GAME.current_round.discards_used = 0
            G.GAME.current_round.reroll_cost_increase = 0
            G.GAME.current_round.used_packs = {}

            for k, v in pairs(G.GAME.hands) do
                v.played_this_round = 0
            end

            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end

            G.GAME.round_bonus.next_hands = 0
            G.GAME.round_bonus.discards = 0

            local blhash = 'S'
            G.GAME.subhash = (G.GAME.round_resets.ante) .. (blhash)

            G.GAME.blind_on_deck = 'Combat'
            G.GAME.blind:set_blind(G.P_BLINDS[blind_key])
            G.GAME.blind.effect.bdash_combat_bonus = extra_config or {}
            for _, v in ipairs(G.playing_cards) do
                SMODS.recalc_debuff(v)
            end
            for _, v in ipairs(G.jokers.cards) do
                SMODS.recalc_debuff(v)
            end
            G.GAME.last_blind.boss = nil
            G.HUD_blind.alignment.offset.y = -10
            G.HUD_blind:recalculate(false)

            SMODS.calculate_context({ setting_blind = true, blind = G.P_BLINDS[blind_key] })
            delay(0.4)

            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.STATE = G.STATES.DRAW_TO_HAND
                    G.deck:shuffle('bdash_nr' .. G.GAME.round_resets.ante)
                    G.deck:hard_set_T()
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
            return true
        end
    }))
end