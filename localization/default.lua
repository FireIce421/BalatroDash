return {
	["misc"] = {
		["quips"] = {
			["gj_pry1"] = {
				"can you lock the fuck in",
			},
			["gj_fireice3"] = {
				"look at this player",
				"they lost a balatro run so hard",
				"even their gang clowned them",
			},
			["gj_fireice2"] = {
				"{E:1,C:dark_edition,s:2}skill issue",
			},
			["gj_fireice1"] = {
				"Did you forget,",
				"that {C:dark_edition,E:1}cards must score{}?",
			},
			["gj_vessel1"] = {
				"TRY AGAIN",
				"{E:1,C:red}IF YOU DARE",
			},
		},
		["challenge_names"] = {
			["c_gj_levelTwo"] = "Stellarity",
			["c_gj_levelOne"] = "Not So Gud",
		},
		["dictionary"] = {
			["k_gj_detri"] = "Detriment",
			["k_gj_hrdr"] = "Harder",
			["k_gj_ins"] = "Insane",
			["k_gj_norm"] = "Normal",
			["k_gj_uniq"] = "Unique",
			["k_gj_ez"] = "Easy",
			["k_gj_hr"] = "Hard",
			["k_gj_na"] = "NA",
			["k_gj_hrdm"] = "Hard Demon",
		},
		["labels"] = {
			["k_gj_ez"] = "Easy",
			["k_gj_hr"] = "Hard",
			["k_gj_ins"] = "Insane",
			["k_gj_hrdm"] = "Hard Demon",
			["k_gj_hrdr"] = "Harder",
			["k_gj_norm"] = "Normal",
			["k_gj_uniq"] = "Unique",
			["k_gj_na"] = "NA",
			["k_gj_detri"] = "Detriment",
		},
	},
	["descriptions"] = {
		["Blind"] = {
			["bl_gj_unstable"] = {
				["name"] = "Vesselic Vanity",
				["text"] = {
					"A terrible stench emanates from the blind...",
					"(Blind cannot be countered in any way, shape or form)",
					"Brutal Blind Size",
				},
			},
			["bl_wheel"] = {
				["text"] = {
					"#1# in #2# cards get",
				},
			},
			["bl_gj_nouniques"] = {
				["name"] = "An Oddity",
				["text"] = {
					"Destroy all 'Unique' Jokers (e_mult was too strong :sob:)",
					"(Blind cannot be countered in any way, shape or form)",
					"Extreme Blind Size",
				},
			},
			["bl_gj_truevessel"] = {
				["name"] = "Unstable Vessel",
				["text"] = {
					"So you tried getting rid of me",
					"WEAK.",
				},
			},
		},
		["Joker"] = {
			["j_gj_challengeExtender1"] = {
				["name"] = "Challenge Extender",
				["text"] = {
					"Sets Winning Ante to 16",
					"{C:inactive,s:0.9}Does not appear in the collection",
				},
			},
			["j_gj_tmach"] = {
				["name"] = "Time Machine",
				["text"] = {
					"Each {C:dark_edition}scored{} card gains",
					"{C:mult}+#1#{} Bonus Mult",
					"{C:inactive,s:0.75}Stacks{}",
				},
			},
			["j_gj_base"] = {
				["name"] = "Base After Base",
				["text"] = {
					"{X:chips,C:white}+X0.25{} Chips per scored card",
					"{C:inactive}Starts at X1",
				},
			},
			["j_gj_jmp"] = {
				["name"] = "Jumper",
				["text"] = {
					"When a card is scored this Joker gives {C:mult}+#1#{} Mult",
					"{C:inactive}Amount of given Mult scales with each played card (8 -> 16 and so on...)",
					"{C:inactive,s:0.75}Wait, are you telling me the card DOESN'T have to score?{}",
				},
			},
			["j_gj_felix"] = {
				["name"] = "Felix Josiah",
				["text"] = {
					"Create two{C:spectral} Spectral{} Cards when a Blind is defeated.",
					"Create an additional {C:dark_edition}Negative {C:spectral}Spectral {}when a {C:attention}Boss Blind{} is defeated.",
				},
			},
			["j_gj_vessel"] = {
				["name"] = "{C:red}Unstable Vessel",
				["text"] = {
					{
					"{C:purple,s:3}You don't want to know.{}",
					},{
					"{X:purple,C:white,E:1,s:0.7}sqrt(x){C:inactive,s:0.7} Chips and Mult",
					"{X:attention,C:white,E:1,s:0.7}^#2#{C:inactive,s:0.7} Blind Requirement",
					"{C:red,E:2,s:0.8}Certain mods will have additional effects on this joker.",
					},{
					"{E:1,C:purple,s:0.8}Something is still holding it together...",
					}
				},
			},
			["j_gj_aralin"] = {
				["name"] = "Aralin",
				["text"] = {
					{
					"Gain {X:chips,C:white}^#1#{} Chips, based on Jokers",
					"{C:inactive}(Currently {X:chips,C:white}^#2#{C:inactive} Chips)",
					"{C:inactive,s:0.7}Double Gain if you have Pry Stellar",
					},{
					"{C:inactive}OC by: Volcanic_Mist {}",
					"{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}gudusername_53951",
					"{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}FireIce",
					}
				},
			},
			["j_gj_dlo"] = {
				["name"] = "DlovanSlayer",
				["text"] = {
					{
					"When a {C:spectral}Spectral {}is used, gain {X:mult,C:white}X#3#{} Mult",
					"When a {C:tarot}Tarot {}is used, gain {X:chips,C:white}X#4#{} Chips",
					},{
					"Divide {X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips by {X:dark,C:white}/#5#(+#6#){}",
					}
				},
			},
			["j_gj_cycl"] = {
				["name"] = "Cycles",
				["text"] = {
					"{C:attention}+#1#{} Hand Size",
					"+1 additonal Hand Size when a Blind is defeated",
					"Resets at the start of Each Ante",
				},
			},
			["j_gj_clg"] = {
				["name"] = "Cant Let Go",
				["text"] = {
					"Destroy Joker to the Left",
					"Gain 6.25% of its sell value as {X:mult,C:white}XMult{}",
					"{C:inactive}Currently: {X:mult,C:white}X#1#{C:inactive} Mult",
				},
			},
			["j_gj_stereom"] = {
				["name"] = "Stereo Madness",
				["text"] = {
					"{C:mult}+#1#{} Mult for every {C:dark_edition}scored{} Card"
				},
			},
			["j_gj_flower"] = {
				["name"] = "Ominous Flower",
				["text"] = {
					"{C:purple}I will create a Joker for you, but:",
					"{C:mult,E:1,s:1.25}You must defeat a Boss Blind.{}",
					"",
					"'                  .'",
					"{C:inactive,s:0.8}This joker will not survive.",
				},
			},
			["j_gj_dryout"] = {
				["name"] = "Dry Out",
				["text"] = {
					{
					"For each round without selling anything, gain {C:mult}+#1#{} Mult, otherwise {C:attention}reset{}",
					"{C:inactive}(Currently: {C:mult}+#2#{}{C:inactive}){}",
					},{
					"{C:inactive}please let me rest i dont want to buff this more",
					}
				},
			},
			["j_gj_ultimate"] = {
				["name"] = "Ultimate Destruction",
				["text"] = {
					{
					"{C:chips}+#2# Chips{}, compounding.",
					},{
					"{C:mult}+#1# Mult{}, compounding.",
					}
				},
			},
			["j_gj_pr"] = {
				["name"] = "{s:0.75}(Asteria){} Pry Stellar!",
				["text"] = {
					"When a {C:planet}Planet{} card is used, gain {X:mult,C:white}^#2#{} Mult",
					"{C:inactive}(Currently {X:mult,C:white}^#1#{C:inactive} Mult)",
					"{C:inactive,s:0.7}Double Gain if you have Aralin",
					"{C:inactive}Oh,,,, hai!!! heiii!!!! hii!!!!!!!{}",
					"{C:inactive}OC by: KITTIIZZ_X3 {}",
					"{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}gudusername_53951",
					"{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}Slipstream",
				},
			},
			["j_gj_fireicerealjokerlol"] = {
				["name"] = "FireIce",
				["text"] = { {
					"{C:purple}+1 {}operator to {X:chips,C:white}Chips{X:mult,C:white}Mult",
					"{C:purple,E:1,s:0.6}Something bad will happen on (or past) {C:dark_edition,s:0.6}Ante 16{}",
					},{
					"{C:red,E:1}May cause problems with some mods.",
					}
				},
			},
			["j_gj_backont"] = {
				["name"] = "Back on Track",
				["text"] = {
					"{C:chips}+#1#{} Chips for every {C:dark_edition}scored{} Face Card"
				},
			},
			["j_gj_polar"] = {
				["name"] = "Polargeist",
				["text"] = {
					"Retrigger each non-Face Card once.",
					"{C:inactive}Wait, isn't that just reverse Sock and Busk- CARD MUST SCORE.{}",
				},
			},
			["j_gj_gudDetri"] = {
				["name"] = "Chester (Gud)",
				["text"] = {
					"{X:dark,C:white}/(Ante*Round){} Chips and Mult",
					"{C:inactive}Currently: {X:dark,C:white}/#1#{}",
					"{C:inactive,s:0.8}Updates when Blind is Selected{}",
				},
			},
			["j_gj_dash"] = {
				["name"] = "Dash",
				["text"] = {
					"{C:green}#2# in #3#{} chance to retrigger each {C:attention}6{} 6 times.",
					"{C:inactive}So, I've heard you like the number {C:green}6{C:inactive}.{}",
					" ",
					"{s:0.5,C:chips}The Sigil{s:0.5} is gone, but the{s:0.5,C:green} memory{s:0.5} remains.{}",
				},
			},
		},
	},
}