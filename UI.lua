-- init
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- services
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local is_studio = run:IsStudio()
local tweenservice = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local Library = {}

do --Functions
    function Library:validate(default, options)
        for i,v in pairs(default) do
            if options[i] == nil then
                options[i] = v
            end
        end
        return options
    end
    
    function UpdateToggle(metatable, value, title)
        local toggle_frame = metatable.frame

    end

    function Tween(frame, goal, time, method, callback)
        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle[method], Enum.EasingDirection.InOut)
        local thing = tweenservice:Create(frame, tweenInfo, goal)
        thing:Play()
        callback = callback or function() end
        thing.Completed:Connect(callback)
    end
end

function Library:Init(options)
    options = Library:validate({
        name = "Rail Hub"
    }, options or {})

    local GUI = {
        CurrentTab = nil
    }

    do --Necessary Elements
        -- StarterGui.ScreenGui
        if not is_studio then
            GUI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
        elseif is_studio then
            GUI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui);
        end
        
        GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

        -- StarterGui.ScreenGui.Main
        GUI["2"] = Instance.new("Frame", GUI["1"]);
        GUI["2"]["BorderSizePixel"] = 0;
        GUI["2"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
        GUI["2"]["Size"] = UDim2.new(0, 495, 0, 340);
        GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["2"]["Position"] = UDim2.new(0.38831064105033875, 0, 0.08518518507480621, 0);
        GUI["2"]["Name"] = [[Main]];

        -- StarterGui.ScreenGui.Main.TopBar
        GUI["3"] = Instance.new("Frame", GUI["2"]);
        GUI["3"]["BorderSizePixel"] = 0;
        GUI["3"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
        GUI["3"]["Size"] = UDim2.new(1, 0, 0.02495543658733368, 30);
        GUI["3"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["3"]["Name"] = [[TopBar]];

        -- StarterGui.ScreenGui.Main.TopBar.UIGradient
        GUI["4"] = Instance.new("UIGradient", GUI["3"]);
        GUI["4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(20, 60, 0))};

        -- StarterGui.ScreenGui.Main.TopBar.UICorner
        GUI["5"] = Instance.new("UICorner", GUI["3"]);
        GUI["5"]["CornerRadius"] = UDim.new(0, 10);

        -- StarterGui.ScreenGui.Main.TopBar.TopBarFix
        GUI["6"] = Instance.new("Frame", GUI["3"]);
        GUI["6"]["BorderSizePixel"] = 0;
        GUI["6"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
        GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
        GUI["6"]["Size"] = UDim2.new(1, 0, 0, 15);
        GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
        GUI["6"]["Name"] = [[TopBarFix]];

        -- StarterGui.ScreenGui.Main.TopBar.TopBarFix.UIGradient
        GUI["7"] = Instance.new("UIGradient", GUI["6"]);
        GUI["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(20, 60, 0))};

        -- StarterGui.ScreenGui.Main.TopBar.SeperatorFix
        GUI["8"] = Instance.new("Frame", GUI["3"]);
        GUI["8"]["BorderSizePixel"] = 0;
        GUI["8"]["BackgroundColor3"] = Color3.fromRGB(183, 183, 183);
        GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
        GUI["8"]["Size"] = UDim2.new(1, 0, 0, 1);
        GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
        GUI["8"]["Name"] = [[SeperatorFix]];

        -- StarterGui.ScreenGui.Main.TopBar.Title
        GUI["9"] = Instance.new("TextLabel", GUI["3"]);
        GUI["9"]["BorderSizePixel"] = 0;
        GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
        GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        GUI["9"]["TextSize"] = 17;
        GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 1);
        GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["9"]["Text"] = options.name;
        GUI["9"]["Name"] = [[Title]];
        GUI["9"]["BackgroundTransparency"] = 1;
        GUI["9"]["Position"] = UDim2.new(0, 0, -0.022727273404598236, 0);

        -- StarterGui.ScreenGui.Main.TopBar.Title.UIPadding
        GUI["a"] = Instance.new("UIPadding", GUI["9"]);
        GUI["a"]["PaddingLeft"] = UDim.new(0.07000000029802322, 0);

        -- StarterGui.ScreenGui.Main.TopBar.TabsContainer
        GUI["b"] = Instance.new("Frame", GUI["3"]);
        GUI["b"]["BorderSizePixel"] = 0;
        GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["b"]["BackgroundTransparency"] = 1;
        GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
        GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["b"]["Position"] = UDim2.new(0, 0, 1, 0);
        GUI["b"]["Name"] = [[TabsContainer]];

        -- StarterGui.ScreenGui.Main.TopBar.MinimizeButton
        GUI["1c"] = Instance.new("TextButton", GUI["3"]);
        GUI["1c"]["BorderSizePixel"] = 0;
        GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["1c"]["TextSize"] = 30;
        GUI["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        GUI["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
        GUI["1c"]["Size"] = UDim2.new(0, 35, 0.8500000238418579, 0);
        GUI["1c"]["Name"] = [[MinimizeButton]];
        GUI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["1c"]["Text"] = [[-]];
        GUI["1c"]["Position"] = UDim2.new(1, -42, 0, 0);
        GUI["1c"]["BackgroundTransparency"] = 1;

        -- StarterGui.ScreenGui.Main.UICorner
        GUI["1d"] = Instance.new("UICorner", GUI["2"]);
        GUI["1d"]["CornerRadius"] = UDim.new(0, 10);

        -- StarterGui.ScreenGui.Main.DropShadowHolder
        GUI["1e"] = Instance.new("Frame", GUI["2"]);
        GUI["1e"]["ZIndex"] = 0;
        GUI["1e"]["BorderSizePixel"] = 0;
        GUI["1e"]["BackgroundTransparency"] = 1;
        GUI["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
        GUI["1e"]["Name"] = [[DropShadowHolder]];

        -- StarterGui.ScreenGui.Main.DropShadowHolder.DropShadow
        GUI["1f"] = Instance.new("ImageLabel", GUI["1e"]);
        GUI["1f"]["ZIndex"] = 0;
        GUI["1f"]["BorderSizePixel"] = 0;
        GUI["1f"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
        GUI["1f"]["ScaleType"] = Enum.ScaleType.Slice;
        GUI["1f"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["1f"]["ImageTransparency"] = 0.5;
        GUI["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
        GUI["1f"]["Image"] = [[rbxassetid://6014261993]];
        GUI["1f"]["Size"] = UDim2.new(1, 47, 1, 47);
        GUI["1f"]["Name"] = [[DropShadow]];
        GUI["1f"]["BackgroundTransparency"] = 1;
        GUI["1f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

        -- StarterGui.ScreenGui.Main.Container
        GUI["20"] = Instance.new("Frame", GUI["2"]);
        GUI["20"]["BorderSizePixel"] = 0;
        GUI["20"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
        GUI["20"]["Size"] = UDim2.new(1, 0, 1, -95);
        GUI["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
        GUI["20"]["Position"] = UDim2.new(0, 0, 0, 85);
        GUI["20"]["Name"] = [[Container]];

        -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.UIGridLayout
        GUI["f"] = Instance.new("UIGridLayout", GUI["b"]);
        GUI["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
        GUI["f"]["CellSize"] = UDim2.new(0, 95, 0, 40);
    end
    function GUI:CreateTab(options)
        options = Library:validate({
            name = "Tab"
        }, options or {})

        local Tab = {
            Hover = false,
            Active = false
        }

        do --Elements
            -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1
            Tab["c"] = Instance.new("Frame", GUI["b"]);
            Tab["c"]["BorderSizePixel"] = 0;
            Tab["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
            Tab["c"]["BackgroundTransparency"] = 1;
            Tab["c"]["Size"] = UDim2.new(0, 100, 0, 100);
            Tab["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Tab["c"]["Name"] = options.name;

            -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1.StyleLine
            Tab["d"] = Instance.new("Frame", Tab["c"]);
            Tab["d"]["BorderSizePixel"] = 0;
            Tab["d"]["BackgroundColor3"] = Color3.fromRGB(153, 153, 153);
            Tab["d"]["BackgroundTransparency"] = 0.5;
            Tab["d"]["Size"] = UDim2.new(0.6000000238418579, 0, 0.019999999552965164, 0);
            Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Tab["d"]["Position"] = UDim2.new(0.029999999329447746, 17, 0.20000000298023224, 23);
            Tab["d"]["Name"] = [[StyleLine]];

            Tab["2gzgz2"] = Instance.new("UIGradient", Tab["d"]);
            Tab["2gzgz2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
            Tab["2gzgz2"]["Offset"] = Vector2.new(1, 0);

            -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1.TextLabel
            Tab["e"] = Instance.new("TextLabel", Tab["c"]);
            Tab["e"]["BorderSizePixel"] = 0;
            Tab["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
            Tab["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
            Tab["e"]["TextTransparency"] = 0.5;
            Tab["e"]["TextSize"] = 14;
            Tab["e"]["TextColor3"] = Color3.fromRGB(208, 208, 208);
            Tab["e"]["Size"] = UDim2.new(1, 0, 1, 0);
            Tab["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Tab["e"]["Text"] = options.name;
            Tab["e"]["BackgroundTransparency"] = 1;

            Tab["2gzgz"] = Instance.new("UIGradient", Tab["e"]);
            Tab["2gzgz"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
            Tab["2gzgz"]["Offset"] = Vector2.new(1, 0);

            -- StarterGui.ScreenGui.Main.Container.MainContainer
            Tab["21"] = Instance.new("ScrollingFrame", GUI["20"]);
            Tab["21"]["Active"] = true;
            Tab["21"]["BorderSizePixel"] = 0;
            Tab["21"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
            Tab["21"]["Size"] = UDim2.new(1, 0, 1, 0);
            Tab["21"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
            Tab["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Tab["21"]["Name"] = options.name.."Container";
            Tab["21"]["Visible"] = false

            -- StarterGui.ScreenGui.Main.Container.MainContainer.UIListLayout
            Tab["27"] = Instance.new("UIListLayout", Tab["21"]);
            Tab["27"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
            Tab["27"]["Padding"] = UDim.new(0, 10);
            Tab["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

            -- StarterGui.ScreenGui.Main.Container.MainContainer.UIPadding
            Tab["28"] = Instance.new("UIPadding", Tab["21"]);
            Tab["28"]["PaddingTop"] = UDim.new(0, 5);
        end

        local textui = Tab["e"]
        local lineui = Tab["d"]
        local gradientui_linestyle = Tab["2gzgz2"]
        local gradientui_text = Tab["2gzgz"]

        
        function Tab:Deactivate()
            if Tab.Active then
                if GUI.CurrentTab then
                    local tab = GUI.CurrentTab["21"]
                    GUI.CurrentTab = nil
                    Tween(tab, {BackgroundTransparency = 1}, 0.7, "Linear", function()
                        tab.Visible = false
                    end)
                end
            end
        end

        function Tab:Activate()
            if not Tab.Active then
                Tab.Active = true
                if GUI.CurrentTab then
                    Tab:Deactivate()
                end
                if GUI.CurrentTab == nil then
                    GUI.CurrentTab = Tab
                    Tab["21"].BackgroundTransparency = 1
                    Tab["21"].Visible = true
                    Tween(Tab["21"], {BackgroundTransparency = 0}, 0.7, "Linear")
                end
            end
        end

        do --scripts
            textui.MouseEnter:Connect(function()
                if Tab.Active then return end
                Tab.Hover = true
                local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                tweenservice:Create(lineui, tweenInfo, {BackgroundTransparency = 0}):Play()
                tweenservice:Create(textui, tweenInfo, {TextTransparency = 0}):Play()
            end)

            textui.MouseLeave:Connect(function()
                if Tab.Active then return end
                Tab.Hover = false
                local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                tweenservice:Create(lineui, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                tweenservice:Create(textui, tweenInfo, {TextTransparency = 0.5}):Play()
            end)

            uis.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                
                if input.UserInputType == Enum.UserInputType.MouseButton1 and Tab.Hover then
                    if Tab.Active == false then
                        Tab:Activate()
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        local thing = tweenservice:Create(textui, tweenInfo, {TextSize = 15})
                        tweenservice:Create(lineui, tweenInfo, {BackgroundTransparency = 0}):Play()
                        tweenservice:Create(textui, tweenInfo, {TextTransparency = 0}):Play()
                        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        tweenservice:Create(gradientui_linestyle, tweenInfo, {Offset = Vector2.new(0, 0)}):Play()
                        tweenservice:Create(gradientui_text, tweenInfo, {Offset = Vector2.new(0, 0)}):Play()
                        thing:Play()
                        thing.Completed:Connect(function()
                            tweenservice:Create(textui, tweenInfo, {TextSize = 14}):Play()
                        end)
                    elseif Tab.Active == true then
                        Tab:Deactivate()
                    end
                end
            end)
        end

        function Tab:CreateSection(options)
            options = Library:validate({
                name = "Section"
            }, options or {})

            local Section = {}

            do --Elements
                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart
                Section["58"] = Instance.new("Frame", Tab["21"]);
                Section["58"]["BorderSizePixel"] = 0;
                Section["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Section["58"]["BackgroundTransparency"] = 1;
                Section["58"]["Size"] = UDim2.new(1, -24, 0, 20);
                Section["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Section["58"]["Name"] = [[SectionStart]];

                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name
                Section["59"] = Instance.new("TextLabel", Section["58"]);
                Section["59"]["TextWrapped"] = true;
                Section["59"]["BorderSizePixel"] = 0;
                Section["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Section["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                Section["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Section["59"]["TextSize"] = 14;
                Section["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Section["59"]["Size"] = UDim2.new(0.9087048768997192, -70, 1, 0);
                Section["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Section["59"]["Text"] = [[Section Misc Container]];
                Section["59"]["Name"] = [[Name]];
                Section["59"]["BackgroundTransparency"] = 1;
                Section["59"]["Position"] = UDim2.new(0, 25, 0, 0);

                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name.Line
                Section["5a"] = Instance.new("Frame", Section["59"]);
                Section["5a"]["BorderSizePixel"] = 0;
                Section["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Section["5a"]["AnchorPoint"] = Vector2.new(1, 1);
                Section["5a"]["Size"] = UDim2.new(1, 0, 1, -19);
                Section["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Section["5a"]["Position"] = UDim2.new(1, 48, 1, -9);
                Section["5a"]["Name"] = [[Line]];

                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name.LocalScript
                Section["5b"] = Instance.new("LocalScript", Section["59"]);


                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.ImageLabel
                Section["5c"] = Instance.new("ImageLabel", Section["58"]);
                Section["5c"]["BorderSizePixel"] = 0;
                Section["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Section["5c"]["ImageTransparency"] = 0.3400000035762787;
                Section["5c"]["Image"] = [[rbxassetid://14547044193]];
                Section["5c"]["Size"] = UDim2.new(0, 15, 0, 15);
                Section["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Section["5c"]["BackgroundTransparency"] = 1;
                Section["5c"]["Position"] = UDim2.new(0, 3, 0, 3);

                -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.ImageLabel.UICorner
                Section["5d"] = Instance.new("UICorner", Section["5c"]);
                Section["5d"]["CornerRadius"] = UDim.new(0, 2);
            end
            return Section
        end

        function Tab:CreateToggle(options)
            options = Library:validate({
                name = "Toggle",
                default = false,
                callback = function() end
            }, options or {})

            local Toggle = {
                Hover = false,
                Activated = options.default
            }

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer
            Toggle["29"] = Instance.new("Frame", Tab["21"]);
            Toggle["29"]["BorderSizePixel"] = 0;
            Toggle["29"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
            Toggle["29"]["Size"] = UDim2.new(1, -30, 0, 35);
            Toggle["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Toggle["29"]["Position"] = UDim2.new(0, 10, 0, 0);
            Toggle["29"]["Name"] = [[ToggleContainer]];

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.UICorner
            Toggle["2a"] = Instance.new("UICorner", Toggle["29"]);
            Toggle["2a"]["CornerRadius"] = UDim.new(0, 10);

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.UIStroke
            Toggle["2b"] = Instance.new("UIStroke", Toggle["29"]);
            Toggle["2b"]["Color"] = Color3.fromRGB(255, 255, 255);
            Toggle["2b"]["Thickness"] = 0.8999999761581421;
            Toggle["2b"]["Transparency"] = 0.800000011920929;

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.Name
            Toggle["2c"] = Instance.new("TextLabel", Toggle["29"]);
            Toggle["2c"]["BorderSizePixel"] = 0;
            Toggle["2c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
            Toggle["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
            Toggle["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
            Toggle["2c"]["TextSize"] = 16;
            Toggle["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
            Toggle["2c"]["Size"] = UDim2.new(1, -20, 1, 0);
            Toggle["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Toggle["2c"]["Text"] = options.name;
            Toggle["2c"]["Name"] = [[Name]];
            Toggle["2c"]["BackgroundTransparency"] = 1;
            Toggle["2c"]["Position"] = UDim2.new(0, 14, 0, 0);

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.TextButton
            Toggle["2d"] = Instance.new("TextButton", Toggle["29"]);
            Toggle["2d"]["TextStrokeTransparency"] = 0;
            Toggle["2d"]["BorderSizePixel"] = 0;
            Toggle["2d"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
            Toggle["2d"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
            Toggle["2d"]["TextSize"] = 14;
            Toggle["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
            Toggle["2d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
            Toggle["2d"]["Size"] = UDim2.new(0, 27, 1, -10);
            Toggle["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Toggle["2d"]["Text"] = [[]];
            Toggle["2d"]["Position"] = UDim2.new(1, -45, 0, 5);

            Toggle["ier2"] = Instance.new("UIStroke", Toggle["2d"])
            Toggle["Thickness"] = 1
            Toggle["Transparency"] = 0

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.TextButton.UICorner
            Toggle["2e"] = Instance.new("UICorner", Toggle["2d"]);
            Toggle["2e"]["CornerRadius"] = UDim.new(0, 10);

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.TextButton.Enabled
            Toggle["2f"] = Instance.new("Frame", Toggle["2d"]);
            Toggle["2f"]["BorderSizePixel"] = 0;
            Toggle["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
            Toggle["2f"]["Size"] = UDim2.new(0, 0, 0, 0);
            Toggle["2f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
            Toggle["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
            Toggle["2f"]["Name"] = [[Enabled]];

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.TextButton.Enabled.UICorner
            Toggle["30"] = Instance.new("UICorner", Toggle["2f"]);
            Toggle["30"]["CornerRadius"] = UDim.new(0, 10);

            -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.TextButton.Enabled.UIGradient
            Toggle["31"] = Instance.new("UIGradient", Toggle["2f"]);
            Toggle["31"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0.20000000298023224),NumberSequenceKeypoint.new(1.000, 0.20000000298023224)};
            Toggle["31"]["Rotation"] = 90;
            Toggle["31"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 158, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(157, 126, 3))};

            Toggle["2d"].MouseButton1Up:Connect(function()
                if Toggle.Activated == false then
                    Toggle.Activated = true
                    Toggle["2f"]:TweenSize(UDim2.new(1,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                    Toggle["2f"]:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                elseif Toggle.Activated == true then
                    Toggle.Activated = false
                    Toggle["2f"]:TweenSize(UDim2.new(0,0,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                    Toggle["2f"]:TweenPosition(UDim2.new(0.5,0,0.5,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                end
            end)

            local metatable = {
                name = options.name,
                callback = options.callback,
                origin = "Toggle",
                frame = Toggle["2d"],
                status = Toggle.Activated
            }

            return metatable
        end
        return Tab
    end
    return GUI
end
