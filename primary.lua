--- STEAMODDED HEADER

--- MOD_NAME: Balatro Dash
--- MOD_ID: geometrydash
--- MOD_AUTHOR: [FireIce]
--- MOD_DESCRIPTION: (Insanely Heavy WIP) Adds a whole lot of things based on Geometry Dash Levels and Icons!
--- PRIORITY: 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
--- BADGE_COLOR: 00cc00
--- PREFIX: gj
--- VERSION: 0.0.0a
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-1216c]
--- LOADER_VERSION_GEQ: 1.0.0

SMODS.Atlas {
    -- Key for code to find it with
    key = "jokerList",
    -- The name of the file, for the code to pull the atlas from
    path = "GJ_jokerList.png",
    -- Width of each sprite in 1x size
    px = 69,
    -- Height of each sprite in 1x size
    py = 93
  }
  SMODS.Atlas {
    -- Key for code to find it with
    key = "cubeConsumable",
    -- The name of the file, for the code to pull the atlas from
    path = "GJ_cubeConsumable.png",
    -- Width of each sprite in 1x size
    px = 71,
    -- Height of each sprite in 1x size
    py = 95
  }

local gj_modifierbadges = {
	mainlevel = {
		text = {
			'Main Level',
			'Gamemode: Classic',
      'Level By: RobTop'
		},
		col = HEX('ffffff'),
		tcol = G.C.BLACK
	},
	firstrelease = {
		text = {
			'Update Released: 1.0',
			'Release Date: August 13th 2013'
		},
		col = HEX('6666ff'),
		tcol = G.C.WHITE
	},
  secondrelease = {
    text = {
			'Update Released: 1.1',
			'Release Date: September 10th 2013'
		},
		col = HEX('6666ff'),
		tcol = G.C.WHITE
  },
	mainplatformer = {
		text = {
			'The Tower',
			'Gamemode: Platformer',
      'Level By: RobTop'
		},
		col = HEX('525252'),
		tcol = G.C.WHITE
	},
	latestrelease = {
		text = {
			'Update Released: 2.2',
      'Release Date: December 23rd 2023'
		},
		col = HEX('525252'),
		tcol = G.C.WHITE
	},
	thecaticon = {
		text = {
			'Icon Series', 
      'FIREICE'
		},
		col = HEX('450061'),
		tcol = G.C.WHITE
	},
	zhen = {
		text = {
			'Icon Series',
      'ROBTOP'
		},
		col = HEX('666600'),
		tcol = G.C.WHITE
	},
	cryptnay = {
		text = {
			'Cryptid-Inspired Consumable',
      'Does not require base Cryptid'
		},
		col = HEX('2E76FD'),
		tcol = G.C.WHITE
	},
	cryptyay = {
		text = {
			'Cryptid-Inspired Consumable',
      'Requires base Cryptid'
		},
		col = HEX('2E76FD'),
		tcol = G.C.WHITE
	},
	rabbit = {
		text = {
			'Icon Series',
      'OCKSIE'
		},
		col = HEX('ffaaff'),
		tcol = G.C.BLACK
	},
	xolotl = {
		text = {
			'Icon Series',
      'APHI.S.SOOS'
		},
		col = HEX('ffffff'),
		tcol = G.C.BLACK
	},
	thespriter = {
		text = {
			'Icon Series',
      'GUD_USERNAME'
		},
		col = HEX('6666ff'),
		tcol = G.C.BLACK
	},
	sealer = {
		text = {
			'Icon Series',
      'ASTRALIGHTSKY'
		},
		col = HEX('000000'),
		tcol = G.C.WHITE
	},
	lexi = {
		text = {
			'Icon Series',
      'LEXI'
		},
		col = HEX('000000'),
		tcol = G.C.WHITE
	},
	m = {
		text = {
			'Cryptid-Inspired ConsuMable',
      'M'
		},
		col = G.C.SPECTRAL,
		tcol = G.C.WHITE
	},
}
local function calculate_scalefactor(text)
	local size = 0.9
	local font = G.LANG.font
	local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
	local calced_text_width = 0
	for _, c in utf8.chars(text) do
		local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
		calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
	end
	local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
	return scale_fac
end

