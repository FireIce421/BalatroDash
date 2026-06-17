-- brought forth gd to balala (not the same person who brought balala to gd)

BalatroDash = SMODS.current_mod

SMODS.load_file("rarities.lua")()
SMODS.load_file("atlas.lua")()
SMODS.load_file("config.lua")()
SMODS.load_file("badges.lua")()
SMODS.load_file("levels.lua")()
SMODS.load_file("consumables.lua")()
SMODS.load_file("otherjokers.lua")()
SMODS.load_file("precursors.lua")()
SMODS.load_file("uniquejokers.lua")()
SMODS.load_file("blinds.lua")()
SMODS.load_file("challenges.lua")()
SMODS.load_file("misc.lua")()
-- SMODS.load_file("fireicejokerforrealnow.lua")() -- (hey dont uncomment it, its halfbaked)
if next(SMODS.find_mod('jen')) then
SMODS.load_file("crossmod/pwx.lua")() -- its been largely tested but still fairly jank, ill keep it uncommented but be careful
end

-- sorry all the code was vacated to their respective files
function G.FUNCS.nowdoitalloveragain(e)
    G.FUNCS.exit_overlay_menu()
    ease_ante(-G.GAME.round_resets.ante+1)
    ease_hands_played(2)
    ease_dollars(-G.GAME.dollars-20)
    G.GAME.won = false
    local deletable_jokers = {}
        for _, joker in ipairs(G.jokers.cards) do
            if SMODS.is_eternal(joker, card) or not SMODS.is_eternal(joker, card) then deletable_jokers[#deletable_jokers + 1] = joker end
        end

        local chosen_joker = nil
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for _, joker in ipairs(deletable_jokers) do
                    if joker ~= chosen_joker then
                        joker:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                end
                return true
            end
        }))
    SMODS.add_card{ key = "j_gj_vesselweakened", edition = 'e_negative' }
end
