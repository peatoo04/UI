local Name = game.Players.LocalPlayer.Name

getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not isfolder('Sentinels Hub') then
        makefolder('Sentinels Hub')
    end
    if not isfile('Sentinels Hub/'..Name..'.json') then
        writefile('Sentinels Hub/'..Name..'.json',JsonEncode(_G.Setting))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if isfolder('Sentinels Hub') and isfile('Sentinels Hub/'..Name..'.json') then
        _G.Setting= JsonDecode(readfile('Sentinels Hub/'..Name..'.json'))
        return _G.Setting
	else
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if isfolder('Sentinels Hub') and isfile('Sentinels Hub/'..Name..'.json') then
        writefile('Sentinels Hub/'..Name..'.json',JsonEncode(_G.Setting))
	else
        Check_Setting(Name)
    end
end
