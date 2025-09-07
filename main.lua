local _G_S_ = game:GetService
local _P_L_ = _G_S_("Players")
local _C_G_ = _G_S_("CoreGui")
local _H_S_ = _G_S_("HttpService")
local _U_I_ = _G_S_("UserInputService")
local _R_S_ = _G_S_("RunService")

local _L_P_ = _P_L_.LocalPlayer or _P_L_.PlayerAdded:Wait()

local _G_S_T_ = {}
_G_S_T_.__index = _G_S_T_
setmetatable(_G_S_T_, {
    __newindex = function(t, k, v)
        rawset(t, k, v)
    end
})

local _C_F_G_ = {
    _T_T_L_ = "Project X-Ray: Quantum Injector",
    _V_R_S_ = "v2.0.0-ALPHA-BUILD-7342",
    _P_C_L_ = Color3.fromRGB(50, 205, 50),
    _S_C_L_ = Color3.fromRGB(34, 139, 34),
    _T_X_C_ = Color3.fromRGB(255, 255, 255),
    _W_S_Z_ = Vector2.new(750, 550),
    _A_P_I_ = "https://api.obfuscated-backend.net/v2/secure_data/",
    _K_Y_S_ = "YOUR_SUPER_SECRET_KEY_HERE",
    _D_B_G_ = true,
}

local _F_A_P_I_ = {}
_F_A_P_I_.__index = _F_A_P_I_
setmetatable(_F_A_P_I_, {
    __call = function(self, _E_P_)
        local _R_D_ = {}
        local _S_T_ = math.random(1, 5)
        wait(_S_T_)

        if _E_P_ == "module_manifest" then
            _R_D_ = {
                { _N_M_ = "Core_Aimbot_Module", _V_ = "1.2.3", _S_T_ = true },
                { _N_M_ = "Visual_ESP_Engine", _V_ = "2.0.1", _S_T_ = false },
                { _N_M_ = "Movement_Bypass_System", _V_ = "3.1.0", _S_T_ = true },
                { _N_M_ = "AntiCheat_Obfuscator", _V_ = "4.0.0", _S_T_ = false },
                { _N_M_ = "Utility_Toolkit", _V_ = "1.0.0", _S_T_ = true },
            }
        elseif _E_P_ == "user_profile_data" then
            _R_D_ = {
                _U_N_ = _L_P_.Name,
                _H_W_ = _H_S_:GenerateGUID(false),
                _S_B_ = "Elite Tier",
                _L_S_ = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time() + math.random(86400, 86400 * 30)),
            }
        else
            _R_D_ = { _E_R_ = "Invalid Endpoint", _C_D_ = 404 }
        end
        return _H_S_:JSONEncode(_R_D_)
    end
})
local _G_T_D_T_ = _F_A_P_I_

local _U_I_M_ = {}
_U_I_M_.__index = _U_I_M_
setmetatable(_U_I_M_, {
    __call = function(self, _P_R_M_S_)
        local _T_P_ = _P_R_M_S_._T_P_ or "Frame"
        local _N_M_ = _P_R_M_S_._N_M_ or "UnnamedElement_" .. math.random(1000, 9999)
        local _P_R_ = _P_R_M_S_._P_R_ or _C_G_

        local _E_L_ = Instance.new(_T_P_)
        _E_L_.Name = _N_M_
        _E_L_.Parent = _P_R_

        if _P_R_M_S_._S_Z_ then _E_L_.Size = _P_R_M_S_._S_Z_ end
        if _P_R_M_S_._P_S_ then _E_L_.Position = _P_R_M_S_._P_S_ end
        if _P_R_M_S_._B_C_ then _E_L_.BackgroundColor3 = _P_R_M_S_._B_C_ end
        if _P_R_M_S_._T_X_ then _E_L_.Text = _P_R_M_S_._T_X_ end
        if _P_R_M_S_._T_C_ then _E_L_.TextColor3 = _P_R_M_S_._T_C_ end
        if _P_R_M_S_._F_N_ then _E_L_.Font = _P_R_M_S_._F_N_ end
        if _P_R_M_S_._T_X_A_ then _E_L_.TextXAlignment = _P_R_M_S_._T_X_A_ end
        if _P_R_M_S_._T_Y_A_ then _E_L_.TextYAlignment = _P_R_M_S_._T_Y_A_ end
        if _P_R_M_S_._B_S_P_ then _E_L_.BorderSizePixel = _P_R_M_S_._B_S_P_ end
        if _P_R_M_S_._V_S_B_ then _E_L_.Visible = _P_R_M_S_._V_S_B_ end

        return _E_L_
    end
})
local _C_R_T_E_L_ = _U_I_M_

