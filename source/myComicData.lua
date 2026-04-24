-- all the data for your comic goes into this table
-- you can split it up into multiple files to make it easier to manage 


ConciergePanels = {
	{
		title = "concierge",
		backgroundColor = Panels.Color.BLACK,
		isCutscene = true,
		transitionDuration = 0,

		panels = {
			{
				layers = {
					{image = "thumbs/panel_2.png"}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "So, what have you to report?",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				choiceList = {
					buttons = {
						{ label = "we'll need to order more tulips", var = { key = "garden", value = 1} },
						-- { label = "can we adopt a dog?", var = { key = "garden", value = 1} },
						{ label = "i need to kick that lady", var = { key = "garden", value = 0} }
						-- { label = "i need to kick that lady", var = { key = "garden", value = 0} }
					}
				}
			},
			-- {
			-- 	layers = {
			-- 		{image = "thumbs/panel_2.png"}
			-- 	}
			-- },
			{
				borderless = true,
				layers = {
					{
						text = "Any suggestions or ideas?",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				choiceList = {
					buttons = {
						-- { label = "our reputation is impeccable", var = { key = "elevators", value = 1} },
						-- { label = "that guy needs to be poisoned for real", var = { key = "elevators", value = 0} }
						{ label = "our uniforms might be outdated", var = { key = "elevators", value = 1} },
						-- { label = "", var = { key = "elevators", value = 0} },
						{ label = "we should all start carrying knives", var = { key = "elevators", value = 0} }
					}
				}
			},
			-- {
			-- 	layers = {
			-- 		{image = "thumbs/panel_2.png"}
			-- 	}
			-- },
			{
				borderless = true,
				layers = {
					{
						text = "What are you thinking?",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				choiceList = {
					buttons = {
						{ label = "this work is important", var = { key = "lounge", value = 1} },
						{ label = "gonna push that rich kid off the mountain", var = { key = "lounge", value = 0} },
						-- { label = "shrivel fester wither and rot", var = { key = "lounge", value = 0} },
						-- { label = "gonna push that rich kid off the mountain", var = { key = "lounge", value = 0} }
					}
				}
			},
			{
				layers = {
					{image = "thumbs/panel_2.png"}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "... I see. Thank you, Puppet.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},

		}
	}
}
promotionEndPanels = {
	{
		title = "everybody lives",
		isCutscene = true,
		transitionDuration = 1500,
		backgroundColor = Panels.Color.BLACK,
		direction = Panels.ScrollAxis.VERTICAL,

		panels = {
			{
				borderless = true,
				layers = {
					{
						text = "you've been promoted. good for you.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "asshole.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},

			
		}
	}
}
puppetEndPanels = {
	{
		title = "everybody dies",
		isCutscene = true,
		transitionDuration = 1500,
		backgroundColor = Panels.Color.BLACK,
		direction = Panels.ScrollAxis.VERTICAL,

		panels = {
			{
				borderless = true,
				layers = {
					{
						text = "why did you say those things? isn't this your home?",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "you never learn! this is getting really, really old.",
						color = Panels.Color.WHITE,
						
						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "luxury isn't about you. don't be so selfish, it's sickening.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "have your tantrum, then try again.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
					}
				}
			},

			
		}
	}
}
MaidPanels = {
	{
		title = "maid",
		isCutscene = true,
		transitionDuration = 0,
		backgroundColor = Panels.Color.BLACK,

		panels = {
			{
				borderless = true,
				layers = {
					{
						text = "my wife will be along shortly. she's a slow walker, especially in those ridiculous heels.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "the woman was whinging in the car for hours, about some frivolous thing! how ungrateful.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "the mountain road is quite steep, isn't it? good, the trek will tire her out.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "we love coming here. the long drive up is quite refreshing, when you're alone.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},

			
		}
	}
}
PagePanels = {
	{
		title = "page",
		isCutscene = true,
		transitionDuration = 0,
		backgroundColor = Panels.Color.BLACK,

		panels = {
			{
				borderless = true,
				layers = {
					{
						text = "it's great, man. everybody works so hard, and they really see my vision.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "nobody even argues with me anymore. it's such fun to make a show of firing someone, haha.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "geez, people can be so desperate, it's embarrassing. why can't they just relax like us?",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "but you're cool man, you get it. it's chill work for you guys up here. here's a tip, our thanks.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},

			
		}
	}
}

GardenPanels = {
	{
		title = "garden",
		isCutscene = true,
		transitionDuration = 0,
		backgroundColor = Panels.Color.BLACK,

		panels = {
			{
				borderless = true,
				layers = {
					{
						text = "yes, isn't my darling Guinevere so well-behaved? i trained her myself ~",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				layers = {
					{image = "thumbs/lady.png"}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "she used to be such a dreadful beast! fortunately, she responds very well to a hard and swift kick ~",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						-- effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			{
				layers = {
					{image = "thumbs/gardener.png"}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "she hasn't been winning shows like she used to, so i'll need to replace her soon.",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						-- effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					},

				}
			},
			{
				layers = {
					{image = "thumbs/dog.png"}
				}
			},
			{
				borderless = true,
				layers = {
					{
						text = "ahh... but what a beautiful garden... you can send the tulips to my room ~ <3",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						-- effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
		}
	}
}

ElevatorPanels = {
	{
		title = "elevator",
		isCutscene = true,
		transitionDuration = 0,
		backgroundColor = Panels.Color.BLACK,


		panels = {
			{
				layers = {
					{image = "thumbs/panel_3.png",
						effect = {type = Panels.Effect.SHAKE, strength = 1},
					}
				}
			}
		}
	}
}

LoungePanels = { -- a list of SEQUENCES for this comic
	{ -- Sequence 1
		title = "Chapter 1",
		isCutscene = true,
		backgroundColor = Panels.Color.BLACK,
		borderless = true,
		
		panels = { -- a list of PANELS for Sequence 1
			{
				borderless = true,
				layers = {
					{
						text = "[ guy who is insufferable ]",
						color = Panels.Color.WHITE,

						alignment = Panels.TextAlignment.CENTER,
						x = 40,
						y = 80,
						rect = {width = 300, height = 240},
						effect = {type = Panels.Effect.TYPE_ON},
						-- margin = {left = 80, right = 40}
					}
				}
			},
			-- { -- Panel 2
			-- 	layers = {
			-- 		{image = "thumbs/panel_6.png"},
			-- 	}
			-- },

			-- { -- Panel 2
			-- 	layers = {
			-- 		{image = "thumbs/panel_7.png"},
			-- 	}
			-- },
			-- { -- Panel 2
			-- 	layers = {
			-- 		{image = "thumbs/panel_1.png"},
			-- 	}
			-- },
			-- { -- Panel 2
			-- 	layers = {
			-- 		{image = "thumbs/panel_5.png"},
			-- 	}
			-- },
		}
	},
}