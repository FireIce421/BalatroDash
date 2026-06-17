return {
	misc = {
		suits_singular = {
			gj_icons = "Icon"
		},
		suits_plural = {
			gj_icons = "Icons"
		},
		quips = {
			gj_pry1 = {
				"can you lock the fuck in",
			},
			gj_fireice3 = {
				"look at this player",
				"they lost a balatro run so hard",
				"even their gang clowned them",
			},
			gj_fireice2 = {
				"{E:1,C:dark_edition,s:2}skill issue",
			},
			gj_fireice1 = {
				"Did you forget,",
				"that {C:dark_edition,E:1}cards must score{}?",
			},
			gj_vessel1 = {
				"TRY AGAIN",
				"{E:1,C:red}IF YOU DARE",
			},
			gj_vessel2 = {
				"Another one flies too close to the sun."
			},
			gj_vessel3 = {
				"Another one flies too close to the waters."
			},
			gj_vesselunused = {
				"..."
			},
		},
		challenge_names = {
			c_gj_levelOne = "Not So Gud",
			c_gj_levelTwo = "Stellarity",
			c_gj_levelThree = "Vesselic Vanity",
			c_gj_levelEX1 = "Duo Vascellum",
		},
		dictionary = {
			k_gj_detri = "Detriment",
			k_gj_hrdr = "Harder",
			k_gj_ins = "Insane",
			k_gj_norm = "Normal",
			k_gj_uniq = "Unique",
			k_gj_ez = "Easy",
			k_gj_hr = "Hard",
			k_gj_na = "NA",
			k_gj_hrdm = "Hard Demon",
			k_gj_spec = "Special",
			k_gj_unbound = "Unbound",
			b_gj_lap2="...again?",
			k_gj_lap2="LAP 2",



		},
		labels = {
			k_gj_ez = "Easy",
			k_gj_hr = "Hard",
			k_gj_ins = "Insane",
			k_gj_hrdm = "Hard Demon",
			k_gj_hrdr = "Harder",
			k_gj_norm = "Normal",
			k_gj_uniq = "Unique",
			k_gj_na = "NA",
			k_gj_detri = "Detriment",
			k_gj_spec = "Special",
			k_gj_unbound = "Unbound",
		},
	},
	descriptions = {
		Blind = {
			bl_gj_vesselicvanityphaseone = {
				name = "Vesselic Vanity (Phase I)",
				text = {
					"{s:2,C:red}...{}",
					"(Blind cannot be countered in any way, shape or form)",
					"Brutal Blind Size",
				},
			},
			bl_gj_vesselicvanityphasetwo = {
				name = "Vesselic Vanity (Phase II)",
				text = {
					"{s:2,C:red}...{}",
					"Currently not implemented!"
				},
			},
			bl_gj_oddballoddity = {
				name = "Oddball Oddity",
				text = {
					"Destroy all 'Unique' Jokers (e_mult was too strong :sob:)",
					"(Blind cannot be countered in any way, shape or form)",
					"Extreme Blind Size",
				},
			},
			bl_gj_truevessel = {
				name = "Unstable Vessel",
				text = {
					"CINEMA Blind Size",
				},
			},
			bl_gj_skewer = {
				name = "The Skewer",
				text = {
					"All Icon cards are debuffed"
				},
			},
		},
		Other = {
			bdash_credits = {
				text = {
					"{E:2,C:dark_edition}Name (Discord Tag){}",
					"{E:1,C:purple,s:2}Project Lead{}",
					"{C:white,s:0.9}FireIce (@fireice_421){}",
					"{C:white,s:0.9}Gup (@i.am.the.gud){}",
					" ",
					"{E:1,C:purple,s:2}Artist{}",
					"{C:white,s:0.9}Gup (@i.am.the.gud){}",
					"{C:white,s:0.9}Feli (@LasagnaFelidae){}",
					"{C:white,s:0.9}Bombler (@spoo077_05268){}",
					"{C:white,s:0.9}Slipstream (@thingifithinker){}",
					"{C:white,s:0.9}Lyman (@spikeberd09){}",
					"{C:white,s:0.9}Pixel (@pixeldavel){}",
					" ",
					"{E:1,C:purple,s:2}Programmer{}",
					"{C:white,s:0.9}FireIce (@fireice_421){}",
					"{C:white,s:0.9}dragokillfist (@dragokillfist){}",
					"{C:white,s:0.9}Pixel (@pixeldavel){}",
					" ",
					" ",
					"{E:1,C:purple,s:2}Inspiration{}",
					"{E:1,C:blue,s:2}POLTERWORX{}",
					"main inspiration for the mod",
					"{E:1,C:green,s:2}Geometry Dash{}",
					"thank you robtop for such peak game :)",
				}
			}
		},
		Joker = {
			j_gj_challengeExtender1 = {
				name = "Challenge Extender",
				text = {
					"Sets Winning Ante to 16",
					"{C:inactive,s:0.9}Does not appear in the collection",
				},
			},
			j_gj_vesselweakened = {
				name = "Unstable Vessel (Weakened)",
				text = {
					"{X:attention,C:white}^#1#{} Blind Requirement",
					"{C:inactive,s:0.9}Does not appear in the collection",
				},
			},
			j_gj_tmach = {
				name = "Time Machine",
				text = {
					"Each {C:dark_edition}scored{} card gains",
					"{C:mult}+#1#{} Bonus Mult",
					"{C:inactive,s:0.75}Stacks{}",
				},
			},
			j_gj_base = {
				name = "Base After Base",
				text = {
					"{X:chips,C:white}+X0.25{} Chips per scored card",
					"{C:inactive}Starts at X1",
				},
			},
			j_gj_jmp = {
				name = "Jumper",
				text = {
					"When a card is scored this Joker gives {C:mult}+#1#{} Mult",
					"{C:inactive}Amount of given Mult scales with each played card (8 -> 16 and so on...)",
					"{C:inactive,s:0.75}Wait, are you telling me the card DOESN'T have to score?{}",
				},
			},
			j_gj_felix = {
				name = "Felix Josiah",
				text = {
					"Create two{C:spectral} Spectral{} Cards when a Blind is defeated.",
					"Create an additional {C:dark_edition}Negative {C:spectral}Spectral {}when a {C:attention}Boss Blind{} is defeated.",
				},
			},
			j_gj_vessel = {
				name = "{C:red}Unstable Vessel",
				text = {
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
			j_gj_aralin = {
				name = "Aralin (Chione) Moonlight",
				text = {
					{
					"Gain {X:chips,C:white}^#1#{} Chips, based on Jokers",
					"{C:inactive}(Currently {X:chips,C:white}^#2#{C:inactive} Chips)",
					"{C:inactive,s:0.7}X1.25 if you have Pry Stellar",
					},{
					"{C:inactive}OC by: VolcanicMist {}",
					"{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}i.am.the.gud",
					"{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}FireIce",
					}
				},
			},
			j_gj_dlo = {
				name = "DlovanSlayer",
				text = {
					{
					"When a {C:spectral}Spectral {}is used, gain {X:mult,C:white}X#3#{} Mult",
					"When a {C:tarot}Tarot {}is used, gain {X:chips,C:white}X#4#{} Chips",
					},{
					"Divide {X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips by {X:dark,C:white}/#5#(+#6#){}",
					}
				},
			},
			j_gj_lazy = {
				name = "Slothful Joker",
				text = {
						"Played cards with",
                    	"the {C:gj_icons}#2#{} suit give",
                    	"{C:mult}+#1#{} Mult when scored",
						"{s:0.9,C:inactive}joker so lazy it forgot the joker text on its sprite"
				},
			},
			j_gj_malachite = {
				name = "Malachite Cluster",
				text = {
						"{C:green}1 in #1#{} chance for played cards",
                    	"with the {C:gj_icons}#3#{} suit to give",
                    	"{X:chips,C:white}X#2#{} Chips when scored"
				},
			},
			j_gj_cycl = {
				name = "Cycles",
				text = {
					{
					"{C:attention}+#1#{} Hand Size",
					"+1 additonal Hand Size when a Blind is defeated",
					"Hand Size is set to {C:attention}8{} on ante change",
					},{
					"WARNING: Effects of Hand Size-affecting items will be nullified!"
					}
				},
			},
			j_gj_clg = {
				name = "Can't Let Go",
				text = {
					"Destroy Joker to the Left when Blind is Selected",
					"Gain 6.25% of its sell value as {X:mult,C:white}XMult{}",
					"{C:inactive}Currently: {X:mult,C:white}X#1#{C:inactive} Mult",
				},
			},
			j_gj_stereom = {
				name = "Stereo Madness",
				text = {
					"{C:mult}+#1#{} Mult for every {C:dark_edition}scored{} Card"
				},
			},
			j_gj_flower = {
				name = "Ominous Flower",
				text = {
					{
					"{C:purple}I will create a Joker for you, but:",
					"{C:mult,E:1,s:1.25}You must defeat a Boss Blind.{}",
					"",
					"'{C:white}Yes, I know I am overpriced. Shut up{}.'",
					"Does nothing otherwise.",
					"{C:inactive,s:0.8}This joker will not survive.",
					},{
						"{C:purple,E:1}What it does: Create a random Special Joker when a Boss Blind is defeated{}",
						"{s:0.8,C:inactive}(Must have room)",
					}
				},
			},
			j_gj_dryout = {
				name = "Dry Out",
				text = {
					{
					"For each round without selling anything, gain {C:mult}+#1#{} Mult, otherwise {C:attention}reset{}",
					"{C:inactive}(Currently: {C:mult}+#2#{}{C:inactive}){}",
					},{
					"{C:inactive}please let me rest i dont want to buff this more",
					}
				},
			},
			j_gj_ultimate = {
				name = "Ultimate Destruction",
				text = {
					{
					"{C:chips}+#2# Chips{}, compounding.",
					},{
					"{C:mult}+#1# Mult{}, compounding.",
					}
				},
			},
			j_gj_xstep = {
				name = "xStep",
				text = {
					{
					"{C:attention}Played{} or {C:attention}held in hand{} {C:dark_edition}Enhancements{} have additional effects.",
					"{C:inactive,s:0.8}Experiment! Each Enhancement has a unique effect tied to it!"
					},{
						"{s:0.9,C:inactive}Only Vanilla and {s:0.9,C:gj_icons}Balatro Dash{s:0.9,C:inactive} Enhancements are taken into account"
					}
				},
			},
			j_gj_prystellar = {
				name = "{s:0.75}(Asteria){} Pry Stellar!",
				text = {
					"When a {C:planet}Planet{} card is used, gain {X:mult,C:white}^#2#{} Mult",
					"{C:inactive}(Currently {X:mult,C:white}^#1#{C:inactive} Mult)",
					"{C:inactive,s:0.7}X1.5 if you have Aralin",
					"{C:inactive}Oh,,,, hai!!! heiii!!!! hii!!!!!!!{}",
					"{C:inactive}OC by: KITTIIZZ_X3 {}",
					"{C:inactive,s:0.8}Face Art by: {X:dark_edition,C:white,s:0.8}i.am.the.gud",
					"{C:inactive,s:0.8}Background by: {X:purple,C:white,s:0.8}Slipstream",
				},
			},
			j_gj_fireicerealjokerlol = {
				name = "FireIce",
				text = { {
					"{C:purple}+1 {}operator to {X:chips,C:white}Chips{X:mult,C:white}Mult",
					"{C:purple,E:1,s:0.6}Something bad will happen on (or past) {C:dark_edition,s:0.6}Ante 16{}",
					},{
					"{C:red,E:1}May cause problems with some mods.",
					}
				},
			},
			j_gj_backont = {
				name = "Back on Track",
				text = {
					"{C:chips}+#1#{} Chips for every {C:dark_edition}scored{} Face Card"
				},
			},
			j_gj_polar = {
				name = "Polargeist",
				text = {
					"Retrigger each non-Face Card once.",
					"{C:inactive}Wait, isn't that just reverse Sock and Busk- CARD MUST SCORE.{}",
				},
			},
			j_gj_gudDetri = {
				name = "Chester (Gud)",
				text = {
					"{X:dark,C:white}/(Ante*Round){} Chips and Mult",
					"{C:inactive}Currently: {X:dark,C:white}/#1#{}",
					"{C:inactive,s:0.8}Updates when Blind is Selected{}",
				},
			},
			j_gj_dash = {
				name = "Dash",
				text = {
					"{C:green}#2# in #3#{} chance to retrigger each {C:attention}6{} 6 times.",
					"{C:inactive}So, I've heard you like the number {C:green}6{C:inactive}.{}",
					" ",
					"{s:0.5,C:chips}The Sigil{s:0.5} is gone, but the{s:0.5,C:green} memory{s:0.5} remains.{}",
				},
			},
			j_gj_fireiceabsurd = {
				name = "FireIces' Absurd Joke",
				text = {
					"Instantly create {C:purple}UNSTABLE VESSEL{}",
					" ",
					"{C:NIGHTMARE_PURPLE}FIREICE YOU BLEW UP A GALAXY- (-Seraph)",
					"{C:NIGHTMARE_PURPLE}Vessel did it! (-FireIce)",
				},
			},
			j_gj_fireice = {
				name = "FireIce",
				text = {
					"{E:1,s:1.2,C:red}The more mods you have installed, the more effects this joker has!{}",
					"CURRENTLY HALF-BAKED, DO NOT PICK UP"
				},
			},
		},
		Tarot = {
			c_gj_controller = {
				name = "The Controller",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
				}
			}
		},
	},
}