local _K_Y_S_Y_S_ = {}
_K_Y_S_Y_S_.__index = _K_Y_S_Y_S_
setmetatable(_K_Y_S_Y_S_, {
    __call = function(self, _M_T_H_D_, _P_R_M_)
        if _M_T_H_D_ == "request_challenge" then
            _G_S_T_.CurrentChallenge = _H_S_:GenerateGUID(false)
            print("DEBUG: Challenge requested: " .. _G_S_T_.CurrentChallenge)
            return _G_S_T_.CurrentChallenge
        elseif _M_T_H_D_ == "verify_response" then
            local _I_N_P_ = _P_R_M_ or ""
            local _H_W_I_D_ = _H_S_:GenerateGUID(false)
            local _C_H_L_ = _G_S_T_.CurrentChallenge or ""

            local _V_L_D_ = false
            if string.len(_I_N_P_) > 10 and string.find(_I_N_P_, "XRAY") and string.find(_I_N_P_, _C_H_L_:sub(1, 5)) then
                _V_L_D_ = true
            end

            if _V_L_D_ then
                _G_S_T_.Authenticated = true
                print("DEBUG: Key verification successful for HWID: " .. _H_W_I_D_)
                return true, "Authentication successful. Welcome, " .. _L_P_.Name .. "!"
            else
                _G_S_T_.Authenticated = false
                print("DEBUG: Key verification failed. Input: " .. _I_N_P_)
                return false, "Invalid key or challenge response. Please try again."
            end
        elseif _M_T_H_D_ == "generate_hwid" then
            return _H_S_:GenerateGUID(false)
        else
            return false, "Unknown key system method."
        end
    end
})
local _S_C_R_T_K_Y_ = _K_Y_S_Y_S_

local _C_H_T_M_D_L_S_ = {}
_C_H_T_M_D_L_S_.__index = _C_H_T_M_D_L_S_
setmetatable(_C_H_T_M_D_L_S_, {
    __newindex = function(t, k, v)
        rawset(t, k, v)
        print("DEBUG: Cheat module '" .. tostring(k) .. "' state updated to: " .. tostring(v))
    end
})

function _C_H_T_M_D_L_S_:_A_M_B_T_(state)
    if state then
        print("LOG: Aimbot module activated. Target acquisition protocols initiated.")
        _G_S_T_.AimbotStatus = "Active"
    else
        print("LOG: Aimbot module deactivated. Target lock released.")
        _G_S_T_.AimbotStatus = "Inactive"
    end
end

function _C_H_T_M_D_L_S_:_E_S_P_V_S_(state)
    if state then
        print("LOG: ESP Visuals engaged. Rendering player outlines and object highlights.")
        _G_S_T_.ESPStatus = "Active"
    else
        print("LOG: ESP Visuals disengaged. Stealth mode re-enabled.")
        _G_S_T_.ESPStatus = "Inactive"
    end
end

function _C_H_T_M_D_L_S_:_F_L_Y_M_D_(state)
    if state then
        print("LOG: Fly Mode enabled. Gravity override initiated. Press [SPACE] for altitude control.")
        _G_S_T_.FlyStatus = "Active"
    else
        print("LOG: Fly Mode disabled. Reverting to standard physics.")
        _G_S_T_.FlyStatus = "Inactive"
    end
end

function _C_H_T_M_D_L_S_:_N_C_L_P_B_P_(state)
    if state then
        print("LOG: Noclip Bypass engaged. Collision detection disabled.")
        _G_S_T_.NoclipStatus = "Active"
    else
        print("LOG: Noclip Bypass disengaged. Standard collision restored.")
        _G_S_T_.NoclipStatus = "Inactive"
    end
end

local _U_T_L_S_ = {}
function _U_T_L_S_:_G_N_R_T_R_N_D_S_T_R_(_L_N_G_T_H_)
    local _C_H_R_S_ = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local _R_S_L_T_ = {}
    for _ = 1, _L_N_G_T_H_ do
        table.insert(_R_S_L_T_, string.sub(_C_H_R_S_, math.random(1, string.len(_C_H_R_S_)), 1))
    end
    return table.concat(_R_S_L_T_)
