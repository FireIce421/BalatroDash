
SMODS.Blind {
key = 'unstable',
loc_txt = {
  name = "Vesselic Vanity",
  text = {
    "A terrible stench emanates from the blind...",
    "(Blind cannot be countered in any way, shape or form)",
    "Brutal Blind Size"
  }
},
dollars = 10,
mult = 1024,
boss = {min = 16, max = 10 },
boss_colour = HEX("450061"),
pos = { x = 0, y = 0 },
atlas = 'gj_balatrofinalboss',
calculate = function(self, blind, context)
    if context.debuff_card then
    if context.debuff_card.config.center_key == "j_chicot" then -- yeah no
      return { debuff = true },
      SMODS.destroy_cards(SMODS.find_card("j_chicot"))
    end
    if context.debuff_card.config.center_key == "j_luchador" then
      return { debuff = true }
    end
    if context.debuff_card.config.center_key == "j_yahimod_muchotexto" then
      return { debuff = true }
    end
  end
   if context.setting_blind then
    if next(SMODS.find_card("j_gj_fireicerealjokerlol")) then
      SMODS.destroy_cards(SMODS.find_card("j_gj_fireicerealjokerlol"))
      SMODS.add_card{ key = "j_gj_vessel" }
      SMODS.add_card{ key = "j_gj_gudDetri" } -- temporary
    end
    if next(SMODS.find_card("c_cry_lock")) then
      SMODS.destroy_cards(SMODS.find_card("c_cry_lock"))
    end
    if next(SMODS.find_card("c_entr_dispel")) then
      SMODS.destroy_cards(SMODS.find_card("c_entr_dispel"))
    end
  end
end,
}
SMODS.Blind {
key = 'nouniques',
loc_txt = {
  name = "An Oddity",
  text = {
    "Destroy all 'Unique' Jokers (e_mult was too strong :sob:)",
    "(Blind cannot be countered in any way, shape or form)",
    "Extreme Blind Size"
  }
},
dollars = 7,
mult = 256,
boss = {min = 16, max = 10 },
boss_colour = HEX("525252"),
pos = { x = 0, y = 0 },
atlas = 'gj_balatrofinalboss',
calculate = function(self, blind, context)
    if context.debuff_card then
    if context.debuff_card.config.center_key == "j_chicot" then -- yeah no
      return { debuff = true },
      SMODS.destroy_cards(SMODS.find_card("j_chicot"))
    end
    if context.debuff_card.config.center_key == "j_luchador" then
      return { debuff = true }
    end
    if context.debuff_card.config.center_key == "j_yahimod_muchotexto" then
      return { debuff = true }
    end
  end
   if context.setting_blind then
    if next(SMODS.find_card("j_gj_fireicerealjokerlol")) then
      SMODS.destroy_cards(SMODS.find_card("j_gj_fireicerealjokerlol"))
    end
    if next(SMODS.find_card("j_gj_dlo")) then
      SMODS.destroy_cards(SMODS.find_card("j_gj_dlo"))
    end
  end
end,
}
