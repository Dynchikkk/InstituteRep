import telebot
import time
import os
from dotenv import load_dotenv

# Токен, который выдает @botfather

dotenv_path = os.path.join(os.path.dirname(__file__), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)
BOT_TOKEN = os.getenv('BOT_TOKEN_ANEKDOT')
bot = telebot.TeleBot(BOT_TOKEN)

# Адрес телеграм-канала, начинается с @
CHANNEL_NAME = '@psks_anekdot'
# Загружаем список шуток
f = open('data/fun.txt', 'r', encoding='UTF-8')
jokes = f.read().split('\n')
f.close()
# Пока не закончатся шутки, посылаем их в канал
for joke in jokes:
    try:
        bot.send_message(CHANNEL_NAME, joke)
        # Делаем паузу в один час
        time.sleep(10)
    except telebot.apihelper.ApiTelegramException as e:
            print(f"Не удалось отправить сообщение в канал {CHANNEL_NAME}: {e}")
bot.send_message(CHANNEL_NAME, "Анекдоты закончились :-(")