end

function _U_T_L_S_:_C_N_V_R_T_T_B_L_T_S_T_R_(_T_B_L_)
    local _S_T_R_ = "{"
    local _F_R_S_T_ = true
    for _K_, _V_ in pairs(_T_B_L_) do
        if not _F_R_S_T_ then _S_T_R_ = _S_T_R_ .. ", " end
        _S_T_R_ = _S_T_R_ .. tostring(_K_) .. "=" .. tostring(_V_)
        _F_R_S_T_ = false
    end
    return _S_T_R_ .. "}"
end

local _L_D_R_ = {}
_L_D_R_.__index = _L_D_R_
setmetatable(_L_D_R_, {
    __call = function(self)
        self:_I_N_T_L_Z_()
    end
})

function _L_D_R_:_I_N_T_L_Z_()
    print("DEBUG: Initializing Project X-Ray Loader...")
    _G_S_T_.LoaderStatus = "Initializing"

    local _M_N_W_N_D_W_ = _C_R_T_E_L_({
        _T_P_ = "ScreenGui",
        _N_M_ = _C_F_G_._T_T_L_:gsub(" ", "_"),
        _P_R_ = _C_G_,
        _V_S_B_ = false
    })

    local _M_N_F_R_M_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "MainFrame",
        _P_R_ = _M_N_W_N_D_W_,
        _S_Z_ = UDim2.new(0, _C_F_G_._W_S_Z_.X, 0, _C_F_G_._W_S_Z_.Y),
        _P_S_ = UDim2.new(0.5, -_C_F_G_._W_S_Z_.X / 2, 0.5, -_C_F_G_._W_S_Z_.Y / 2),
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 1,
        _V_S_B_ = false
    })

    local _T_T_L_B_R_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "TitleBar",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0, 35),
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0
    })

    local _T_T_L_L_B_L_ = _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "TitleLabel",
        _P_R_ = _T_T_L_B_R_,
        _S_Z_ = UDim2.new(1, -10, 1, 0),
        _P_S_ = UDim2.new(0, 5, 0, 0),
        _T_X_ = _C_F_G_._T_T_L_ .. " " .. _C_F_G_._V_R_S_,
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSansBold,
        _T_X_A_ = Enum.TextXAlignment.Left,
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0
    })

    local _K_Y_I_N_P_F_R_M_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "KeyInputFrame",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(0.8, 0, 0.3, 0),
        _P_S_ = UDim2.new(0.1, 0, 0.3, 0),
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 1,
        _V_S_B_ = true
    })

    local _K_Y_I_N_P_L_B_L_ = _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "KeyInputLabel",
        _P_R_ = _K_Y_I_N_P_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0.3, 0),
        _T_X_ = "Enter your super secret key:",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSansBold,
        _T_X_A_ = Enum.TextXAlignment.Center,
        _T_Y_A_ = Enum.TextYAlignment.Center,
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0
    })

    local _K_Y_T_X_B_X_ = _C_R_T_E_L_({
        _T_P_ = "TextBox",
        _N_M_ = "KeyTextBox",
        _P_R_ = _K_Y_I_N_P_F_R_M_,
        _S_Z_ = UDim2.new(0.9, 0, 0.2, 0),
        _P_S_ = UDim2.new(0.05, 0, 0.4, 0),
        _B_C_ = Color3.fromRGB(60, 60, 60),
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSans,
        _T_X_A_ = Enum.TextXAlignment.Center,
        _T_Y_A_ = Enum.TextYAlignment.Center,
        _T_X_ = "Paste Key Here",
        _B_S_P_ = 1
    })

    local _S_B_M_T_B_T_N_ = _C_R_T_E_L_({
        _T_P_ = "TextButton",
        _N_M_ = "SubmitButton",
        _P_R_ = _K_Y_I_N_P_F_R_M_,
        _S_Z_ = UDim2.new(0.5, 0, 0.2, 0),
        _P_S_ = UDim2.new(0.25, 0, 0.7, 0),
        _B_C_ = _C_F_G_._P_C_L_,
        _T_X_ = "Authenticate",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSansBold,
        _B_S_P_ = 1
    })

    local _S_T_T_S_L_B_L_ = _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "StatusLabel",
        _P_R_ = _K_Y_I_N_P_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0.1, 0),
        _P_S_ = UDim2.new(0, 0, 0.9, 0),
        _T_X_ = "Awaiting Key Input...",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSans,
        _T_X_A_ = Enum.TextXAlignment.Center,
        _T_Y_A_ = Enum.TextYAlignment.Center,
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0
    })

    _S_B_M_T_B_T_N_.MouseButton1Click:Connect(function()
        _S_T_T_S_L_B_L_.Text = "Verifying Key..."
        wait(math.random(1, 3))

        local _I_N_P_K_Y_ = _K_Y_T_X_B_X_.Text
        local _V_R_F_D_, _M_S_G_ = _S_C_R_T_K_Y_("verify_response", _I_N_P_K_Y_)

        _S_T_T_S_L_B_L_.Text = _M_S_G_
        if _V_R_F_D_ then
            _K_Y_I_N_P_F_R_M_.Visible = false
            _M_N_F_R_M_.Visible = true
            _M_N_W_N_D_W_.Visible = true
            self:_L_D_M_D_L_S_()
        else
            _K_Y_T_X_B_X_.Text = ""
            _S_T_T_S_L_B_L_.TextColor3 = Color3.fromRGB(255, 50, 50)
            wait(2)
            _S_T_T_S_L_B_L_.TextColor3 = _C_F_G_._T_X_C_
            _S_T_T_S_L_B_L_.Text = "Awaiting Key Input..."
        end
    end)

    local _T_B_C_N_T_N_R_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "TabContainer",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0.9, -35),
        _P_S_ = UDim2.new(0, 0, 0, 35),
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0
    })

    local _T_B_B_T_N_S_F_R_M_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "TabButtonsFrame",
        _P_R_ = _T_B_C_N_T_N_R_,
        _S_Z_ = UDim2.new(1, 0, 0, 30),
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0
    })

    local _T_B_P_N_L_S_F_R_M_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "TabPanelsFrame",
        _P_R_ = _T_B_C_N_T_N_R_,
        _S_Z_ = UDim2.new(1, 0, 1, -30),
        _P_S_ = UDim2.new(0, 0, 0, 30),
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0
    })

    local _T_B_S_ = {
        { _N_M_ = "Aimbot", _P_N_L_ = nil },
        { _N_M_ = "Visuals", _P_N_L_ = nil },
        { _N_M_ = "Movement", _P_N_L_ = nil },
        { _N_M_ = "Exploits", _P_N_L_ = nil },
        { _N_M_ = "Settings", _P_N_L_ = nil },
        { _N_M_ = "Console", _P_N_L_ = nil },
    }

    local _C_R_R_N_T_T_B_ = nil
    local function _S_W_T_C_H_T_B_(_T_B_N_M_)
        for _, _T_B_D_T_ in ipairs(_T_B_S_) do
            if _T_B_D_T_._P_N_L_ then
                _T_B_D_T_._P_N_L_.Visible = (_T_B_D_T_._N_M_ == _T_B_N_M_)
            end
        end
        _C_R_R_N_T_T_B_ = _T_B_N_M_
        print("DEBUG: Switched to tab: " .. _T_B_N_M_)
    end

    local _X_O_F_S_T_ = 0
    for _I_, _T_B_D_T_ in ipairs(_T_B_S_) do
        local _T_B_B_T_N_ = _C_R_T_E_L_({
            _T_P_ = "TextButton",
            _N_M_ = _T_B_D_T_._N_M_ .. "TabButton",
            _P_R_ = _T_B_B_T_N_S_F_R_M_,
            _S_Z_ = UDim2.new(0, 100, 1, 0),
            _P_S_ = UDim2.new(0, _X_O_F_S_T_, 0, 0),
            _B_C_ = _C_F_G_._P_C_L_,
            _T_X_ = _T_B_D_T_._N_M_,
            _T_C_ = _C_F_G_._T_X_C_,
            _F_N_ = Enum.Font.SourceSansBold,
            _B_S_P_ = 1
        })
        _X_O_F_S_T_ = _X_O_F_S_T_ + 100 + 5

        local _T_B_P_N_L_ = _C_R_T_E_L_({
            _T_P_ = "Frame",
            _N_M_ = _T_B_D_T_._N_M_ .. "Panel",
            _P_R_ = _T_B_P_N_L_S_F_R_M_,
            _S_Z_ = UDim2.new(1, 0, 1, 0),
            _B_C_ = _C_F_G_._P_C_L_,
            _B_S_P_ = 0,
            _V_S_B_ = false
        })
        _T_B_D_T_._P_N_L_ = _T_B_P_N_L_

        _T_B_B_T_N_.MouseButton1Click:Connect(function()
            _S_W_T_C_H_T_B_(_T_B_D_T_._N_M_)
        end)
    end

    local function _P_P_L_T_P_N_L_(_P_N_L_, _F_T_R_S_)
        local _Y_O_F_S_T_ = 10
        for _I_, _F_T_R_ in ipairs(_F_T_R_S_) do
            local _F_R_M_ = _C_R_T_E_L_({
                _T_P_ = "Frame",
                _N_M_ = _F_T_R_._N_M_ .. "FeatureFrame",
                _P_R_ = _P_N_L_,
                _S_Z_ = UDim2.new(0.95, 0, 0, 40),
                _P_S_ = UDim2.new(0.025, 0, 0, _Y_O_F_S_T_),
                _B_C_ = _C_F_G_._S_C_L_,
                _B_S_P_ = 1
            })

            local _L_B_L_ = _C_R_T_E_L_({
                _T_P_ = "TextLabel",
                _N_M_ = _F_T_R_._N_M_ .. "Label",
                _P_R_ = _F_R_M_,
                _S_Z_ = UDim2.new(0.7, 0, 1, 0),
                _P_S_ = UDim2.new(0, 5, 0, 0),
                _T_X_ = _F_T_R_._N_M_,
                _T_C_ = _C_F_G_._T_X_C_,
                _F_N_ = Enum.Font.SourceSans,
                _T_X_A_ = Enum.TextXAlignment.Left,
                _T_Y_A_ = Enum.TextYAlignment.Center,
                _B_C_ = _C_F_G_._S_C_L_,
                _B_S_P_ = 0
            })

            local _T_G_G_L_B_T_N_ = _C_R_T_E_L_({
                _T_P_ = "TextButton",
                _N_M_ = _F_T_R_._N_M_ .. "ToggleButton",
                _P_R_ = _F_R_M_,
                _S_Z_ = UDim2.new(0.25, 0, 0.8, 0),
                _P_S_ = UDim2.new(0.72, 0, 0.1, 0),
                _B_C_ = Color3.fromRGB(200, 50, 50),
                _T_X_ = "OFF",
                _T_C_ = _C_F_G_._T_X_C_,
                _F_N_ = Enum.Font.SourceSansBold,
                _B_S_P_ = 1
            })

            local _S_T_T_S_ = false
            _T_G_G_L_B_T_N_.MouseButton1Click:Connect(function()
                _S_T_T_S_ = not _S_T_T_S_
                if _S_T_T_S_ then
                    _T_G_G_L_B_T_N_.Text = "ON"
                    _T_G_G_L_B_T_N_.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
                    if _C_H_T_M_D_L_S_["_" .. _F_T_R_._N_M_:gsub(" ", "_"):upper() .. "_"] then
                        _C_H_T_M_D_L_S_["_" .. _F_T_R_._N_M_:gsub(" ", "_"):upper() .. "_"](_C_H_T_M_D_L_S_, true)
                    end
                else
                    _T_G_G_L_B_T_N_.Text = "OFF"
                    _T_G_G_L_B_N_.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                    if _C_H_T_M_D_L_S_["_" .. _F_T_R_._N_M_:gsub(" ", "_"):upper() .. "_"] then
                        _C_H_T_M_D_L_S_["_" .. _F_T_R_._N_M_:gsub(" ", "_"):upper() .. "_"](_C_H_T_M_D_L_S_, false)
                    end
                end
            end)
            _Y_O_F_S_T_ = _Y_O_F_S_T_ + 45
        end
    end

    _P_P_L_T_P_N_L_(_T_B_S_[1]._P_N_L_, {
        { _N_M_ = "Silent Aim" },
        { _N_M_ = "FOV Circle" },
        { _N_M_ = "Prediction" },
        { _N_M_ = "Target Lock" },
    })

    _P_P_L_T_P_N_L_(_T_B_S_[2]._P_N_L_, {
        { _N_M_ = "Player ESP" },
        { _N_M_ = "Box ESP" },
        { _N_M_ = "Health Bar" },
        { _N_M_ = "Tracers" },
        { _N_M_ = "Name ESP" },
        { _N_M_ = "Chams" },
    })

    _P_P_L_T_P_N_L_(_T_B_S_[3]._P_N_L_, {
        { _N_M_ = "Speed Hack" },
        { _N_M_ = "Jump Power" },
        { _N_M_ = "No Clip" },
        { _N_M_ = "Fly" },
    })

    _P_P_L_T_P_N_L_(_T_B_S_[4]._P_N_L_, {
        { _N_M_ = "Anti AFK" },
        { _N_M_ = "Click Teleport" },
        { _N_M_ = "Server Lag" },
        { _N_M_ = "Crash Player" },
    })

    local _S_T_T_N_G_S_P_N_L_ = _T_B_S_[5]._P_N_L_
    _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "Setting1Label",
        _P_R_ = _S_T_T_N_G_S_P_N_L_,
        _S_Z_ = UDim2.new(0.9, 0, 0, 30),
        _P_S_ = UDim2.new(0.05, 0, 0, 10),
        _T_X_ = "Obfuscation Level: MAX",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSans,
        _T_X_A_ = Enum.TextXAlignment.Left,
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0
    })
    _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "Setting2Label",
        _P_R_ = _S_T_T_N_G_S_P_N_L_,
        _S_Z_ = UDim2.new(0.9, 0, 0, 30),
        _P_S_ = UDim2.new(0.05, 0, 0, 45),
        _T_X_ = "Injection Method: Quantum Flux",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSans,
        _T_X_A_ = Enum.TextXAlignment.Left,
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0
    })
    _C_R_T_E_L_({
        _T_P_ = "TextButton",
        _N_M_ = "SaveConfigButton",
        _P_R_ = _S_T_T_N_G_S_P_N_L_,
        _S_Z_ = UDim2.new(0.4, 0, 0, 40),
        _P_S_ = UDim2.new(0.3, 0, 0, 80),
        _B_C_ = _C_F_G_._S_C_L_,
        _T_X_ = "Save Configuration",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSansBold,
        _B_S_P_ = 1
    }).MouseButton1Click:Connect(function()
        print("LOG: Configuration saved to encrypted cloud storage. (Not really)")
    end)

    local _C_N_S_L_P_N_L_ = _T_B_S_[6]._P_N_L_
    local _C_N_S_L_T_X_B_X_ = _C_R_T_E_L_({
        _T_P_ = "TextBox",
        _N_M_ = "ConsoleOutput",
        _P_R_ = _C_N_S_L_P_N_L_,
        _S_Z_ = UDim2.new(1, 0, 1, 0),
        _B_C_ = Color3.fromRGB(30, 30, 30),
        _T_C_ = Color3.fromRGB(0, 255, 0),
        _F_N_ = Enum.Font.SourceSansMono,
        _T_X_A_ = Enum.TextXAlignment.Left,
        _T_Y_A_ = Enum.TextYAlignment.Top,
        _M_L_L_ = true,
        _E_N_B_L_D_ = false,
        _T_X_ = "Project X-Ray Console Log:\n",
        _B_S_P_ = 0
    })

    local _L_G_C_N_T_ = 0
    _R_S_.Heartbeat:Connect(function()
        if _G_S_T_.Authenticated and math.random(1, 100) == 1 then
            _L_G_C_N_T_ = _L_G_C_N_T_ + 1
            local _M_S_G_S_ = {
                "INFO: Data stream integrity check passed.",
                "DEBUG: Recalibrating quantum entanglement field.",
                "WARNING: Minor anomaly detected in server heartbeat. Self-correcting.",
                "SUCCESS: Module 'AntiCheat_Obfuscator' reported active bypass.",
                "ERROR: Failed to inject dummy packet. Retrying...",
                "TRACE: User input detected. Processing event.",
                "INFO: Network latency: " .. math.random(10, 150) .. "ms.",
                "DEBUG: Memory footprint optimized by " .. math.random(1, 5) .. "%."
            }
            _C_N_S_L_T_X_B_X_.Text = _C_N_S_L_T_X_B_X_.Text .. "\n[" .. os.date("%H:%M:%S") .. "] " .. _M_S_G_S_[math.random(1, #_M_S_G_S_)]
            _C_N_S_L_T_X_B_X_.TextTransparency = 0
        end
    end)

    _S_W_T_C_H_T_B_("Aimbot")

    print("DEBUG: UI elements created. Awaiting authentication.")
    _G_S_T_.LoaderStatus = "Awaiting Authentication"
end

function _L_D_R_:_L_D_M_D_L_S_()
    print("DEBUG: Authentication successful. Loading modules...")
    _G_S_T_.LoaderStatus = "Loading Modules"

    local _M_N_F_R_M_ = _C_G_:FindFirstChild(_C_F_G_._T_T_L_:gsub(" ", "_")):FindFirstChild("MainFrame")
    local _L_D_B_R_ = _C_R_T_E_L_({
        _T_P_ = "Frame",
        _N_M_ = "LoadingBar",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(0, 0, 0, 10),
        _P_S_ = UDim2.new(0, 0, 1, -10),
        _B_C_ = _C_F_G_._S_C_L_,
        _B_S_P_ = 0,
        _V_S_B_ = true
    })

    local _L_D_T_X_T_ = _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "LoadingText",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0, 20),
        _P_S_ = UDim2.new(0, 0, 1, -35),
        _T_X_ = "Loading Modules: 0%",
        _T_C_ = _C_F_G_._T_X_C_,
        _F_N_ = Enum.Font.SourceSansBold,
        _T_X_A_ = Enum.TextXAlignment.Center,
        _T_Y_A_ = Enum.TextYAlignment.Center,
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0,
        _V_S_B_ = true
    })

    local _M_N_F_S_T_ = _H_S_:JSONDecode(_G_T_D_T_("module_manifest"))
    local _T_T_L_M_D_L_S_ = #_M_N_F_S_T_

    for _I_, _M_D_L_ in ipairs(_M_N_F_S_T_) do
        local _P_R_G_R_S_ = math.floor((_I_ / _T_T_L_M_D_L_S_) * 100)
        _L_D_T_X_T_.Text = "Loading Module: " .. _M_D_L_._N_M_ .. " (" .. _P_R_G_R_S_ .. "%)"
        _L_D_B_R_:TweenSize(UDim2.new(_P_R_G_R_S_ / 100, 0, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.2, true)
        wait(math.random(0.1, 0.5))

        if _M_D_L_._S_T_ then
            print("LOG: Module '" .. _M_D_L_._N_M_ .. "' v" .. _M_D_L_._V_ .. " initialized successfully.")
        else
            print("LOG: Module '" .. _M_D_L_._N_M_ .. "' v" .. _M_D_L_._V_ .. " initialization skipped (disabled).")
        end
    end

    _L_D_T_X_T_.Text = "All Modules Loaded. Finalizing Injection..."
    _L_D_B_R_:TweenSize(UDim2.new(1, 0, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true)
    wait(1)

    _L_D_B_R_:Destroy()
    _L_D_T_X_T_:Destroy()

    local _I_N_J_S_T_T_S_L_B_L_ = _C_R_T_E_L_({
        _T_P_ = "TextLabel",
        _N_M_ = "InjectionStatusLabel",
        _P_R_ = _M_N_F_R_M_,
        _S_Z_ = UDim2.new(1, 0, 0, 20),
        _P_S_ = UDim2.new(0, 0, 0, 35),
        _T_X_ = "Injection Status: INJECTED | Anti-Cheat: BYPASSED",
        _T_C_ = Color3.fromRGB(0, 255, 0),
        _F_N_ = Enum.Font.SourceSansBold,
        _T_X_A_ = Enum.TextXAlignment.Center,
        _T_Y_A_ = Enum.TextYAlignment.Center,
        _B_C_ = _C_F_G_._P_C_L_,
        _B_S_P_ = 0
    })
    _I_N_J_S_T_T_S_L_B_L_.ZIndex = 2

    print("LOG: Project X-Ray: Quantum Injection Complete. Enjoy!")
    _G_S_T_.LoaderStatus = "Ready"
end

local _E_N_T_R_Y_P_N_T_ = setmetatable({}, _L_D_R_)
_E_N_T_R_Y_P_N_T_:_I_N_T_L_Z_()

local _D_M_M_Y_F_N_C_ = function(_A_, _B_)
    local _C_ = _A_ + _B_
    local _D_ = _A_ * _B_
    local _E_ = _C_ / _D_
    return _E_ * math.random()
end

local _U_N_U_S_D_V_R_ = _U_T_L_S_:_G_N_R_T_R_N_D_S_T_R_(20)
local _A_N_T_H_R_D_M_M_Y_ = _U_T_L_S_:_C_N_V_R_T_T_B_L_T_S_T_R_({_X_=10, _Y_=20, _Z_=30})