--also borrowed from older version of cryptid
local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if obj and obj.misc_badge then
		local scale_fac = {}
		local scale_fac_len = 1
		if obj.misc_badge and obj.misc_badge.text then
			for i = 1, #obj.misc_badge.text do
				local calced_scale = calculate_scalefactor(obj.misc_badge.text[i])
				scale_fac[i] = calced_scale
				scale_fac_len = math.min(scale_fac_len, calced_scale)
			end
		end
		local ct = {}
		for i = 1, #obj.misc_badge.text do
			ct[i] = {
				string = obj.misc_badge.text[i]
			}
		end
		badges[#badges + 1] = {
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						colour = obj.misc_badge and obj.misc_badge.colour or G.C.RED,
						r = 0.1,
						minw = 2/scale_fac_len,
						minh = 0.36,
						emboss = 0.05,
						padding = 0.03 * 0.9,
					},
					nodes = {
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = ct or "ERROR",
									colours = { obj.misc_badge and obj.misc_badge.text_colour or G.C.WHITE },
									silent = true,
									float = true,
									shadow = true,
									offset_y = -0.03,
									spacing = 1,
									scale = 0.33 * 0.9,
								}),
							},
						},
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
					},
				},
			},
		}
	end
	if obj then
		for k, v in pairs(gj_modifierbadges) do
			if obj[k] then
				local scale_fac = {}
				local scale_fac_len = 1
				if v.text then
					for i = 1, #v.text do
						local calced_scale = calculate_scalefactor(v.text[i])
						scale_fac[i] = calced_scale
						scale_fac_len = math.min(scale_fac_len, calced_scale)
					end
				end
				local ct = {}
				for i = 1, #v.text do
					ct[i] = {
						string = v.text[i]
					}
				end
				badges[#badges + 1] = {
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						{
							n = G.UIT.R,
							config = {
								align = "cm",
								colour = v and v.col or G.C.RED,
								r = 0.1,
								minw = 2/scale_fac_len,
								minh = 0.36,
								emboss = 0.05,
								padding = 0.03 * 0.9,
							},
							nodes = {
								{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
								{
									n = G.UIT.O,
									config = {
										object = DynaText({
											string = ct or "ERROR",
											colours = { v and v.tcol or G.C.WHITE },
											silent = true,
											float = true,
											shadow = true,
											offset_y = -0.03,
											spacing = 1,
											scale = 0.33 * 0.9,
										}),
									},
								},
								{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							},
						},
					},
				}
			end
		end
	end
end


SMODS.Rarity {
  key = "ez",
  loc_txt = {
    name = 'Easy', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('1114aa'),
}
SMODS.Rarity {
  key = "norm",
  loc_txt = {
    name = 'Normal', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('00aa00'),
}
SMODS.Rarity {
  key = "hr",
  loc_txt = {
    name = 'Hard', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('aaaa00'),
}
SMODS.Rarity {
  key = "hrdr",
  loc_txt = {
    name = 'Harder', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('aa0000'),
}
SMODS.Rarity {
  key = "ins",
  loc_txt = {
    name = 'Insane', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('ff00ff'),
}
SMODS.Rarity {
  key = "hrdm",
  loc_txt = {
    name = 'Hard Demon', -- used on rarity badge
  },
  pools = {
    ["Joker"] = true --uses self.default_rate when polled
  },
  badge_colour = HEX('ff0000'),
}

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
     "Retrigger each non-Face Card Once.",
     "{C:inactive}Wait, isn't that just reverse Sock and Busk- CARD MUST SCORE.{}"
   }
 },
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
        message = 'REPEAT',
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
      '{C:inactive}(Currently: {C:mult}+#2#{}{C:inactive}){}'
      }
  },
  loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.mult_mod, card.ability.extra.mult } }
  end,
  config = { extra = { mult = 0, mult_mod = 8 } },
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
      "{C:chips}+#1# Chips{}, compounding.",
      "{C:inactive}Value will ALWAYS go up by 25, it's hardcoded!",
      "{C:mult}Unaffected by Scaling Jokers. (ex.: Gemini)"
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  config = { extra = { chips = 0 } },
  rarity = 'gj_hr',
  unlocked = true,
  mainlevel = true,
  firstrelease = true,
  blueprint_compat = true,
  atlas = 'jokerList',
  pos = { x = 4, y = 0 },
  cost = 10,
  calculate = function(self, card, context)
    if context.joker_main then
    card.ability.extra.chip_gain = 25
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      return {
        chips = card.ability.extra.chips
      }
    end
  end
 }

 SMODS.Joker {
  key = 'clg',
  loc_txt = {
    name = 'Cant Let Go',
    text = {
      "{C:mult}+#1# Mult{}, compounding.",
      "{C:inactive}Value will ALWAYS go up by 2, it's hardcoded!",
      "{C:mult}Unaffected by Scaling Jokers. (ex.: Gemini)"
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 0 } },
  rarity = 'gj_hr',
  unlocked = true,
  mainlevel = true,
  firstrelease = true,
  blueprint_compat = true,
  atlas = 'jokerList',
  pos = { x = 0, y = 1 },
  cost = 10,
  calculate = function(self, card, context)
    if context.joker_main then
      card.ability.extra.mult_gain = 2
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      return {
        mult = card.ability.extra.mult
      }
    end
  end
 }
 SMODS.Joker {
  key = 'jmp',
  loc_txt = {
    name = 'Jumper',
    text = {
      "When a card is scored this joker gives {C:mult}+#1#{} Mult",
      "{C:inactive}amount of mult given is increased by the amount of cards in play",
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 8 } },
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
      "{C:mult}No Effect.{}",
      " "
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 1 } },
  rarity = 'gj_hrdr',
  unlocked = true,
  mainlevel = true,
  secondrelease = true,
  blueprint_compat = true,
  atlas = 'jokerList',
  pos = { x = 2, y = 1 },
  cost = 12,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        -- mult_mod = card.ability.extra.mult,
        -- message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
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
      "{C:inactive}Code inspired from: {C:chips}Jen's Almanac{}"
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
 SMODS.Joker {
  key = 'duplabel',
  loc_txt = {
    name = "duplicate label 'continue'",
    text = {
      "{C:mult}No Effect.{}",
      "{C:inactive}ALMANAC IS CRASHING: DUPLICATE LABEL 'CONTINUE'{}"
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 1 } },
  rarity = 1,
  unlocked = true,
  blueprint_compat = true,
  atlas = 'jokerList',
  pos = { x = 0, y = 2 },
  cost = 20,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        -- mult_mod = card.ability.extra.mult,
        -- message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
  end
 }
 SMODS.Joker {
  key = 'gullible',
  loc_txt = {
    name = "Gullible",
    text = {
      "{C:mult}No Effect.{}",
      "{C:inactive}Hey, it says 'gullible' on the ceiling!{}"
    }
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  config = { extra = { mult = 1 } },
  rarity = 3,
  unlocked = true,
  blueprint_compat = true,
  atlas = 'jokerList',
  pos = { x = 1, y = 2 },
  cost = 16,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        -- mult_mod = card.ability.extra.mult,
        -- message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
  end
 }
SMODS.ConsumableType {
	key = 'cube',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('aa3311'),
	loc_txt = {
		collection = 'Cubes',
		name = 'Cube'
	},
	shop_rate = 2
}
--[[ SMODS.ConsumableType {
	key = 'ship',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('f4b6cc'),
	loc_txt = {
		collection = 'Ships',
		name = 'Ship'
	},
	shop_rate = 2
} ]]
SMODS.ConsumableType {
	key = 'ball',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('a576cb'),
	loc_txt = {
		collection = 'Balls',
		name = 'Ball'
	},
	shop_rate = 2
} --[[
SMODS.ConsumableType {
	key = 'ufo',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('145afd'),
	loc_txt = {
		collection = 'UFOs',
		name = 'UFO'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'wave',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('456dcb'),
	loc_txt = {
		collection = 'Waves',
		name = 'Wave'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'robot',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('768aaa'),
	loc_txt = {
		collection = 'Robots',
		name = 'Robot'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'spider',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('acbfde'),
	loc_txt = {
		collection = 'Spiders',
		name = 'Spider'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'swing',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('123abc'),
	loc_txt = {
		collection = 'Swings',
		name = 'Swing'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'jetpack',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('654812'),
	loc_txt = {
		collection = 'Jetpacks',
		name = 'Jetpack'
	},
	shop_rate = 2
}
SMODS.ConsumableType {
	key = 'gj_edit',
	collection_rows = {7, 7, 7},
	primary_colour = G.C.CHIPS,
	secondary_colour = HEX('aaaaff'),
	loc_txt = {
		collection = 'Editor Functions',
		name = 'Editor'
	},
	shop_rate = 2
} ]]
SMODS.Consumable {
  key = 'mube',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 0, y = 1 },
  cost = 1,
  cryptnay = 1,
  m = 1,
  loc_txt = {
		name = 'Mube M',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Level up all hands by the amount of Jolly Jokers in joker tray divided by 2."
		}
	} --[[m]]
}
 SMODS.Consumable {
  key = 'firstcube',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 0, y = 0 },
  cost = 1,
  loc_txt = {
		name = 'Cube 001',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Level down/up High Card by any number between -2 and 4."
		}
	} --[[eometry ash]]
}
SMODS.Consumable {
  key = 'cube02',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 1, y = 0 },
  cost = 1,
  loc_txt = {
		name = 'Cube 002',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Level down/up Pair by any number between -2 and 4.",
		}
	} --[[jolly but not jolly]]
}
SMODS.Consumable {
  key = 'cube03',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 2, y = 0 },
  cost = 1,
  loc_txt = {
		name = 'Cube 003',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Level down/up Three of a Kind by any number between -2 and 4.",
		}
	} --[[3]]
}
SMODS.Consumable {
  key = 'cube04',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 3, y = 0 },
  cost = 1,
  zhen = 1,
  loc_txt = {
		name = 'Cube 004',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Level down/up Four of a Kind by any number between -2 and 4.",
		}
	} --[[number four]]
}
SMODS.Consumable {
  key = 'cube13',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 4, y = 0 },
  cost = 1,
  loc_txt = {
		name = 'Cube 013',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Your Most Played and Least Played Hand swap levels.",
		}
	} --[[support]]
}
SMODS.Consumable {
  key = 'cube98',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 5, y = 0 },
  cost = 1,
  thecaticon = 1,
  loc_txt = {
		name = 'Cube 098',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:Mult}Swap all levels around, then add either 0 or 1.{}"
		}
	} --[[moew]]
}
SMODS.Consumable {
  key = 'cube329',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 5, y = 1 },
  cost = 1,
  lexi = 1,
  loc_txt = {
		name = 'Cube 329',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[lexi]]
}
SMODS.Consumable {
  key = 'cube356',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 1, y = 1 },
  cost = 1,
  sealer = 1,
  loc_txt = {
		name = 'Cube 356',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[living black hole]]
}
SMODS.Consumable {
  key = 'cube376',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 2, y = 1 },
  cost = 1,
  thespriter = 1,
  loc_txt = {
		name = 'Cube 376',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[robort]]
}
SMODS.Consumable {
  key = 'cube405',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 4, y = 1 },
  cost = 1,
  xolotl = 1,
  loc_txt = {
		name = 'Cube 405',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[xolotl]]
}
SMODS.Consumable {
  key = 'cube457',
  set = 'cube',
  atlas = 'cubeConsumable',
  pos = { x = 3, y = 1 },
  cost = 1,
  rabbit = 1,
  loc_txt = {
		name = 'Cube 457',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[bnuuy]]
}
SMODS.Consumable {
  key = 'ball001',
  set = 'ball',
  atlas = 'cubeConsumable',
  pos = { x = 0, y = 2 },
  cost = 1,
  loc_txt = {
		name = 'Ball 001',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}"
		}
	} --[[balls]]
}
SMODS.Consumable {
  key = 'ballkor',
  set = 'ball',
  atlas = 'cubeConsumable',
  pos = { x = 1, y = 2 },
  cost = 1,
  sealer = 1,
  loc_txt = {
		name = 'Kori',
		text = {
			'{C:money} Texture by: gudusername_53951 {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {C:mult}???{}",
      "{C:inactive}Where is the 'Singularis'?????"
		}
	} --[[balls]]
}

