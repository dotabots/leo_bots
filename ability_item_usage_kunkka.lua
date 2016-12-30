local util = require(GetScriptDirectory().."/util");

fullDesire = 0;
comboDesire = 0;

function AbilityUsageThink()

    local npcBot = GetBot();
    
    if (npcBot:IsUsingAbility()) then return end;
    
    abilityTorrent = npcBot:GetAbilityByName("kunkka_torrent");
    abilityTidebringer = npcBot:GetAbilityByName("kunkka_tidebringer");
    abilityX = npcBot:GetAbilityByName("kunkka_x_marks_the_spot");
    abilityReturn = npcBot:GetAbilityByName("kunkka_return");
    abilityGhostship = npcBot:GetAbilityByName("kunkka_ghostship");    
    
    fullDesire, castFullTarget = considerFullCombo();
    
    if (comboDesire > 0) then
        if (abilityTorrent:IsCooldownReady() and abilityTidebringer:IsCooldownReady() and abilityX:IsCooldownReady() and abilityGhostship:IsCooldownReady()) then
            -- Cast combo fam
            local xLocation = castFullTarget:GetLocation();
            npcBot:Action_UseAbilityOnEntity(abilityX, castFullTarget);
            npcBot:Action_UseAbilityOnLocation(abilityGhostship, xLocation);
            npcBot:Action_UseAbilityOnLocation(abilityTorrent, xLocation);
            local torrentTime = GameTime();
            while (GameTime() < torrentTime + 1.1) do
              
            end
            npcBot:Action_UseAbility(abilityReturn);
            npcBot:Action_UseAbilityOnEntity(abilityTidebringer, castFullTarget);
        end
    end
end

function considerFullCombo()
    local npcBot = GetBot();
    local xRange = abilityX:GetCastRange();
    local tideRange = abilityTidebringer:GetCastRange();
    local torrentRange = abilityTorrent:GetCastRange();
    local shipRange = abilityGhostship:GetCastRange();
    
    local nearbyEnemies = npcBot:GetNearbyHeroes(shipRange, true, BOT_MODE_NONE);
    if (#nearbyEnemies > 0) then
      local dangerousEnemy = util:mostDangerousNearbyEnemy(shipRange, DAMAGE_TYPE_PHYSICAL);
      if (dangerousEnemy ~= nil) then
          npcBot:Action_Chat("Ur ded", true);
          return BOT_ACTION_DESIRE_HIGH, dangerousEnemy;
      end
    end
    
    return BOT_ACTION_DESIRE_NONE, 0;
end