# Dockerfile
FROM python:3.9-slim

# Встановлення системних залежностей
RUN apt-get update && apt-get install -y libpq-dev gcc

# Робочий каталог
WORKDIR /app

# Скопіюйте залежності
COPY requirements.txt requirements.txt

# Встановіть Python-залежності
RUN pip install --no-cache-dir -r requirements.txt

# Скопіюйте решту файлів проєкту
COPY . .

# Запускайте застосунок
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