SMODS.Seal {
  name = "Square Seal",
  key = "sqSeal",
  badge_colour = HEX("00ff00"),
config = { mult = 5, chips = 20, money = 1, x_mult = 1.5  },
  loc_txt = {
      -- Badge name (displayed on card description when seal is applied)
      label = 'Square Seal',
      -- Tooltip description
      name = 'Square Seal',
      text = {
          "Give a random {C:attention}Cube{} Consumable if Card is played and DOESN'T SCORE.",
          "{C:inactive}Code inspired from: {C:spectral}Cryptid{}"
      }
  },
  loc_vars = function(self, info_queue)
      return { vars = {self.config.mult, self.config.chips, self.config.money, self.config.x_mult, } }
  end,
  atlas = "seal_atlas",
  pos = {x=0, y=0},

  -- self - this seal prototype
  -- card - card this seal is applied to
  calculate = function(self, card, context)
		if context.cardarea == "unscored" and context.main_scoring then
			for k, v in ipairs(context.scoring_hand) do
				v.gj_sq_incompat = true
			end
			for k, v in ipairs(context.full_hand) do
				if not v.gj_sq_incompat then
					G.E_MANAGER:add_event(Event({
						func = function()
							if G.consumeables.config.card_limit > #G.consumeables.cards then
								local c = create_card("Cube", G.consumeables, nil, nil, nil, nil, nil, "gj_square_seal")
								c:add_to_deck()
								G.consumeables:emplace(c)
								v:juice_up()
							end
							return true
						end,
					}))
				end
			end
			for k, v in ipairs(context.scoring_hand) do
				v.gj_sq_incompat = nil
			end
		end
	end,
}
if next(SMODS.find_mod("MoreFluff")) then
SMODS.Consumable {
  key = 'color',
  set = 'editor',
  atlas = 'cubeConsumable',
  pos = { x = 2, y = 2 },
  cost = 5,
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  config = {
    extra = {
      odds = 4
    }
  },
  loc_txt = {
		name = 'Color Trigger',
		text = {
			'{C:mult} PLACEHOLDER TEXTURE {}',
			'{C:inactive} No Effect. {}',
      "{C:inactive}Intended Effect: {}Create {C:mult}Red{},{C:green} Green{} and{C:chips} Blue{} Colour Cards",
      "{C:green}#1# in #2#{} to also include White"
		},
	}
}
end

 --[[ SMODS.Atlas {
  key = "seal_atlas",
  path = "modded_seal.png",
  px = 71,
  py = 95
} ]]
