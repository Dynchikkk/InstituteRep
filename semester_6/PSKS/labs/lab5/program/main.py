# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pandas.plotting import scatter_matrix
from matplotlib.colors import ListedColormap

# Чтение файла с 15 признаками, столбцы разделены пробелом.
# Используем raw-строку для разделителя.
data = pd.read_csv("australian.dat", sep=r"\s+", header=None)
data.columns = ["A1", "A2", "A3", "A4", "A5", "A6", "A7",
                "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15"]

print("Первые 5 строк:")
print(data.head())
print("\nИнформация о данных:")
print(data.info())

# Приводим целевой признак к булевому значению: True, если A15==1 (подлинная), иначе False (поддельная)
data['A15'] = data['A15'] == 1
print("\nПервые 5 строк после преобразования A15:")
print(data.head())
print("\nИнформация о данных после преобразования:")
print(data.info())

# Проверка и удаление дубликатов
print("\nКоличество дубликатов в данных:", data.duplicated().sum())
data = data.drop_duplicates()
print("Количество дубликатов после удаления:", data.duplicated().sum())

# Вывод описательной статистики для всех признаков
print("\nОписательная статистика для всех признаков:")
print(data.describe(include='all'))

# Анализ распределения целевого признака
print("\nРаспределение целевого признака (A15):")
print(data['A15'].value_counts())

# Анализ по классам с использованием выбранных числовых признаков: A2, A3, A7, A10, A13, A14
numeric_features = ["A2", "A3", "A7", "A10", "A13", "A14"]
print("\nОписательная статистика для записей, где A15 == True (подлинные):")
print(data[data['A15'] == True][numeric_features].describe())
print("\nОписательная статистика для записей, где A15 == False (поддельные):")
print(data[data['A15'] == False][numeric_features].describe())

# Выборка случайных записей для построения графиков
n_samples = min(1000, len(data))
sample_data = data.sample(n=n_samples, random_state=42)


# Построим график одного из признаков (например, A2)
plt.figure()
plt.plot(sample_data['A2'])
plt.title('График признака A2')
plt.xlabel('Индекс записи')
plt.ylabel('Значение A2')
plt.show()

# Диаграмма рассеяния для пары признаков (например, A2 и A3)
plt.figure()
plt.grid(True)
plt.title('Диаграмма рассеяния: A2 vs A3')
plt.xlabel('A2')
plt.ylabel('A3')
# Используем разные цвета для классов: подлинные (True) и поддельные (False)
cmap_bold = ListedColormap(['#FF0000', '#00FF00'])
plt.scatter(sample_data['A2'], sample_data['A3'], c=sample_data['A15'], cmap=cmap_bold)
plt.show()

# Диаграмма размаха (Boxplot) для выбранных числовых признаков
numeric_features_2 = ["A2", "A3", "A7"]
plt.figure(figsize=(10, 6))
plt.title('Boxplot для признаков A2, A3, A7')
boxplot_data = sample_data[numeric_features_2].values
boxplot_data[np.isnan(boxplot_data)] = 0
plt.boxplot(boxplot_data, labels=numeric_features_2)
plt.ylabel('Значения признаков')
#plt.ylim(-10, 500)
plt.show()

# Матрица диаграмм рассеяния для выбранных числовых признаков
scatter_matrix(sample_data[numeric_features], alpha=0.5, figsize=(10, 10))
plt.suptitle('Матрица диаграмм рассеяния для числовых признаков')
plt.show()

# Корреляционный анализ для выбранных числовых признаков
print("\nКорреляция между выбранными числовыми признаками:")
print(data[numeric_features].corr())

plt.figure(figsize=(12, 8))
for col in numeric_features:
    plt.plot(sample_data[col], '.', label=col)

plt.yscale('log')
plt.title('Признаки  по оси Y')
plt.legend()
plt.grid(True)
plt.show()
