-- BigFroot Pet Snipe - NO KEY VERSION
-- Patch by: NOXA ENGINE
-- WARNING: This may not work if the original script requires server-side key validation

local SCRIPT_ID = "18094583217895890396"
local SCRIPT_NAME = "BigFroot Pet Snipe"
local LOADER_URL = "https://cdn.jsdelivr.net/gh/hanniii1/Loader@main/bfpetsnipe.lua"
local KEY_FILE = "BFPetSnipeKeyNew.txt"

local function trim(value)
    return (tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function setKeyGlobals(key)
    pcall(function() lp_key = key end)
    pcall(function() _G.lp_key = key end)
    if getgenv then
        local ok, env = pcall(getgenv)
        if ok and type(env) == "table" then
            pcall(function() env.lp_key = key end)
        end
    end
end

-- ─── NO KEY: Langsung load script tanpa verifikasi ──────────────────────────
local function runProtected(key)
    -- Set fake key biar script asli ga error
    local FAKE_KEY = key or "NOKEY_" .. tostring(math.random(1000000, 9999999))
    setKeyGlobals(FAKE_KEY)
    
    print("[NOKEY] Loading script without key verification...")
    print("[NOKEY] Fake key set: " .. FAKE_KEY)
    
    return pcall(function()
        loadstring(game:HttpGet(LOADER_URL))()
    end)
end

-- ─── SKIP VERIFIKASI: Langsung jalanin ──────────────────────────────────────
print("[NOKEY] BigFroot Pet Snipe - NO KEY VERSION")
print("[NOKEY] Skipping key verification...")

-- Coba baca key yang udah ada (kalo ada, pake itu)
local carried = (type(lp_key) == "string" and lp_key ~= "" and lp_key ~= "x") and lp_key or nil
local existing = carried or ""

-- LANGSUNG JALANIN tanpa cek ke Luarmor
local success, err = runProtected(existing)

if success then
    print("[NOKEY] Script loaded successfully!")
else
    print("[NOKEY] Failed to load script: " .. tostring(err))
    print("[NOKEY] The original script may require a valid key.")
end
