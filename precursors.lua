SMODS.Joker {
key = 'flower',
loc_txt = {
  name = "Ominous Flower",
  text = {
      "{C:purple}I will create a Joker for you, but:",
      "{C:mult,E:1,s:1.25}You must defeat a Boss Blind.{}",
      "",
      "'                  .'",
      "{C:inactive,s:0.8}This joker will not survive."
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.e_chips, card.ability.extra.e_chips * (G.jokers and #G.jokers.cards or 0) } }
end,
config = { extra = { e_chips = 1 } },
rarity = 3,
experimental = 1,
unlocked = true,
blueprint_compat = true,
atlas = 'lookinside',
pos = { x = 0, y = 0 },
soul_pos = { x = 0, y = 1 },
cost = 26,
friend = 1,
calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_gj_pr' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.YELLOW}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}