bluetooth() {
  local bt=$(bluetoothctl show | grep "Powered" | cut -d ":" -f2)
  local info=$(bluetoothctl info)
  local dispositivo=$(bluetoothctl info | grep "Alias" | cut -d ":" -f2)

  if [ $bt = "yes" ] 
  then
    if [[ $info = "Missing device address argument" ]]
    then
      # bluetooth activado pero sin conectar dispositivo
      echo "%{F#abb2bf}"
    else
      # bluetooth con dispositivo conectado
      echo "" $dispositivo
    fi
  else
    # bluetooth desactivado
    echo "%{F#5c6370}"
  fi
}

bluetooth
