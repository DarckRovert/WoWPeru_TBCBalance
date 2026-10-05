# 🌐 Registro de Ecosistema — WoWPeru_TBCBalance

Ficha técnica oficial de registro en la infraestructura multi-addon de **WoW Perú - Reino Andino**.

---

## 1. Identidad del Addon

| Campo | Valor |
|---|---|
| **Nombre Técnico** | `WoWPeru_TBCBalance` |
| **Título en Cliente** | `Inti TBC Balance - GM` |
| **Versión** | `1.0.0` |
| **Tipo de Sistema** | Monitor de Equilibrio de Bandas TBC para Staff (Client-Side con Privilegios GM) |
| **Repositorio GitHub** | [DarckRovert/WoWPeru_TBCBalance](https://github.com/DarckRovert/WoWPeru_TBCBalance) |
| **Directorio de Instalación** | `Interface\AddOns\IntiTBCBalance\` |

---

## 2. Red y Mensajería de Addon

| Propiedad | Valor |
|---|---|
| **Prefijo Oficial** | Ninguno (Operación local de análisis de grupo/raid) |
| **Canales de Red** | N/A |
| **OpCodes Manejados** | N/A |
| **Restricción de Reino** | Exclusivo para reinos cuyo nombre contenga `"inti"` y personaje con `.gm on` |

---

## 3. Persistencia de Datos

| Variable Global | Tipo | Ámbito | Propósito |
|---|---|---|---|
| Ninguna | En memoria | Volátil | Las métricas se calculan reactivamente en combate y se purgan al salir de grupo. |

---

## 4. Matriz de Integración del Ecosistema

| Sistema Coexistente | Modo de Interacción | Flujo de Datos |
|---|---|---|
| **`WoWPeru_RaidSuite`** | Coexistencia Armónica | Complementa el análisis de banda con indicadores específicos de sinergias TBC. |
| **`WoWPeru_GMGenie`** | Coexistencia GM | Opera en paralelo como ventana flotante de soporte táctico para Game Masters. |

---

## 5. Garantías de Rendimiento

- **Tiempo de Cuadro:** < 0.01 ms por frame.
- **Memoria en Tiempo de Ejecución:** < 90 KB de memoria Lua.
- **Compatibilidad de Hardware:** 100% verificado para estaciones del staff.
