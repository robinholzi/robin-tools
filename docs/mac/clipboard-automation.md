To achieve what you’re describing—securely pasting a password into a Citrix VDI from your MacBook by simulating keyboard input while using clipboard history (like Raycast’s) and optionally gating it behind biometric authentication—you can build a solution using a few tools:

⸻

🔧 Overview of the Solution

This approach involves: 1. Reading from clipboard history (Raycast or macOS clipboard). 2. Simulating keyboard typing to input the password into Citrix. 3. (Optional) Requiring fingerprint authentication before triggering the input. 4. Binding this to a global macOS keyboard shortcut.

⸻

🔑 Tools You’ll Need

Tool Purpose
Hammerspoon Automate Mac actions including keypress simulation.
TouchID check via sudo (optional) Add biometric confirmation.
AppleScript or CLI Access latest clipboard entry or interface with Raycast’s history.
(Optional) Raycast API or Script Command If you want specific item from clipboard history.

⸻

🛠️ Step-by-Step Implementation

1. Install Hammerspoon

Install via https://www.hammerspoon.org, then open its config file ~/.hammerspoon/init.lua.

2. Simulate Keystrokes from Clipboard

Add this Lua function to type your clipboard content:

```lua
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
    local password = hs.pasteboard.getContents()
    if password then
        hs.eventtap.keyStrokes(password)
    else
        hs.alert.show("Clipboard is empty!")
    end
end)
```

This registers Cmd + Alt + Ctrl + P to type the current clipboard content.

3. Secure It with Touch ID (Optional)

You can create a Touch ID-protected script:

```lua
function touchIDPrompt()
    local ok, _, _ = hs.osascript.applescript([[
        display dialog "Authenticate to input password" buttons {"Cancel", "OK"} default button 2 with icon note with title "Password Injection"
    ]])
    return ok
end
```

Then update the keybind to:

```lua
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
    if touchIDPrompt() then
        local password = hs.pasteboard.getContents()
        if password then
            hs.eventtap.keyStrokes(password)
        else
            hs.alert.show("Clipboard is empty!")
        end
    else
        hs.alert.show("Authentication cancelled")
    end
end)
```

Note: True Touch ID auth via Terminal requires enabling sudo Touch ID support and is more complex. This GUI prompt mimics it securely.

⸻

🧠 Optional: Accessing Raycast Clipboard History

Raycast doesn’t officially expose clipboard history via CLI yet, but you could: 1. Use Raycast’s Script Commands to send specific history items to clipboard. 2. Use a small Swift/AppleScript app to grab prior clipboard entries if stored locally. 3. Workaround: Keep recent entries using Clipy or Paste which have CLI/AppleScript access.

⸻

🔒 Security Advice
• Avoid hardcoding passwords.
• Clipboard contents are volatile—don’t store secrets there longer than needed.
• Use the macOS Keychain if you need to store credentials securely.

⸻

🧪 Testing Tips 1. Launch Citrix. 2. Copy a password to clipboard. 3. Trigger your Hammerspoon shortcut. 4. Confirm the password types out in the Citrix window.

⸻

✅ Summary

You can achieve your goal by:
• Using Hammerspoon to simulate typing the clipboard content,
• Triggering that via a global shortcut,
• Optionally securing the trigger with a Touch ID-prompt GUI,
• Possibly integrating with Raycast clipboard history using helper scripts.

Would you like help setting up a Raycast Script Command to access specific clipboard history entries or a deeper Touch ID integration via sudo and PAM configuration?

## Installation Steps

1. Install hammerspoon

```bash
brew install hammerspoon
```

2. Edit the Hammerspoon configuration file

~/.hammerspoon/init.lua

```lua
-- emulate clipboard keyboard input
hs.hotkey.bind({"alt", "ctrl"}, "P", function()
    local password = hs.pasteboard.getContents()
    if password then
        hs.eventtap.keyStrokes(password)
    else
        hs.alert.show("Clipboard is empty!")
    end
end)

-- emulate aok password
hs.hotkey.bind({"alt", "ctrl"}, "A", function()
    local pwd = "<TODO>"
    hs.eventtap.keyStrokes(" " .. pwd)
end)
```

3. Open Preferences (in case you disabled start menu item)

In Hammerspoon terminal: `hs.openPreferences()`

Reload Hammerspoon config: `hs.reload()`
