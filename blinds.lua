
local a = SMODS.Gradient {
  key = 'bdashfinal',
  colours = { HEX("450061"), HEX("FF0000") },
  interpolation = 'trig',
  cycle = 3
}
SMODS.Blind {
key = 'vesselicvanityphaseone',
dollars = 0,
mult = 256,
boss = {min = 16, max = 10 },
boss_colour = a,
pos = { x = 0, y = 0 },
atlas = 'gj_balatrofinalboss',
set_blind = function()
		G.GAME.round_resets.lost = true
end,
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
      G.GAME.VANITY = true
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
  end
}
SMODS.Blind {
key = 'vesselicvanityphasetwo',
dollars = 0,
mult = 1024,
boss = {min = math.huge, max = 10 },
boss_colour = a,
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
    if context.blind_defeated then
    G.GAME.blind:set_blind(G.P_BLINDS["bl_gj_vesselicvanityphasetwo"])
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
boss = {min = math.huge, max = 10 },
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
end,
}

SMODS.Blind {
    key = "skewer",
    dollars = 5,
    mult = 2,
    debuff = { suit = "gj_icons" },
    pos = { x = 0, y = 0 },
    boss = { min = 1 },
    atlas = "gj_regularblinds",
    boss_colour = HEX("43ff78"),
    calculate = function(self, blind, context)
      if context.debuff_card then
        if context.debuff_card.config.center_key == "j_gj_dlo" then
          return { debuff = true }
        end
        if context.debuff_card.config.center_key == "j_gj_fireicerealjokerlol" then
          return { debuff = true }
        end
      end
  end
}