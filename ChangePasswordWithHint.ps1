# Путь к файлу с паролями и подсказками
$passwordFile = "C:\Users\ВашеИмяПользователя\Documents\passwords.txt"
$Username = "ВашеИмяПользователя"

# Чтение всех строк из файла
$passwords = Get-Content -Path $passwordFile

# Случайный выбор строки (пароль и подсказка)
$randomLine = $passwords | Get-Random

# Разделение строки на пароль и подсказку
$parts = $randomLine -split ","
$NewPassword = $parts[0].Trim()
$Hint = $parts[1].Trim()

# Установка нового пароля для пользователя
net user $Username $NewPassword

# Логирование нового пароля и подсказки
$logFile = "C:\Users\$Username\Documents\password_log.txt"
Add-Content -Path $logFile -Value "$(Get-Date): Новый пароль для $Username - $NewPassword. Подсказка: $Hint"
