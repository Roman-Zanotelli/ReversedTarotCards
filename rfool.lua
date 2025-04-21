

SMODS.Consumable{
    key = 'reversed_fool',
    set = 'Tarot',
    loc_txt = { name = 'Name', text = { 'This is example text' } },
    atlas = 'Reversed Tarot Cards',
    pos = {x = 0, y = 0},
    config = {},
    unlocked = true,
    discovered = true,
    use = function (self, card, area, copier)
        local valid_jokers = {}
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('foolish_choice'))
        for k, v in pairs(G.jokers.cards) do
            if not not chosen_joker then valid_jokers[#valid_jokers+1] = v end
        end
        
        local replaced_joker = pseudorandom_element(valid_jokers, pseudoseed('foolish_choice'))
        replaced_joker:start_disolve(nil, nil)
        local card = copy_card(chosen_joker, nil, nil, nil, false)
        card:start_materialize()
        card:add_to_deck()
        card:set_edition(edition.negative, true, true)
        G.jokers:emplace(card)
    end,
    can_use = function(self, card)
        if table_length(G.jokers.cards)> 1 then 
            return true 
        end
    end
}