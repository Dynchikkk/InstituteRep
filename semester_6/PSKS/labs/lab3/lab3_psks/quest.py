from telebot import TeleBot, types
from random import randint
from dotenv import load_dotenv
import os

pictures = {
    0: "https://cdn.ryfma.com/images/ozJtmxqwo9PBpAMWC/posts/post_full_1601737968052_podzemele_1-jpg.jpg",
    1: "https://i.pinimg.com/736x/99/fa/fe/99fafead23c7da4b258e28a0c4e4baef.jpg",
    2: "https://avatars.dzeninfra.ru/get-zen_doc/1852570/pub_5d9e314b43863f00b00484ec_5d9e33f278125e00add2095c/scale_1200",
    3: "https://avatars.mds.yandex.net/i?id=22eea756c612e810255a8b6cedcce920049ad407-5246350-images-thumbs&n=13",
    4: "https://c.wallhere.com/photos/57/44/stairs_door_window_lights_digital_art_digital_lighting-92330.jpg!d",
    5: "https://thumbs.dreamstime.com/b/вопрос-о-вери-38320736.jpg",
    6: "https://avatars.mds.yandex.net/i?id=1f01ec801ed4d46d42631eae977cb859_l-5910394-images-thumbs&n=13",
    7: "https://avatars.mds.yandex.net/i?id=fc2e64c75fcc03556739197998f5b8d1_l-5236988-images-thumbs&n=13",
    8: "https://avatars.mds.yandex.net/i?id=fc2e64c75fcc03556739197998f5b8d1_l-5236988-images-thumbs&n=13"
}

states = {}
inventories = {}
awaiting_answers = {}

dotenv_path = os.path.join(os.path.dirname(__file__), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)
BOT_TOKEN = os.getenv('BOT_TOKEN_QUEST')
bot = TeleBot(BOT_TOKEN)


@bot.message_handler(commands=["start"])
def start_game(message):
    user = message.chat.id
    states[user] = 0
    inventories[user] = []
    bot.send_message(user, "Добро пожаловать в игру!")
    process_state(user, states[user], inventories[user])


@bot.callback_query_handler(func=lambda call: True)
def user_answer(call):
    user = call.message.chat.id
    process_answer(user, call.data)


def process_state(user, state, inventory):
    kb = types.InlineKeyboardMarkup()
    bot.send_photo(user, pictures[state])

    if state == 0:
        kb.add(types.InlineKeyboardButton(text="пойти направо", callback_data="1"))
        kb.add(types.InlineKeyboardButton(text="пойти налево", callback_data="2"))
        bot.send_message(user, "Вы оказались в темном подземелье, перед вами два прохода.", reply_markup=kb)
    elif state == 1:
        kb.add(types.InlineKeyboardButton(text="осмотреть сундук", callback_data="3"))
        kb.add(types.InlineKeyboardButton(text="идти дальше", callback_data="4"))
        bot.send_message(user, "Вы нашли старый сундук. Открыть или идти дальше?", reply_markup=kb)
    elif state == 2:
        kb.add(types.InlineKeyboardButton(text="идти вперед", callback_data="5"))
        bot.send_message(user, "Вы прошли через дверь и оказались в большой комнате.", reply_markup=kb)
    elif state == 3:
        if randint(1, 10) > 3:
            inventories[user].append("ключ")
            bot.send_message(user, "Вы нашли ключ в сундуке!")
        else:
            bot.send_message(user, "Сундук оказался пустым.")
        states[user] = 4
        process_state(user, states[user], inventories[user])
    elif state == 4:
        kb.add(types.InlineKeyboardButton(text="спуститься вниз", callback_data="6"))
        kb.add(types.InlineKeyboardButton(text="взять факел", callback_data="8"))
        bot.send_message(user, "Вы попали в коридор с лестницей вниз. Здесь лежит факел.", reply_markup=kb)
    elif state == 5:
        kb.add(types.InlineKeyboardButton(text="1 кг железа", callback_data="wrong"))
        kb.add(types.InlineKeyboardButton(text="1 кг пуха", callback_data="wrong"))
        kb.add(types.InlineKeyboardButton(text="Они весят одинаково", callback_data="correct"))
        bot.send_message(user,
                         "Перед вами массивная дверь. Чтобы пройти, вам нужно решить загадку: Что тяжелее: 1 кг железа или 1 кг пуха?",
                         reply_markup=kb)
    elif state == 6:
        if "факел" in inventory:
            bot.send_message(user, "Вы осветили путь факелом и прошли дальше.")
            states[user] = 7
        else:
            bot.send_message(user, "Здесь слишком темно, без факела идти опасно.")
    elif state == 7:
        if "ключ" in inventory:
            bot.send_message(user, "Вы открыли дверь ключом и выбрались наружу. Победа!")
            states[user] = 8
        else:
            bot.send_message(user, "Дверь заперта, но вы можете попробовать выбить её (шанс 50%).")
            if randint(1, 10) > 5:
                bot.send_message(user, "Вы с силой толкнули дверь, и она поддалась! Вы выбрались наружу. Победа!")
                states[user] = 8
            else:
                bot.send_message(user, "Вы не смогли выбить дверь. Попробуйте ещё раз.")
    elif state == 8:
        kb.add(types.InlineKeyboardButton(text="Начать заново", callback_data="restart"))
        bot.send_message(user, "Поздравляем, вы прошли игру! Хотите сыграть снова?", reply_markup=kb)


def process_answer(user, answer):
    if answer == "restart":
        start_game(types.Message(chat=types.Chat(id=user)))
        return

    if states[user] == 0:
        if answer == "1":
            states[user] = 1
        else:
            states[user] = 2
    elif states[user] == 1:
        if answer == "3":
            states[user] = 3
        else:
            states[user] = 4
    elif states[user] == 2:
        states[user] = 5
    elif states[user] == 4:
        if answer == "6":
            states[user] = 6
        elif answer == "8":
            states[user] = 8
    elif states[user] == 5:
        if answer == "correct":
            bot.send_message(user, "Верно! Дверь открывается.")
            states[user] = 7
        else:
            bot.send_message(user, "Неправильно. Попробуйте еще раз.")
    process_state(user, states[user], inventories[user])


bot.polling(none_stop=True)
