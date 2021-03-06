-- teleport_huge
-- sparks
-- charge_graser
-- damage_fire
-- trail_missile_small
-- trail_missile
-- trail_missile_nodir
-- muzzlemassdriverlarge
-- muzzlekinetic
-- teleport_small
-- muzzlekineticlarge
-- muzzlemassdriver
-- trail_plasma
-- teleport
-- charge_antimatter

local function CopyTable(tableToCopy, deep)
  local copy = {}
  for key, value in pairs(tableToCopy) do
    if (deep and type(value) == "table") then
      copy[key] = CopyTable(value, true)
    else
      copy[key] = value
    end
  end
  return copy
end

-- modifies primary directly; if you don't want to do that then make a copy and pass that
local function MergeTable(primary, secondary, deep)
	for i, v in pairs(secondary) do
		-- key not used in primary, assign it the value at same key in secondary
		if not primary[i] then
			if (deep and type(v) == "table") then
				primary[i] = CopyTable(v, true)
			else
				primary[i] = v
			end
		-- values at key in both primary and secondary are tables, merge those
		elseif type(primary[i]) == "table" and type(v) == "table"  then
			MergeTable(primary[i], v, deep)
		end
	end
end

local fx = {
  ["teleport_huge"] = {
    cloud = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 50,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .9,
        colormap           = [[.9 .9 1 .1   .2 .2 1 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 26,
        particlesize       = 300,
        particlesizespread = 200,
        particlespeed      = 0,
        particlespeedspread = 3,
        pos                = [[-1400 r2800, -250 r500, -1400 r2800]],
        sizegrowth         = 40,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
    ring = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[.8 .8 1 .1   .2 .2 1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[shockwave]],
        length             = 1,
        pos                = [[0, 0, 0]],
        sidetexture        = [[null]],
        size               = 3,
        sizegrowth         = 900,
        ttl                = 40,
      },
    },
  },

  ["sparks"] = {
    lightningballs = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0 0 0 0.01 1 1 1 0.01 0 0 0 0.01]],
        directional        = true,
        emitrot            = 80,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 3,
        particlelifespread = 0,
        particlesize       = 2,
        particlesizespread = 2,
        particlespeed      = 0.01,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[lightningball]],
        useairlos          = false,
      },
    },
  },

  ["damage_fire"] = {
    circle = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .8,
        colormap           = [[0 0 0 0   1 .9 .4 .1   .8 .3 0 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 40,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 3,
        particlesizespread = 2,
        particlespeed      = .5,
        particlespeedspread = .5,
        pos                = [[0, 0, 0]],
        sizegrowth         = .2,
        sizemod            = .9,
        texture            = [[smoke1]],
      },
    },
  },

  ["trail_missile_small"] = {
    glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[1 1 0 .1   .5 .2 0 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 5,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 2,
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      = 3,
        particlespeedspread = 5,
        pos                = [[0, 0, 0]],
        sizegrowth         = -.3,
        sizemod            = 1,
        texture            = [[smoke1]],
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 0,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[.4 .4 .4 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 30,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = .3,
        particlespeedspread = .6,
        pos                = [[0, 0, 0]],
        sizegrowth         = 2,
        sizemod            = .8,
        texture            = [[smoke1]],
      },
    },
  },

  ["trail_missile"] = {
    glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[1 1 0 .1   .5 .2 0 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 5,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 2,
        particlesize       = 5,
        particlesizespread = 3,
        particlespeed      = 3,
        particlespeedspread = 5,
        pos                = [[0, 0, 0]],
        sizegrowth         = -.6,
        sizemod            = 1,
        texture            = [[smoke1]],
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 0,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[.4 .4 .4 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 30,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = .3,
        particlespeedspread = .6,
        pos                = [[0, 0, 0]],
        sizegrowth         = 2,
        sizemod            = .8,
        texture            = [[smoke1]],
      },
    },
  },

  ["trail_missile_nodir"] = {
    glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[1 1 0 .1   .5 .2 0 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 150,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 2,
        particlesize       = 5,
        particlesizespread = 3,
        particlespeed      = 0,
        particlespeedspread = .6,
        pos                = [[0, 0, 0]],
        sizegrowth         = -.6,
        sizemod            = 1,
        texture            = [[smoke1]],
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[.4 .4 .4 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 150,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = 0,
        particlespeedspread = .6,
        pos                = [[0, 0, 0]],
        sizegrowth         = .6,
        sizemod            = 1,
        texture            = [[smoke1]],
      },
    },
  },

  ["muzzlemassdriverlarge"] = {
    flare1 = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   .1 1 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0.25,
        fronttexture       = [[muzzle1s]],
        length             = 5,
        pos                = [[0, 0, 0]],
        sidetexture        = [[muzzle2f]],
        size               = 1,
        sizegrowth         = 15,
        ttl                = 9,
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .99,
        colormap           = [[.1 1 .1 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 36,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = 2,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
  },

  ["muzzlekinetic"] = {
    flare = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   1 .9 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[muzzle1s]],
        length             = 3,
        pos                = [[0, 0, 0]],
        sidetexture        = [[muzzle1f]],
        size               = 1,
        sizegrowth         = 5,
        ttl                = 6,
      },
    },
  },

  ["teleport_small"] = {
    cloud = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 50,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .9,
        colormap           = [[.9 .9 1 .1   .2 .2 1 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 26,
        particlesize       = 10,
        particlesizespread = 7,
        particlespeed      = 0,
        particlespeedspread = 2,
        pos                = [[-20 r40, -10 r20, -20 r40]],
        sizegrowth         = 1,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
    ring = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[.8 .8 1 .1   .2 .2 1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[shockwave]],
        length             = 1,
        pos                = [[0, 0, 0]],
        sidetexture        = [[null]],
        size               = 3,
        sizegrowth         = 15,
        ttl                = 40,
      },
    },
  },

  ["muzzlekineticlarge"] = {
    flare = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   1 .9 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[muzzle1s]],
        length             = 3,
        pos                = [[0, 0, 0]],
        sidetexture        = [[muzzle1f]],
        size               = 1,
        sizegrowth         = 16,
        ttl                = 6,
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[.4 .4 .4 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 16,
        particlelife       = 30,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = .3,
        particlespeedspread = 3,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
  },

  ["muzzlemassdriver"] = {
    flare1 = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   .1 1 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0.25,
        fronttexture       = [[muzzle1s]],
        length             = 5,
        pos                = [[0, 0, 0]],
        sidetexture        = [[muzzle2f]],
        size               = 1,
        sizegrowth         = 5,
        ttl                = 9,
      },
    },
    flare2 = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   .1 1 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = .5,
        fronttexture       = [[muzzle1s]],
        length             = 5,
        pos                = [[0, 0, 0]],
        sidetexture        = [[null]],
        size               = 1,
        sizegrowth         = 5,
        ttl                = 9,
      },
    },
    flare3 = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[1 1 1 .1   .1 1 .1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = .75,
        fronttexture       = [[muzzle1s]],
        length             = 5,
        pos                = [[0, 0, 0]],
        sidetexture        = [[null]],
        size               = 1,
        sizegrowth         = 5,
        ttl                = 9,
      },
    },
  },

  ["trail_plasma"] = {
    circle = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[.7 .7 1 .1   .2 .4 .9 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 10,
        particlelifespread = 4,
        particlesize       = 6,
        particlesizespread = 6,
        particlespeed      = .5,
        particlespeedspread = .5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
  },

  ["teleport"] = {
    cloud = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 50,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .9,
        colormap           = [[.9 .9 1 .1   .2 .2 1 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 26,
        particlesize       = 30,
        particlesizespread = 20,
        particlespeed      = 0,
        particlespeedspread = 3,
        pos                = [[-40 r80, -20 r40, -40 r80]],
        sizegrowth         = 4,
        sizemod            = .95,
        texture            = [[smoke1]],
      },
    },
    ring = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        colormap           = [[.8 .8 1 .1   .2 .2 1 .1   0 0 0 0]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[shockwave]],
        length             = 1,
        pos                = [[0, 0, 0]],
        sidetexture        = [[null]],
        size               = 3,
        sizegrowth         = 60,
        ttl                = 40,
      },
    },
  },

  ["charge_antimatter"] = {
    charge = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .95,
        alwaysvisible      = true,
        colormap           = [[.4 .4 .4 .1   .5 .5 .5 .1   0 0 0 0]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 8,
        particlelifespread = 0,
        particlesize       = [[0 d3]],
        particlesizespread = 10,
        particlespeed      = 0.01,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = .9,
        texture            = [[chargeparticles]],
      },
    },
    circle = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        airdrag            = .95,
        alwaysvisible      = true,
        colormap           = [[.4 .4 .4 .1   .5 .5 .5 .1   0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = [[1 d.01 k1]],
        particlelife       = 8,
        particlelifespread = 0,
        particlesize       = [[0 d.5]],
        particlesizespread = 0,
        particlespeed      = 0,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1,
        texture            = [[smoke1]],
      },
    },
    spike1 = {
      air                = true,
      class              = [[explspike]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        alpha              = 0.9,
        alphadecay         = 0.3,
        alwaysvisible      = true,
        color              = [[1, 1, 1]],
        dir                = [[0 d.1 s1, 0 d.03 s1, 1.5708 d.1 s1]],
        length             = [[10 d1.5]],
        width              = 3,
      },
    },
    spike2 = {
      air                = true,
      class              = [[explspike]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        alpha              = 0.9,
        alphadecay         = 0.3,
        alwaysvisible      = true,
        color              = [[1, 1, 1]],
        dir                = [[0 d.01 s1, 0 d.1 s1, 1.5708 d.1 s1]],
        length             = [[5 d1]],
        width              = 2,
      },
    },
    spike3 = {
      air                = true,
      class              = [[explspike]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater              = true,
      properties = {
        alpha              = 0.9,
        alphadecay         = 0.3,
        alwaysvisible      = true,
        color              = [[1, 1, 1]],
        dir                = [[0 d.07 s1, 0 d.03 s1, 1.5708 d.01 s1]],
        length             = [[5 d.5]],
        width              = 2,
      },
    },
  },
}

