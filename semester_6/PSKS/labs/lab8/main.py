# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import StandardScaler

from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier

from sklearn.ensemble import AdaBoostClassifier, StackingClassifier

from sklearn.metrics import accuracy_score, precision_score, recall_score, classification_report

# Загрузка и предварительная обработка данных
# Предполагается, что данные разделены пробелами или табуляцией
data = pd.read_csv("australian.dat", sep="\\s+", header=None)

# Задаём имена столбцов: первые 14 – признаки, 15-й – целевая переменная
feature_names = [f"attr{i}" for i in range(1, 15)]
data.columns = feature_names + ["credit"]

# Приводим метки к булевому типу (True, если кредит можно выдать)
data['credit'] = data['credit'] == 1

# Удаляем дубликаты
data = data.drop_duplicates()

# Разделяем данные на признаки и целевую переменную
X = data.loc[:, feature_names]
y = data.loc[:, 'credit']

# (Опционально) Стандартизация признаков
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Разделяем выборку на обучающую и тестовую (40% для теста)
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.4, shuffle=True, random_state=42)

# Словарь для хранения результатов моделей
results = {}

###############################################
# 1. Метод ближайших соседей (KNN)
###############################################
print("Метод ближайших соседей (KNN):")
knn = KNeighborsClassifier()
# Оптимизация параметра n_neighbors через GridSearchCV
param_dict = {'n_neighbors': list(range(1, 100))}
grid = GridSearchCV(knn, param_dict, scoring='accuracy', cv=5)
grid.fit(X_train, y_train)
best_n = grid.best_params_.get('n_neighbors')

knn = KNeighborsClassifier(n_neighbors=best_n)
knn.fit(X_train, y_train)
y_pred_knn = knn.predict(X_test)

acc_knn = accuracy_score(y_test, y_pred_knn)
prec_knn = precision_score(y_test, y_pred_knn, average='macro')
rec_knn = recall_score(y_test, y_pred_knn, average='macro')

results['KNN'] = {'accuracy': acc_knn, 'precision': prec_knn, 'recall': rec_knn}
print("Accuracy:", acc_knn)
print("Precision:", prec_knn)
print("Recall:", rec_knn)
print(classification_report(y_test, y_pred_knn, target_names=['No Credit', 'Credit']))
print("\n--------------------------------------------\n")

###############################################
# 2. Метод наименьших квадратов (Least Squares)
###############################################
print("Метод наименьших квадратов (Least Squares):")
ls_model = LinearRegression()
ls_model.fit(X_train, y_train)
# Предсказание и бинаризация по порогу 0.5
y_pred_ls = ls_model.predict(X_test)
y_pred_ls_binary = np.where(y_pred_ls >= 0.5, True, False)

acc_ls = accuracy_score(y_test, y_pred_ls_binary)
prec_ls = precision_score(y_test, y_pred_ls_binary, average='macro')
rec_ls = recall_score(y_test, y_pred_ls_binary, average='macro')

results['LeastSquares'] = {'accuracy': acc_ls, 'precision': prec_ls, 'recall': rec_ls}
print("Accuracy:", acc_ls)
print("Precision:", prec_ls)
print("Recall:", rec_ls)
print(classification_report(y_test, y_pred_ls_binary, target_names=['No Credit', 'Credit']))
print("\n--------------------------------------------\n")

###############################################
# 3. Метод опорных векторов (SVM)
###############################################
print("Метод опорных векторов (SVM):")
svm_model = SVC(kernel='rbf', gamma='scale', C=1, random_state=42)
svm_model.fit(X_train, y_train)
y_pred_svm = svm_model.predict(X_test)

acc_svm = accuracy_score(y_test, y_pred_svm)
prec_svm = precision_score(y_test, y_pred_svm, average='macro')
rec_svm = recall_score(y_test, y_pred_svm, average='macro')

results['SVM'] = {'accuracy': acc_svm, 'precision': prec_svm, 'recall': rec_svm}
print("Accuracy:", acc_svm)
print("Precision:", prec_svm)
print("Recall:", rec_svm)
print(classification_report(y_test, y_pred_svm, target_names=['No Credit', 'Credit']))
print("\n--------------------------------------------\n")

###############################################
# 4. Бустинг (Boosting)
###############################################
print("Бустинг (AdaBoost):")
boosting_model = AdaBoostClassifier(n_estimators=50, random_state=42)
boosting_model.fit(X_train, y_train)
y_pred_boost = boosting_model.predict(X_test)

acc_boost = accuracy_score(y_test, y_pred_boost)
prec_boost = precision_score(y_test, y_pred_boost, average='macro')
rec_boost = recall_score(y_test, y_pred_boost, average='macro')

results['Boosting'] = {'accuracy': acc_boost, 'precision': prec_boost, 'recall': rec_boost}
print("Accuracy:", acc_boost)
print("Precision:", prec_boost)
print("Recall:", rec_boost)
print(classification_report(y_test, y_pred_boost, target_names=['No Credit', 'Credit']))
print("\n--------------------------------------------\n")

###############################################
# 5. Стеккинг (Stacking)
###############################################
print("Стеккинг:")
# Базовые классификаторы
estimators = [
    ('knn', KNeighborsClassifier(n_neighbors=best_n)),
    ('dt', DecisionTreeClassifier()),
    ('svm', SVC(kernel='rbf', gamma='scale', C=1, probability=True, random_state=42))
]
stacking_model = StackingClassifier(estimators=estimators, final_estimator=LogisticRegression(), cv=5)
stacking_model.fit(X_train, y_train)
y_pred_stack = stacking_model.predict(X_test)

acc_stack = accuracy_score(y_test, y_pred_stack)
prec_stack = precision_score(y_test, y_pred_stack, average='macro')
rec_stack = recall_score(y_test, y_pred_stack, average='macro')

results['Stacking'] = {'accuracy': acc_stack, 'precision': prec_stack, 'recall': rec_stack}
print("Accuracy:", acc_stack)
print("Precision:", prec_stack)
print("Recall:", rec_stack)
print(classification_report(y_test, y_pred_stack, target_names=['No Credit', 'Credit']))
print("\n--------------------------------------------\n")

###############################################
# Итоговый вывод: какая модель лучше по accuracy
###############################################
print("Сводная таблица результатов:")
for method, metrics in results.items():
    print(f"{method}: Accuracy = {metrics['accuracy']:.4f}, Precision = {metrics['precision']:.4f}, Recall = {metrics['recall']:.4f}")

best_method = max(results, key=lambda x: results[x]['accuracy'])
print("\nЛучший метод по accuracy:", best_method)
