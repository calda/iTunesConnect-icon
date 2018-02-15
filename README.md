# iTunesConnect-icon
Script that adds an apple-touch-icon for iTunes Connect to Safari's Icon Cache

### Before 😢
<img src="images/before.png" width=300>

### After `itc-icon` 😍
<img src="images/after.png" width=300>

## Running `itc-icon`

If you trust the executable in this repsitory, you can download and run it by pasting this into your terminal:

```
echo "Downloading..." && curl -sL https://github.com/calda/iTunesConnect-icon/raw/master/itc-icon --output itc-icon && echo "Need sudo to execute script (sudo chmod 777 itc-icon && itc-icon):" && sudo chmod 777 itc-icon && ./itc-icon
```

_Expanded script:_
```
'echo "Downloading..." 
curl -sL https://github.com/calda/iTunesConnect-icon/raw/master/itc-icon --output itc-icon
echo "Need sudo to execute script (sudo chmod 777 itc-icon && itc-icon):"
sudo chmod 777 itc-icon
./itc-icon'
```

If you want to compile it from source yourself (`main.swift`), just download and run the Xcode project.
