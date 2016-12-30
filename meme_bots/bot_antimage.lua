local ValveAbilityUse = require(GetScriptDirectory().."/dev/ability_item_usage_antimage");
local Constant = require(GetScriptDirectory().."/dev/constant_each_side");
local DotaBotUtility = require(GetScriptDirectory().."/utility");

local STATE_IDLE = "STATE_IDLE";
local STATE_ATTACKING_CREEP = "STATE_ATTACKING_CREEP";
local STATE_KILL = "STATE_KILL";
local STATE_RETREAT = "STATE_RETREAT";
local STATE_FARMING = "STATE_FARMING";
local STATE_GOTO_COMFORT_POINT = "STATE_GOTO_COMFORT_POINT";
local STATE_FIGHTING = "STATE_FIGHTING";
local STATE_RUN_AWAY = "STATE_RUN_AWAY";

local AntimageRetreatHPThreshold = 0.3;
local AntimageRetreatMPThreshold = 0.2;

local STATE = STATE_IDLE;
LANE = LANE_BOT

function Think()
  
end