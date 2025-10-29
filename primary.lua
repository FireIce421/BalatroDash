--- STEAMODDED HEADER

--- MOD_NAME: Balatro Dash
--- MOD_ID: bdash
--- MOD_AUTHOR: [FireIce]
--- MOD_DESCRIPTION: (Insanely Heavy WIP) Adds a whole lot of things based on Geometry Dash Levels and Icons!Art Credits: gudusername_53951   0.0.1a - added a whole lotta things, i need a break
--- PRIORITY: 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
--- BADGE_COLOR: 00cc00
--- PREFIX: gj
--- VERSION: 0.0.1a
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-1216c]
--- LOADER_VERSION_GEQ: 1.0.0

local mod = SMODS.current_mod
config = SMODS.current_mod.config
keys_enabled = copy_table(config)                                                  --change "keys" to your choice eg. "blank_enabled"

local function config_matching()
	for k, v in pairs(keys_enabled) do                                             --make sure this variable is the same as line 3
		if v ~= config[k] then
			return false
		end
	end
	return true
end

--allows game to restart automatically
function G.FUNCS.keys_restart()                                                                           --change "keys" to your choice eg. "blank_restart"
	if config_matching() then
		SMODS.full_restart = 0
	else
		SMODS.full_restart = 1
	end
end

--config tab
SMODS.current_mod.config_tab = function()
  keys_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={                                                                              --change "keys" to your choice eg. "blank_nodes"
    {n=G.UIT.O, config={object = DynaText({string = "Options:", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
  }},create_toggle({label = "Custom Title Screen (Requires Restart)", ref_table = config, ref_value = "title", callback = G.FUNCS.keys_restart,   --make sure this variable is the same as line 14
})
}
  return {
    n = G.UIT.ROOT,
    config = {
        emboss = 0.05,
        minh = 6,
        r = 0.1,
        minw = 10,
        align = "cm",
        padding = 0.2,
        colour = G.C.BLACK
    },
    nodes = keys_nodes                                                                                                        --make sure this variable is the same as line 34
  }  
end

--title screen
if config.title then            
  SMODS.Atlas({
    key = "balatro",
    path = "balatro.png",                                                                                                    --make sure this is the name of your title screen png in assets folder, if not change the file name to this
    px = 333,
    py = 216,
    prefix_config = { key = false }
  })

  function add_card_to_title(use_key)
    local newcard = SMODS.create_card({
        set = "Joker",
        area = G.title_top,
        key = use_key,
        no_edition = true
    })
    -- recenter the title
    newcard:start_materialize({ G.C.WHITE, G.C.SECONDARY_SET.Personality }, true, 2.5)
    G.title_top:emplace(newcard)
    -- make the card look the same way as the title screen Ace of Spades
    newcard.T.scale = 1.32
  newcard.no_ui = true
end 


--defining colors for bg
G.C.custom1 = HEX("800080")
G.C.custom2 = HEX("ff00ff")                                                   --change "custom1" to custom name, replace "7734eb" with your own hex code for your own color. copy the line and paste underneath it for more colors.

local main_menu_ref = Game.main_menu
Game.main_menu = function(self, change_context)
    local ret = main_menu_ref(self, change_context)
    add_card_to_title("j_gj_fireicerealjokerlol")                                                                                       --replace j_oops with the joker or card of choice, for some reason consumables have weird purple shit, not sure why yet
    G.title_top.T.w = G.title_top.T.w + 1.35
    G.title_top.T.x = G.title_top.T.x - 0.7
    G.SPLASH_BACK:define_draw_steps({ {
        shader = 'splash',
        send = {
            { name = 'time',       ref_table = G.TIMERS, ref_value = 'REAL_SHADER' },
            { name = 'vort_speed', val = 0.4 },
            { name = 'colour_1',   ref_table = G.C,      ref_value = 'custom1' },                          --"RED" and "BLUE" are the colors of the background, you can replace either with another color eg. WHITE - OR replace with the custom name from line 72
            { name = 'colour_2',   ref_table = G.C,      ref_value = 'custom2' },
        }
    } }) 
    return ret
end
end

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
SMODS.Atlas {
  -- Key for code to find it with
  key = "uniq",
  -- The name of the file, for the code to pull the atlas from
  path = "uniques.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "balatrofinalboss",
  -- The name of the file, for the code to pull the atlas from
  path = "ante39.png",
  -- Width of each sprite in 1x size
  px = 34,
  -- Height of each sprite in 1x size
  py = 34,
  atlas_table = 'ANIMATION_ATLAS',
  frames = 21
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
mainplatformerlevel = {
  text = {
    'Main Level',
    'Gamemode: Platformer',
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
  col = HEX('6666ff'),
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
friend = {
  text = {
    "FireIces' Friends series"
  },
  col = HEX('ff00ff'),
  tcol = G.C.WHITE
},
broken = {
  text = {
    "WARNING",
    "BROKEN FUNCTIONALITY"
  },
  col = HEX('ff0000'),
  tcol = G.C.WHITE
},
unreleased = {
  text = {
    "UNRELEASED LEVEL"
  },
  col = HEX('ff0000'),
  tcol = G.C.WHITE
},
onepointtwo = {
  text = {
    'Update Released: 1.2',
    'Release Date: October 17th 2013'
  },
  col = HEX('6666ff'),
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
-- if not (SMODS.find_mod("jen")) then
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
-- end

SMODS.Rarity {
key = "uniq",
loc_txt = {
  name = 'Unique', -- used on rarity badge
},
pools = {
  ["Joker"] = true --uses self.default_rate when polled
},
default_weight = 0.005,
badge_colour = HEX('000000'),
}
SMODS.Rarity {
key = "detri",
loc_txt = {
  name = 'Detriment', -- used on rarity badge
},
pools = {
  ["Joker"] = true --uses self.default_rate when polled
},
default_weight = 0,
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
  config = { extra = { mult = 2 } },
  rarity = 1,
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
     "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult for every Face Card",
     "{C:inactive}(Card must Score){}"
   }
 },
 loc_vars = function(self, info_queue, card)
   return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
 end,
 config = { extra = { chips = 15, mult = 3 } },
 rarity = 1,
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
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
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
rarity = 2,
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
rarity = 1,
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
rarity = 2,
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
rarity = 2,
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
key = 'ultimate',
loc_txt = {
  name = 'Ultimate Destruction',
  text = {
      "{C:mult}No Implemented Effect Yet.",
      "{C:inactive}Check back later, it could be implemented anytime!{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult } }
end,
config = { extra = { mult = 1 } },
rarity = 2,
unlocked = true,
mainlevel = true,
unreleased = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 1, y = 1 },
cost = 10,
calculate = function(self, card, context)

end
}
SMODS.Joker {
key = 'jmp',
loc_txt = {
  name = 'Jumper',
  text = {
    "When a card is scored this Joker gives {C:mult}+#1#{} Mult",
    "{C:inactive}Amount of given Mult scales with each played card (4 -> 8 and so on...)",
    "{C:inactive,s:0.75}Wait, are you telling me the card DOESN'T have to score?{}"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult } }
end,
config = { extra = { mult = 4 } },
rarity = 3,
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
    "The first time you discard a hand each round,",
    "reduce its {C:attention}level by 1{} (min 1) and gain",
    "{C:mult}+2{} Mult for each time that hand was played.",
    "{C:inactive}(Current bonus: {C:mult}+#1#{})"
  }
},
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult or 0 } }
end,
config = {
  extra = {
    mult = 0,
    triggered = false -- for tracking per-round trigger
  }
},
rarity = 2,
unlocked = true,
mainlevel = true,
broken = 1,
secondrelease = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 2, y = 1 },
cost = 12,
calculate = function(self, card, context)
  if context.setting_blind then
    card.ability.extra.triggered = false -- reset at start of round
  end

  if context.discard and not card.ability.extra.triggered then
    local hand_type = G.GAME.last_hand_hand_type
    if hand_type and G.GAME.hands[hand_type] then
      local hand_info = G.GAME.hands[hand_type]
      -- Reduce level by 1, but not below 1
      hand_info.level = math.max(1, (hand_info.level or 1) - 1)

      -- Add to cumulative mult
      local times_played = hand_info.times_played or 0
      local mult_gain = times_played * 2.9
      card.ability.extra.mult = (card.ability.extra.mult or 0) + mult_gain

      -- Prevent multiple triggers this round
      card.ability.extra.triggered = true

      return {
        mult_mod = 0,
        message = localize{ type = 'variable', key = 'a_mult', vars = { mult_gain } }
      }
    end
  end

  if context.joker_main then
    return {
      mult_mod = card.ability.extra.mult,
      message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
    }
  end
end
}
SMODS.Joker {
  key = 'cycl',
  loc_txt = {
    name = 'Cycles',
    text = {
      "{C:mult}No Implemented Effect Yet.",
      "{C:inactive}Check back later, it could be implemented anytime!{}"
    }
  },
loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.mult } }
end,
config = { extra = { mult = 1 } },
rarity = 2,
unlocked = true,
mainlevel = true,
blueprint_compat = true,
atlas = 'jokerList',
pos = { x = 1, y = 1 },
cost = 12,
onepointtwo = 1,
calculate = function(self, card, context)

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
rarity = 3,
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
config = { extra = { e_mult = 1, Emult_mod = 0.125 } },
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
cost = 26,
friend = 1,
calculate = function(self, card, context)
  if context.using_consumeable and context.consumeable.ability.set == "Spectral" then
  card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_multGain
