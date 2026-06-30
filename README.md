# Slient.Assassin
- Script Kill Aura(RemoteFunction)
** Found in RemoteSpy **
- code(lua)
- --------------------------------------
```local args = {
	"AttemptWeaponHit",
	{
		attackCycleData = {
			knockbackMul = 0,
			slowMult = 0,
			attackTime = 0,
			lungeMul = 0,
			slowTime = 0
		},
		knockback = 0,
		shouldLock = true,
		shouldLunge = true,
		hitboxOffset = vector.create(0, 0, 0),
		isCritical = true,
		shouldSlow = true,
		attackCooldown = 0,
		damage = 0,
		lungeKnockback = 0,
		cycleIndex = 0,
		slowMult = 0,
		hitboxSize = vector.create(0, 0, 0),
		weaponDefinition = {
			attackCycle = {
				["1"] = {
					knockbackMul = 0,
					slowMult = 0,
					attackTime = 0,
					lungeMul = 0,
					slowTime = 0
				},
				["4"] = {
					lungeMult = 0,
					attackTime = 0,
					slowMult = 0,
					hitboxOffsetAdd = vector.create(0, 0, 0),
					hitboxSizeAdd = vector.create(0, 0, 0),
					knockbackMult = 0,
					slowTime = 0
				},
				["3"] = {
					lungeMult = 0,
					slowMult = 0,
					attackTime = 0,
					knockbackMult = 0,
					slowTime = 0
				},
				["2"] = {
					lungeMult = 0,
					slowMult = 0,
					attackTime = 0,
					knockbackMult = 0,
					slowTime = 0
				}
			},
			attackOrder = {
				"1",
				"2",
				"3",
				"4"
			}
		},
		tool = game:GetService("Players").LocalPlayer.Character:WaitForChild("Obsidian"),
		slowTime = 0
	},
	{
		{
			knockback = 0,
			isClosestEnemy = true,
			origin = vector.create(-0, -0, -0),
			enemyModel = game:GetService("Players"):WaitForChild("nnchfdh").Character,
			distance = 0
			direction = vector.create(-0, -0, -0)
		}
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GameRemoteFunction"):InvokeServer(unpack(args))```

- Script By ModZ/MoeDrStyle
# ModZ (80%+)
# MoeDrStyle (20%-)
