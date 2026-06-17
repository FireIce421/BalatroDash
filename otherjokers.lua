SMODS.Joker {
    key = 'lazy',
    rarity = 1,
    cost = 4,
    atlas = 'gj_miscJokers',
    unlocked = true,
    blueprint_compat = true,
    pos = {x = 0, y = 0},
    config = { extra = { s_mult = 3, suit = 'gj_icons' }, },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = card.ability.extra.s_mult
            }
        end
    end
}
 SMODS.Joker {
    key = 'malachite',
    rarity = 2,
    cost = 6,
    atlas = 'gj_miscJokers',
    unlocked = true,
    blueprint_compat = true,
    pos = {x = 1, y = 0},
    config = { extra = { odds = 3, s_xchips = 2, suit = 'gj_icons' }, },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.odds, card.ability.extra.s_xchips, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and
            SMODS.pseudorandom_probability(card, 'bdash_malachite', 1, card.ability.extra.odds) then
                return {
                    x_chips = card.ability.extra.s_xchips
                }
        end
    end
}