end
  if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
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
    "{C:mult}No Effect.{}",
    "{C:inactive}Intended Effect: {X:dark,C:white}???{}",
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
cost = 26,
thecaticon = 1,
calculate = function(self, card, context)

end
}
SMODS.Joker {
key = 'vessel',
loc_txt = {
  name = "{C:red}Unstable Vessel",
  text = {
    "{C:purple,s:3}You don't want to know.{}",
    "{X:purple,C:white,E:1,s:0.7}sqrt(x){C:inactive,s:0.7} Chips and Mult",
    "{X:attention,C:white,E:1,s:0.7}^#2#{C:inactive,s:0.7} Blind Requirement",
  }
},
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
cost = 0,
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
                e_chips = card.ability.extra.e_chips,
                e_mult = card.ability.extra.e_chips
              }
            end
        end
}

SMODS.Joker {
key = 'aralin',
loc_txt = {
  name = "Aralin",
  text = {
    "Gain {X:chips,C:white}X#1#{} Chips, based on Jokers",
    "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)",
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
  x_chips = card.ability.extra.e_chips * (#G.jokers.cards * (next(SMODS.find_card("j_gj_pr")) and 2 or 1))
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


SMODS.Blind {
key = 'unstable',
loc_txt = {
  name = "Vesselic Vanity",
  text = {
    "Create Unstable Vessel",
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
    end
    if next(SMODS.find_card("c_cry_lock")) then
      SMODS.destroy_cards(SMODS.find_card("c_cry_lock"))
    end
    if next(SMODS.find_card("c_entr_dispel")) then
      SMODS.destroy_cards(SMODS.find_card("c_entr_dispel"))
    end
    SMODS.add_card{ key = "j_gj_vessel" }
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
