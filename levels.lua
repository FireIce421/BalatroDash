SMODS.Joker {
  key = 'stereom',

  loc_txt = {
    name = 'Stereo Madness',
    text = {
      "{C:mult}+#1#{} Mult for every Card",
      "{C:inactive}(Card must Score){}"
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 6 } },
  rarity = 'gj_ez',
  unlocked = true,
  blueprint_compat = true,
  mainlevel = true,
  firstrelease = true,
  atlas = 'jokerList',
  pos = { x = 0, y = 0 },
  cost = 4,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_face() or not context.other_card:is_face() then
      return {
         mult_mod = card.ability.extra.mult,
         message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
  end
end
}

SMODS.Joker {
 key = 'backont',
 loc_txt = {
   name = 'Back on Track',
   text = {
     "{C:chips}+#1#{} Chips for every Face Card",
     "{C:inactive}(Card must Score){}"
   }
 },
 loc_vars = function(self, info_queue, card)
   return { vars = { card.ability.extra.chips } }
 end,
 config = { extra = { chips = 90 } },
 rarity = 'gj_ez',
 unlocked = true,
 mainlevel = true,
 firstrelease = true,
 blueprint_compat = true,
 atlas = 'jokerList',
 pos = { x = 1, y = 0 },
 cost = 5,
 calculate = function(self, card, context)
  if context.individual and context.cardarea == G.play then
    if context.other_card:is_face() then
      return {chips = card.ability.extra.chips}
    end
  end
end
}

SMODS.Joker {
key = 'polar',
loc_txt = {
 name = 'Polargeist',
 text = {
   "Retrigger each non-Face Card once.",
   "{C:inactive}Wait, isn't that just reverse Sock and Busk- CARD MUST SCORE.{}"
 }
},
 loc_vars = function(self, info_queue, card)
   return { vars = { card.ability.extra.repetitions } }
 end,
config = { extra = { repetitions = 1 } },
rarity = 'gj_norm',
unlocked = true,
mainlevel = true,
firstrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 2, y = 0 },
cost = 7,
calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if not context.other_card:is_face() then
				return {
					message = 'Attempt 2',
					repetitions = card.ability.extra.repetitions,
					card = context.other_card
				}
			end
		end
	end
}
SMODS.Joker {
key = 'dryout',
loc_txt = {
  name = 'Dry Out',
  text = {
    'For each round without selling anything, gain {C:mult}+#1#{} Mult, otherwise {C:attention}reset{}',
    '{C:inactive}Activates an additional time per scored card',
    '{C:inactive}(Currently: {C:mult}+#2#{}{C:inactive}){}',
    '{C:inactive}please let me rest i dont want to buff this more'
    }
},
loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_mod, card.ability.extra.mult } }
end,
config = { extra = { mult = 0, mult_mod = 20 } },
rarity = 'gj_norm',
unlocked = true,
discovered = true,
mainlevel = true,
firstrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 3, y = 0 },
cost = 8,
calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and not context.retrigger_joker then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
    end
    if context.cardarea == G.play and context.main_scoring then
        return {
        mult = card.ability.extra.mult,
        message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult } }
        }
    end
    if context.joker_main then
        return {
        mult = card.ability.extra.mult,
        message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult } }
        }
    end
    if context.selling_card and context.cardarea == G.jokers then
        card.ability.extra.mult = 0
    end
end,
}

SMODS.Joker {
key = 'base',
loc_txt = {
  name = 'Base After Base',
  text = {
    "{X:chips,C:white}+X0.1{} Chips per scored card",
    "{C:inactive}Starts at X1"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.x_chips } }
end,
config = { extra = { x_chips = 1 } },
rarity = 'gj_hr',
unlocked = true,
mainlevel = true,
firstrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 4, y = 0 },
cost = 10,
calculate = function(self, card, context)
if context.cardarea == G.play and context.individual then
    for i = 1, #G.play.cards do
      if context.other_card == G.play.cards[i] then
        return {
          x_chips = card.ability.extra.x_chips + (i/4),
        }
      end
    end
  end
end
}

SMODS.Joker {
key = 'clg',
loc_txt = {
  name = 'Cant Let Go',
  text = {
    "Destroy Joker to the Left",
    "Gain 6.25% of its sell value as {X:mult,C:white}XMult{}",
    "{C:inactive}Currently: {X:mult,C:white}X#1#{C:inactive} Mult"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult } }
end,
config = { extra = { mult = 1 } },
rarity = 'gj_hr',
unlocked = true,
mainlevel = true,
firstrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 0, y = 1 },
cost = 10,
calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos > 1 then
                        local joker = G.jokers.cards[my_pos - 1]
                        if true and not joker.getting_sliced then
                            target_joker = joker
                        end
                    end
                    
                    if target_joker then
                        local joker_sell_value = target_joker.sell_cost or 0
                        local sell_value_gain = joker_sell_value * 1
                        card.ability.extra.mult = card.ability.extra.mult + (sell_value_gain/16)
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_mult = card.ability.extra.mult
            }
        end
