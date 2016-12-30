local util = require(GetScriptDirectory().."/util");

castTorrentDesire = 0;
castXDesire = 0;
castShipDesire = 0;
castTidebringerDesire = 0;

xLocation = nil;

function AbilityUsageThink()

    local npcBot = GetBot();
    
    if (npcBot:IsUsingAbility()) then return end;
    
    abilityTorrent = npcBot:GetAbilityByName("kunkka_torrent");
    abilityTidebringer = npcBot:GetAbilityByName("kunkka_tidebringer");
    abilityX = npcBot:GetAbilityByName("kunkka_x_marks_the_spot");
    abilityReturn = npcBot:GetAbilityByName("kunkka_return");
    abilityGhostship = npcBot:GetAbilityByName("kunkka_ghostship");
    
    castXDesire, castXTarget = considerX();
    castTorrentDesire = considerTorrent();
    
    if (not abilityX:IsCooldownReady()) then
        xLocation = nil;
    end
    
    xTime;
    
    if (castXDesire > 0) then
        if (abilityX:IsCooldownReady()) then
            xLocation = castXTarget:GetLocation();
            npcBot:Action_UseAbilityOnEntity(abilityX, castXTarget);
        end
    end
    
    if (castTorrentDesire > 0) then
        if (xLocation ~= nil) then
            npcBot:Action_UseAbilityOnLocation(
        end
    end
end

function considerX()
    local npcBot = GetBot();
    local xRange = abilityX:GetCastRange();
    
    if (not abilityX:IsFullyCastable()) then
        return BOT_ACTION_DESIRE_NONE, 0;
    end
    
    --Retreating X
    if (npcBot:GetActiveMode() == BOT_MODE_RETREAT and npcBot:GetActiveModeDesire() >= BOT_MODE_DESIRE_HIGH) then
        local nearbyEnemies = npcBot:GetNearbyHeroes(xRange, true, BOT_MODE_NONE);
        for _, enemy in pairs(nearbyEnemies) do
            if (npcBot:WasRecentlyDamagedByHero(enemy, 2.0)) then
                print("RETREAT X!!!");
                return BOT_ACTION_DESIRE_MODERATE, enemy;
            end
        end
    end
    
    if (npcBot:GetActiveMode() == BOT_MODE_ROAM or
        npcBot:GetActiveMode() == BOT_MODE_ATTACK or
        npcBot:GetActiveMode() == BOT_MODE_TEAM_ROAM or
        npcBot:GetActiveMode() == BOT_MODE_GANK or
        npcBot:GetActiveMode() == BOT_MODE_DEFEND_ALLY) then
          local enemy = npcBot:GetTarget();
          
          if (enemy ~= nil) then
              if (not enemy:HasModifier("modifier_kunkka_x_marks_the_spot")) then
                  return BOT_ACTION_DESIRE_MODERATE, enemy;
              end
          end
    end
    
    return BOT_ACTION_DESIRE_NONE, 0;
end

function considerTorrent()
    local npcBot = GetBot();
    local torrentRange = abilityTorrent:GetCastRange();
    
    if (not abilityTorrent:IsFullyCastable()) then
        return BOT_ACTION_DESIRE_NONE;
    end
    
    local nearbyEnemies = npcBot:GetNearbyHeroes(torrentRange, true, BOT_MODE_NONE);
    for _, enemy in pairs(nearbyEnemies) do
        if (enemy:HasModifier("modifier_kunkka_x_marks_the_spot")) then
            return BOT_ACTION_DESIRE_MODERATE;
        end
    end
    
    return BOT_ACTION_DESIRE_NONE;
end