local graserFX = {
  charge = {
    properties = {
      colormap           = [[.15 .4 .15 .1   .2 .5 .2 .1   0 0 0 0]],
      particlesizespread = 7,
    },
  },
  circle = {
    properties = {
      colormap           = [[.15 .4 .15 .1   .2 .5 .2 .1   0 0 0 0]],
    },
  },
  spike1 = {
    properties = {
      color              = [[0.3, 1, 0.3]],
      length             = [[7 d1.5]],
      width              = 2,
    },
  },
  spike2 = {
    properties = {
      color              = [[0.3, 1, 0.3]],
      length             = [[3 d1]],
      width              = 1.5,
    },
  },
  spike3 = {
    properties = {
      color              = [[0.3, 1, 0.3]],
      length             = [[3 d.5]],
      width              = 1.5,
    },
  },  
}

local graserBlueFX = {
  charge = {
    properties = {
      colormap           = [[.15 .15 .4 .1   .2 .2 .5 .1   0 0 0 0]],
      particlesizespread = 8,
    },
  },
  circle = {
    properties = {
      colormap           = [[.15 .15 .4 .1   .2 .2 .5 .1   0 0 0 0]],
    },
  },
  spike1 = {
    properties = {
      color              = [[0.3, 0.3, 1]],
      length             = [[8.5 d1.5]],
      width              = 2,
    },
  },
  spike2 = {
    properties = {
      color              = [[0.3, 0.3, 1]],
      length             = [[4 d1]],
      width              = 1.75,
    },
  },
  spike3 = {
    properties = {
      color              = [[0.3, 0.3, 1]],
      length             = [[4 d.5]],
      width              = 1.75,
    },
  },  
}

MergeTable(graserFX, fx.charge_antimatter, true)
fx.charge_graser = graserFX

MergeTable(graserBlueFX, fx.charge_antimatter, true)
fx.charge_graser_blue = graserBlueFX

return fx

