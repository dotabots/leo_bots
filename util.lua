local M = {}

function M:mostDangerousNearbyEnemy(range, damage)
    local npcBot = GetBot();
    local npcMostDangerousEnemy = nil;
    local nMostDangerousDamage = 0;
    local nearbyEnemies = npcBot:GetNearbyHeroes(range, true, BOT_MODE_NONE);
    for _, npcEnemy in pairs(nearbyEnemies) do
        local nDamage = npcEnemy:GetEstimatedDamageToTarget(false, npcBot, 3.0, damage);
        if (nDamage > nMostDangerousDamage) then
            nMostDanagerousDamage = nDamage;
            npcMostDangerousEnemy = npcEnemy;
        end
    end
    
    return npcMostDangerousEnemy;
end