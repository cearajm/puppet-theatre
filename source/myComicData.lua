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

		panels = {
			{
				layers = {
					{image = "thumbs/panel_4.png"}
				}
			}
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