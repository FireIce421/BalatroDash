SMODS.Joker {
key = 'pr',
loc_txt = {
  name = "{s:0.75}(Asteria){} Pry Stellar!",
  text = {
    "When a {C:planet}Planet{} card is used, gain {X:mult,C:white}^#2#{} Mult",
    "{C:inactive}(Currently {X:mult,C:white}^#1#{C:inactive} Mult)",
    "{C:inactive,s:0.7}Double Gain if you have Aralin",
    "{C:inactive}Oh,,,, hai!!! heiii!!!! hii!!!!!!!{}",
    "{C:inactive}OC by: KITTIIZZ_X3 {}",
    "{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}gudusername_53951",
    "{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}Slipstream",
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_mult, card.ability.extra.Emult_mod } }
end,
config = { extra = { e_mult = 1, Emult_mod = 0.25 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 0 },
soul_pos = { x = 1, y = 0 },
cost = 26,
friend = 1,
calculate = function(self, card, context)
  if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
  card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.Emult_mod
end
 if context.joker_main then
    return {
      e_mult = card.ability.extra.e_mult * (next(SMODS.find_card("j_gj_aralin")) and 2 or 1)
    }
  end
end
}
SMODS.Joker {
key = 'dlo',
loc_txt = {
  name = "DlovanSlayer",
  text = {
    "For every used {X:spectral,C:white}Spectral{} or {X:tarot,C:white}Tarot{} card, add {X:mult,C:white}x#3#{} Mult and {X:chips,C:white}x#4#{} Chips",
    "{X:chips,C:white}XChips{} will be applied {C:mult}first{}, then {X:mult,C:white}XMult{}",
    "{C:inactive}Hello there!{}",
    "{C:inactive}OC by: DlovanSl {}",
    "{s:0.5}Note: {X:spectral,C:white}Spectrals{} will add {X:mult,C:white}XMult{} and {X:tarot,C:white}Tarots{} will add {X:chips,C:white}XChips{}{}",
    "",
    "As a drawback, {X:chips,C:white}XChips{} and {X:mult,C:white}XMult{} will be {X:dark,C:white}divided{} by #5#.",
    "Increase the {X:dark,C:white}division{} denominator by #6# at the end of each round", -- if you dont solve this, it will be your downfall
    "Currently: {X:mult,C:white}x#1#{}, {X:chips,C:white}x#2#{},{X:dark,C:white}/#5#(+#6#){}",
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.x_mult, card.ability.extra.x_chips, card.ability.extra.x_multGain, card.ability.extra.x_chipsGain, card.ability.extra.divExp, card.ability.extra.divGain } }
end,
config = { extra = { x_mult = 1, x_chips = 1, x_multGain = 1, x_chipsGain = 0.5, divExp = 1, divGain = 0.05 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 1 },
soul_pos = { x = 1, y = 1 },
cost = 26,
friend = 1,
calculate = function(self, card, context)
  if context.using_consumeable and context.consumeable.ability.set == "Spectral" and not context.blueprint then
  card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_multGain
end
  if context.using_consumeable and context.consumeable.ability.set == "Tarot" and not context.blueprint then
  card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.x_chipsGain
  end
 if context.joker_main then
  return {
    x_mult = card.ability.extra.x_mult / card.ability.extra.divExp,
    x_chips = card.ability.extra.x_chips / card.ability.extra.divExp
 }
  end
if context.end_of_round and context.cardarea == G.jokers then
  card.ability.extra.divExp = card.ability.extra.divExp + card.ability.extra.divGain
end
end
}
  SMODS.Joker {
key = 'fireicerealjokerlol',
loc_txt = {
  name = "FireIce",
  text = {
    "{X:dark,C:white}+1{} {X:chips,C:white}Chips{X:mult,C:white}Mult{C:inactive} operator",
    "{C:inactive}Released to facilitate Boss Blind.",
    "{C:purple,E:1,s:0.6}Something bad will happen on (or past) {C:dark_edition,s:0.6}Ante 16{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_chips, card.ability.extra.e_chipsGain } }
end,
config = { extra = { e_chips = 1, e_chipsGain = 1 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 2 },
soul_pos = { x = 1, y = 2 },
cost = 26,
thecaticon = 1,

  add_to_deck = function(self, card, from_debuff)
      SMODS.set_scoring_calculation('exponent')
  end,
  remove_from_deck = function(self, card, from_debuff)
      SMODS.set_scoring_calculation('multiply')
  end
}
SMODS.Joker {
key = 'vessel',
loc_txt = {
  name = "{C:red}Unstable Vessel",
  text = {
    "{C:purple,s:3}You don't want to know.{}",
    "{X:dark_edition,C:white,E:1,s:0.7}^^^#1#{C:inactive,s:0.7} Chips and Mult",
    "{X:attention,C:white,E:1,s:0.7}^#2#{C:inactive,s:0.7} Blind Requirement",
    "{C:red,E:2,s:0.8}Certain mods will have additional effects on this joker.",
    "{E:1,C:purple,s:0.8}Something is still holding it together..."  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.eee_chips, card.ability.extra.e_blind } }
end,
config = { extra = { eee_chips = 0.1, e_blind = 4.21 } },
rarity = 'gj_detri',
unlocked = true,
blueprint_compat = true,
eternal = 1,
atlas = 'uniq',
pos = { x = 0, y = 3 },
soul_pos = { x = 1, y = 3 },
cost = -1,
set_ability = function(self, card, initial)
  card:set_eternal(true)
end,
calculate = function(self, card, context)
            if context.setting_blind and not card.getting_sliced and not context.blueprint then
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips ^ card.ability.extra.e_blind)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    chips_UI:juice_up()

                    if not silent then play_sound('chips2') end
                return true end }))
            end
            if context.joker_main then
              return {
                eee_chips = card.ability.extra.eee_chips,
                eee_mult = card.ability.extra.eee_chips
              }
            end
            if context.end_of_round then
              SMODS.destroy_cards(SMODS.find_card("j_gj_vessel"), true, false, false)
            end
        end
}

SMODS.Joker {
key = 'aralin',
loc_txt = {
  name = "Aralin",
  text = {
    "Gain {X:chips,C:white}^#1#{} Chips, based on Jokers",
    "{C:inactive}(Currently {X:chips,C:white}^#2#{C:inactive} Chips)",
    "{C:inactive,s:0.7}Double Gain if you have Pry Stellar",
    "{C:inactive}where me {}{E:1,X:money,C:white}w{E:1,X:red,C:white}if{E:1,X:purple,C:white}e{}",
    "{C:inactive}OC by: Volcanic_M1st {}",
    "{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}gudusername_53951",
    "{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}FireIce",
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_chips, card.ability.extra.e_chips * (G.jokers and #G.jokers.cards or 0) } }
end,
config = { extra = { e_chips = 1 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 4 },
soul_pos = { x = 1, y = 4 },
cost = 26,
friend = 1,
calculate = function(self, card, context)
if context.joker_main then
  return {
  e_chips = card.ability.extra.e_chips * (#G.jokers.cards * (next(SMODS.find_card("j_gj_pr")) and 2 or 1))
  }
end
end
}

SMODS.Joker {
key = 'gudDetri',
loc_txt = {
  name = "Gud",
  text = {
    "{X:dark,C:white}/(Ante*Round){} Chips and Mult",
    "{C:inactive}Currently: {X:dark,C:white}/#1#{}",
    "{C:inactive,s:0.8}Updates when Blind is Selected{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.cur_denom, card.ability.extra.x_chips, card.ability.extra.x_mult } }
end,
config = { extra = { x_chips = 1, x_mult = 1 } },
rarity = 'gj_detri',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 5 },
soul_pos = { x = 1, y = 5 },
cost = -1,
eternal = 1,
friend = 1,
calculate = function(self, card, context)
  if context.joker_main then
    return {
      x_chips = card.ability.extra.x_chips / card.ability.extra.cur_denom,
      x_mult = card.ability.extra.x_mult / card.ability.extra.cur_denom
    }
  end
  if context.setting_blind then
      card.ability.extra.cur_denom = G.GAME.round_resets.ante * G.GAME.round
  end
end,
  add_to_deck = function(self, card, from_debuff)
      card.ability.extra.cur_denom = G.GAME.round_resets.ante * G.GAME.round
  end
}

SMODS.Joker {
key = 'felix',
loc_txt = {
  name = "Felix Josiah",
  text = {
      "Create two{C:spectral} Spectral{C:inactive} Cards when a Blind is defeated.",
      "Create an additional {C:dark_edition}Negative {C:spectral}Spectral {C:inactive}when a {C:attention}Boss Blind{C:inactive} is defeated."
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_chips, card.ability.extra.e_chips * (G.jokers and #G.jokers.cards or 0) } }
end,
config = { extra = { e_chips = 1 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 6 },
soul_pos = { x = 1, y = 6 },
cost = 26,
friend = 1,
calculate = function(self, card, context)
      if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        
                        for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end,
                    colour = G.C.SECONDARY_SET.Spectral
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    
                    for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Spectral', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end
            }
        end
    end
}

--[[ SMODS.Atlas {
key = "seal_atlas",
path = "modded_seal.png",
px = 71,
py = 95
} ]]
