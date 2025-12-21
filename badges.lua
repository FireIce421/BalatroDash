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
experimental = {
  text = {
    'EXPERIMENTAL',
    'MAY NOT MAKE THE FINAL CUT'
  },
  col = HEX('550000'),
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