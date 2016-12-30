local M = {}

function M:mostDangerousNearbyEnemy(range, damage)
	local npcBot = GetBot();
	local npcMostDangerousEnemy = nil;
	local nMostDangerousDamage = 0;
	local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes(range, true, BOT_MODE_NONE);
	for _,npcEnemy in pairs(tableNearbyEnemyHeroes) do
		local nDamage = npcEnemy:GetEstimatedDamageToTarget(false, npcBot, 3.0, damage);
		if (nDamage > nMostDangerousDamage) then
			nMostDangerousDamage = nDamage;
			npcMostDangerousEnemy = npcEnemy;
		end
	end
	return npcMostDangerousEnemy;
end

function M:GetTimeDelta(prevTime)
  local delta = GameTime() - prevTime;
  return delta;
end

function M:TimePassed(prevTime, amount)
  if (GetTimeDelta(prevTime) > amount) then
    return true, GameTime();
  else
    return false, GameTime();
  end
end

return M;