
SMODS.Blind {
key = 'unstable',
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
SMODS.Blind {
key = 'truevessel',
loc_txt = {
  name = "Unstable Vessel",
  text = {
    "CINEMA Blind Size",
  }
},
dollars = 0,
mult = 65535,
boss = {min = 421, max = 10 },
boss_colour = HEX("450061"),
atlas = 'uniq',
pos = { x = 1, y = 3 },
soul_pos = { x = 0, y = 3 },
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
    G.GAME.fightBack = true
  end
  if context.blind_defeated then
    G.GAME.fightBack = false
  end
end,
}
