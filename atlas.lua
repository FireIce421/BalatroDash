SMODS.Atlas {
  -- Key for code to find it with
  key = "jokerList",
  -- The name of the file, for the code to pull the atlas from
  path = "GJ_jokerListNEW.png",
  -- Width of each sprite in 1x size
  px = 70,
  -- Height of each sprite in 1x size
  py = 94
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "lookinside",
  -- The name of the file, for the code to pull the atlas from
  path = "looksinside.png",
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
  px = 65,
  -- Height of each sprite in 1x size
  py = 95
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "letarot",
  -- The name of the file, for the code to pull the atlas from
  path = "gj_tarots.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "miscJokers",
  -- The name of the file, for the code to pull the atlas from
  path = "miscjokers.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "uniq",
  -- The name of the file, for the code to pull the atlas from
  path = "uniques2.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "balatrofinalboss",
  -- The name of the file, for the code to pull the atlas from
  path = "ante39v2.png",
  -- Width of each sprite in 1x size
  px = 34,
  -- Height of each sprite in 1x size
  py = 34,
  atlas_table = 'ANIMATION_ATLAS',
  frames = 21
}
SMODS.Atlas {
  -- Key for code to find it with
  key = "regularblinds",
  -- The name of the file, for the code to pull the atlas from
  path = "blinds.png",
  -- Width of each sprite in 1x size
  px = 34,
  -- Height of each sprite in 1x size
  py = 34,
  atlas_table = 'ANIMATION_ATLAS',
  frames = 21
}

SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
})

SMODS.Atlas({
    key = "suitTime-low",
    path = "suiticon_lc.png",
    px = 18,
    py = 18
})
SMODS.Atlas({
    key = "suitTime-high",
    path = "suiticon_hc.png",
    px = 18,
    py = 18
})
SMODS.Atlas({
    key = "suits_lc",
    path = "suits_lc.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "suits_hc",
    path = "suits_hc.png",
    px = 71,
    py = 95
})
if next(SMODS.find_mod('jen')) then
  SMODS.Atlas({
      key = "unoIcons",
      path = "uno.png",
      px = 71,
      py = 95
  })
end