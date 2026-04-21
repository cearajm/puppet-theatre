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
			}
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
			
		}
	}
}
MaidPanels = {
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
						text = "[ imagine there is maid comic here and it's really good ]",
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
						text = "she used to be such a dreadful beast! fortunately, she responds very well to a swift kick ~",
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
			-- { -- Panel 1
			-- 	layers = {
			-- 		{image = "thumbs/panel_2.png"},
			-- 	}
			-- },
			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_6.png"},
				}
			},
			-- { -- Panel 2
			-- 	layers = {
			-- 		{image = "thumbs/panel_3.png"},
			-- 	}
			-- },
			-- { -- Panel 2
			-- layers = {
			-- 	{image = "thumbs/panel_4.png"},
			-- }
			-- },
			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_7.png"},
				}
			},
			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_1.png"},
				}
			},
			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_5.png"},
				}
			},
		}
	},
}