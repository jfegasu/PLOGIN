# import plotly.express as px
# import pandas as pd

# df = pd.DataFrame([
#     dict(Task="Job A", Start='2009-01-01', Finish='2009-02-28'),
#     dict(Task="Job B", Start='2009-03-05', Finish='2009-04-15'),
#     dict(Task="Job C", Start='2009-02-20', Finish='2009-05-30')
# ])

# fig = px.timeline(df, x_start="Start", x_end="Finish", y="Task")
# fig.update_yaxes(autorange="reversed") # otherwise tasks are listed from the bottom up
# fig.show()
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime

# Datos de las tareas en orden inverso
tareas = [
    ("Recomendaciones y Conclusiones", "6/12/2023", "9/12/2023"),
    ("Análisis de Escenarios mediante EVA", "1/12/2023", "5/12/2023"),
    ("Generación de Curvas de Control", "28/11/2023", "30/11/2023"),
    ("Evaluación Económica del Proyecto Minero", "23/11/2023", "27/11/2023"),  # Fecha de término fija
    ("Desarrollo del Cronograma en Primavera P6", "12/11/2023", "22/11/2023"),
    ("Creación  Hoja de Programación en Excel", "4/11/2023", "11/11/2023"),
    (" Alcance del Proyecto Minero Caso Práctico", "27/10/2023", "3/11/2023"),
    ("Conociendo el Software Primavera P6", "18/10/2023", "26/10/2023"),
    (" Herramientas de Planificación y Control del Cronograma", "11/10/2023", "17/10/2023"),
    (" Importancia de la Planificación y Gestión del  Cronograma", "6/10/2023", "10/10/2023")
]

# Fechas de inicio y término del proyecto
inicio_proyecto = datetime.strptime("6/10/2023", "%d/%m/%Y")
fin_proyecto = datetime.strptime("10/12/2023", "%d/%m/%Y")

# Función para convertir la fecha en formato de cadena a objeto datetime
def convert_date(date_str):
    return datetime.strptime(date_str, "%d/%m/%Y")

# Extraer las fechas de inicio y término
inicio = [convert_date(t[1]) for t in tareas]
termino = [convert_date(t[2]) for t in tareas]
tarea_names = [t[0] for t in tareas]

# Crear la gráfica de Gantt con un estilo personalizado
fig, ax = plt.subplots(figsize=(10, 6))
ax.xaxis.set_major_locator(mdates.WeekdayLocator(byweekday=mdates.MO))  # Etiquetas semanales
ax.xaxis.set_major_formatter(mdates.DateFormatter("%U"))  # Solo número de semana del año

# Establecer orientación vertical en el eje x para las etiquetas de fechas
ax.tick_params(axis='x', rotation=0)  # Sin rotación

for i, tarea in enumerate(tarea_names):
    ax.barh(tarea, left=inicio[i], width=termino[i] - inicio[i], color='lightblue', edgecolor='gray')

    # Agregar fecha de término encima de la barra
    ax.text(termino[i], i, termino[i].strftime("%d/%m/%Y"), va='center', ha='left', fontsize=10, fontweight='bold')

# Calcular y agregar hitos dentro del cronograma
for i, (inicio_tarea, tarea) in enumerate(zip(inicio, tarea_names)):
    if inicio_tarea == inicio_proyecto:
        ax.plot(inicio_tarea, i, marker='o', markersize=8, color='red', label='Inicio del Proyecto', linestyle='None')
    if inicio_tarea == convert_date("12/11/2023"):  # Fecha de término de desarrollo en Primavera P6
        ax.plot(inicio_tarea, i, marker='o', markersize=8, color='purple', label='Desarrollo Cronograma en Primavera P6', linestyle='None')

# Agregar el hito de término del proyecto
ax.plot(fin_proyecto, tarea_names.index("Recomendaciones y Conclusiones"), marker='o', markersize=8, color='green', label='Fin del Proyecto', linestyle='None')

plt.ylabel("Etapas")
plt.title("Diagrama de Gantt - Programa de Trabajo", fontsize=14, fontweight='bold')

# Personalización adicional
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# Etiqueta en el eje de abajo
ax.set_xlabel("Semanas 2023")

# Agregar leyenda en la esquina superior derecha
plt.legend(loc='upper right', title='Hitos')

plt.tight_layout()
plt.show()

