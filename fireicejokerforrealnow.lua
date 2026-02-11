local gj_origins = {
    "Geometry Dash", -- eometry ash
    "The Frontrooms",
    "Balatro",
    "Balatro Dash", -- shameless plug
    "Dandy's World",
    "Cryptid",
    "POLTERWORX",
    "nil",
    "Everything",
    "Roblox",
    "Minecraft",
    "UNDERTALE",
    "DELTARUNE",
    "ULTRAKILL",
    "Friday Night Funkin'",
    "Joker Poker - Balala",
    "The Cardboard Box",
    "The ICONical Reverie",
    "       ",
    "Geometry Jump",
    "UNSTABLE'S DOMAIN",
    "FRAUDULENCE",
    "Puzzlevision",
    "PILGRIMAGE",
    "Playing With Your Life",
    "Blast to The Past",
    "Hellscape",
    "Heat Death RPG",
    "Garry's Mod",
    "Titanfall 2",
    "Crab Game",
    "Muck",
    "KARLSON",  -- oh you dont know what karlson is
    "Jen's Almanac",
    "Content Warning",
    "Grindstone",
    "Everything Upgrade Tree",
    "item asylum",
    "infinite welfare",
    "Busted Buffoons",
    "Bee Swarm Simulator",
    "CARDLIKE",
    "Weird Gun Game",
    "Tower Defense X", -- only in tdx
    "Doomspire Brickbattle",
    "when the",
    "Endless Hell With Freddy",
    "Five Nights at Freddy's",
    "Undertale Monster Mania",
    "Wega's Challenge",
    "AUAD",
    "Forced Weird Route",
    "nZombies Storm",
    "Vijjnaru",
    "The Icon Realm",
    "Mosskettle Hollow",
    "Dog of Wisdom"

}

local gj_status = {
    "Origin",
    "From",
    "Destroyed",
    "Got past",
    "Endured",
    "Currently in",
    "Dominates over",
    "Assumed control of"
}

local gj_operator = {
    ":",
    ";",
    "?",
    "!",
    "-",
    "+",
    "^",
    "%",
    "/",
    "sqrt(",
}

SMODS.Joker {
key = 'fireice',
loc_vars = function(self, info_queue, card)
  return {
    main_end = {
    { n = G.UIT.O, config = { object = DynaText({ string = gj_status, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 0.35, scale = 0.32, min_cycle_time = 0 }) } },
    { n = G.UIT.O, config = { object = DynaText({ string = gj_operator, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 1, scale = 0.32, min_cycle_time = 0 }) } },
    { n = G.UIT.O, config = { object = DynaText({ string = gj_origins, colours = { G.C.DARK_EDITION }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.205, scale = 0.32, min_cycle_time = 0 }) } },
    },
    vars = {
    localize('k_gj_fireiceDialog' .. pseudorandom("seed", 1, 21)),
    card.ability.extra.operator } }
end,
config = { extra = { operator = 1 } },
rarity = 'gj_uniq',
unlocked = true,
blueprint_compat = true,
atlas = 'uniq',
pos = { x = 0, y = 2 },
cost = 26,
thecaticon = 1,

  add_to_deck = function(self, card, from_debuff)
      change_operator(card.ability.extra.operator)
  end,
  remove_from_deck = function(self, card, from_debuff)
      change_operator(card.ability.extra.operator)
  end
}