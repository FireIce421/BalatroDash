local is_in_shop = G.STATE == G.STATES.SHOP

SMODS.Joker {
key = 'pr',
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
      change_operator(1)
  end,
  remove_from_deck = function(self, card, from_debuff)
      change_operator(-1)
  end
}
SMODS.Joker {
key = 'vessel',
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_chips, card.ability.extra.e_blind } }
end,
config = { extra = { e_chips = 0.5, e_blind = 1.5 } },
rarity = 'gj_detri',
unlocked = true,
blueprint_compat = true,
eternal = 1,
atlas = 'uniq',
pos = { x = 0, y = 3 },
soul_pos = { x = 1, y = 3 },
cost = -999,
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

                    play_sound('chips2')
                return true end }))
            end
            if context.joker_main then
              return {
                e_chips = card.ability.extra.e_chips,
                e_mult = card.ability.extra.e_chips
              }
            end
            if context.starting_shop then
              if G.GAME.challenge ~= "c_gj_levelEX1" then
              card:set_eternal(false)
              end
            end
        if context.ending_shop  then
          card:set_eternal(true)
        end
          end,
  remove_from_deck = function(self, card, from_debuff)
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.5,
        func = function()
          G.SHOP_SIGN:remove()
          G.SHOP_SIGN = nil
          return true
        end
      }))
      bdash_event_bonus_new_round("bl_gj_truevessel", 0)
  end
}

SMODS.Joker {
key = 'aralin',
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
set_ability = function(self, card, initial)
  card:set_eternal(true)
end,
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
