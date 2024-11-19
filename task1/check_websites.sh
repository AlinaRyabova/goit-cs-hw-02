#!/bin/bash

# Список вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу для збереження результатів
logfile="website_status.log"

# Очистимо файл логів перед новим запуском
> "$logfile"

# Цикл для перевірки кожного вебсайту
for website in "${websites[@]}"; do
    # Використовуємо curl для перевірки статусу сайту
    http_status=$(curl -o /dev/null -s -w "%{http_code}" "$website")

    # Перевіряємо чи отримано HTTP код 200
    if [[ "$http_status" -eq 200 ]]; then
        echo "$website is UP" | tee -a "$logfile"
    else
        echo "$website is DOWN" | tee -a "$logfile"
    fi
done

# Вивести повідомлення про завершення
echo "Результати перевірки збережено у файл: $logfile"