end
}
SMODS.Joker {
key = 'ultimate',
loc_txt = {
  name = 'Ultimate Destruction',
  text = {
      "{C:chips}+#2# Chips{}, compounding.",
      "{C:mult}+#1# Mult{}, compounding."
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
end,
config = { extra = { mult = 0, chips = 0 } },
rarity = 'gj_na',
unlocked = true,
mainlevel = true,
unreleased = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 1, y = 1 },
cost = 10,
calculate = function(self, card, context)
  if context.joker_main then
    card.ability.extra.mult_gain = 2
    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
    card.ability.extra.chip_gain = 25
    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
    return {
      mult = card.ability.extra.mult,
      chips = card.ability.extra.chips
    }
  end
end
}
SMODS.Joker {
key = 'jmp',
loc_txt = {
  name = 'Jumper',
  text = {
    "When a card is scored this Joker gives {C:mult}+#1#{} Mult",
    "{C:inactive}Amount of given Mult scales with each played card (8 -> 16 and so on...)",
    "{C:inactive,s:0.75}Wait, are you telling me the card DOESN'T have to score?{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.perma_mult } }
end,
config = { extra = { perma_mult = 5 } },
rarity = 'gj_hrdr',
unlocked = true,
mainlevel = true,
firstrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 1, y = 1 },
cost = 10,
calculate = function(self, card, context)
  if context.cardarea == G.play and context.individual then
    for i = 1, #G.play.cards do
      if context.other_card == G.play.cards[i] then
        return {
          mult = card.ability.extra.mult * i,
        }
      end
    end
  end
end
}
SMODS.Joker {
key = 'tmach',
loc_txt = {
  name = 'Time Machine',
  text = {
    "Each {C:dark_edition}scored{} card gains",
    "{C:mult}+#1#{} Bonus Mult",
    "{C:inactive,s:0.75}Stacks{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.perma_mult } }
end,
config = { extra = { perma_mult = 5 } },
rarity = 'gj_hrdr',
unlocked = true,
mainlevel = true,
broken = 1,
secondrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 2, y = 1 },
cost = 12,
calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
            }
        end
    end
}
SMODS.Joker {
  key = 'cycl',
  loc_txt = {
    name = 'Cycles',
    text = {
      "{C:attention}+#1#{} Hand Size",
      "+1 additonal Hand Size when a Blind is defeated",
      "Resets at the start of Each Ante"
    }
  },
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.handsize } }
end,
config = { extra = { handsize = 1 } },
rarity = 'gj_hrdr',
unlocked = true,
mainlevel = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 1, y = 1 },
cost = 12,
onepointtwo = 1,
calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil)
                    
                    G.hand:change_size(card.ability.extra.handsize)
                    return true
                end
            }
        end
        if context.ante_change  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil)
                    
                    local current_hand_size = (G.hand.config.card_limit or 0)
                    local target_hand_size = 8
                    local difference = target_hand_size - current_hand_size
                    G.hand:change_size(difference)
                    return true
                end
            }
        end
    end
}
SMODS.Joker {
key = 'dash',
loc_txt = {
  name = 'Dash',
  text = {
    "{C:green}#2# in #3#{} chance to retrigger each {C:attention}6{} 6 times.",
    "{C:inactive}So, I've heard you like the number {C:green}6{C:inactive}.{}",
    " ",
    "{C:inactive}Code inspired from: {C:chips}POLTERWORX{}",
    "{s:0.5,C:chips}The Sigil{s:0.5} is gone, but the{s:0.5,C:green} memory{s:0.5} remains.{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
end,
config = { extra = { repetitions = 6, odds = 6 } },
rarity = 'gj_ins',
unlocked = true,
mainlevel = true,
latestrelease = true,
blueprint_compat = false,
atlas = 'jokerList',
pos = { x = 2, y = 1 },
cost = 24,
calculate = function(self, card, context)
  if pseudorandom('dash') < G.GAME.probabilities.normal / card.ability.extra.odds then
    if not context.blueprint_card then
      if context.repetition then
        if context.cardarea == G.play then
          if context.other_card:get_id() == 6 then
            return {
              repetitions = 6,
              message = "Unsightreadable...",
              colour = G.C.YELLOW,
              card = card
            }
          end
        end
      end
    end
  end
end
}

