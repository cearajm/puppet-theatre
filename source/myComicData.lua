-- all the data for your comic goes into this table
-- you can split it up into multiple files to make it easier to manage 

myComicData = { -- a list of SEQUENCES for this comic

	{ -- Sequence 1
		title = "Chapter 1",
		panels = { -- a list of PANELS for Sequence 1
			{ -- Panel 1
				layers = {
					{image = "thumbs/panel_2.png"},
					-- {image = "thumbs/panel_3.png"},
					-- {image = "thumbs/panel_5.png"},
					-- {image = "thumbs/panel_1.png"}
				}
			},

			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_6.png"},
				}
			},
			{ -- Panel 2
				layers = {
					{image = "thumbs/panel_3.png"},
				}
			},
			{ -- Panel 2
			layers = {
				{image = "thumbs/panel_4.png"},
			}
			},
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

	{ -- Sequence 2
		title = "Chapter 2",
		panels = { -- a list of PANELS for Sequence 2
			{ -- Panel 1
				layers = {
					-- list of layers for panel 1
				}
			}, 
			{ -- Panel 2
				layers = {
					-- list of layers for panel 2
				}
			}
		}
	}


}