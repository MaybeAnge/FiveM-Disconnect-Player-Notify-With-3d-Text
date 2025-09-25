# FiveM-Disconnect-Player-Notify-With-3d-Text
A simple and lightweight FiveM resource to display 3D floating text for player events such as disconnects, kicks, and bans. This resource allows you to show real-time notifications above players’ heads, making it easy for admins and other players to see important events in-game. Fully customizable text, duration, and position.

## 📹 Demonstration video

<p align="center">
  <a href="https://youtu.be/QAnAt_eD2yQ">
    <img src="https://img.youtube.com/vi/QB0WcXQ3hoc/0.jpg" alt="Vidéo YouTube" width="480"/>
  </a>
</p>

## 💻 Using it in a RageUI

- Import this resource in `fxmanifest.lua`
```lua
dependancies {
    "player_statut"
}
```
- Call events
```lua
RageUI.Button("~y~Kick", nil, {}, true, {
    onSelected = function()
        KeyboardInput("Motif du kick :", "", 128, function()
            TriggerServerEvent("player_statut:kickPlayer", selectedPlayer)
        end)
    end
})
```

You can create as many events as you want directly on the `server.lua` in this resource and call them in your scripts to trigger the game text.
