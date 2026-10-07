# 🔌 Especificación Técnica y API — WoWPeru_TBCBalance

[![GitHub](https://img.shields.io/badge/GitHub-DarckRovert%2FWoWPeru_TBCBalance-black?logo=github)](https://github.com/DarckRovert/WoWPeru_TBCBalance)
[![Ecosistema](https://img.shields.io/badge/Ecosistema-WoW%20Per%C3%BA%203.3.5a-gold.svg)](https://wow-peru.lat/)

## 📌 Resumen Arquitectónico
Monitor de composición de banda, auras sinérgicas y distribución de clases diseñado para auditoría de equilibrio en encuentros de banda TBC / WotLK.

- **Rol en el Ecosistema:** Módulo Oficial #7 — Balance y Composición de Bandas
- **Archivo Principal TOC:** `IntiTBCBalance.toc`
- **Compatibilidad del Motor:** World of Warcraft 3.3.5a (Build 12340)

---

## ⌨️ Comandos de Consola (Slash Commands)
- `/tbcbalance`: Acceso principal o comando del addon.
- `/balance`: Acceso principal o comando del addon.

---

## 📡 Protocolo de Red y Eventos
- *(Este addon no utiliza mensajes AddonMessage de red; opera en espacio local del cliente)*.

### Eventos del Motor 3.3.5a Gestionados
- `PLAYER_LOGIN` / `ADDON_LOADED`: Inicialización atómica de tablas de configuración y hooks.
- `PLAYER_ENTERING_WORLD`: Sincronización de estado tras transiciones de pantalla o mapa.
- `PLAYER_LOGOUT`: Guardado seguro en disco de las variables locales.

---

## 💾 Persistencia de Datos (SavedVariables)
- *(No persiste SavedVariables en disco)*.

---

## 🛠️ Buenas Prácticas de Integración
1. Toda invocación a funciones públicas debe verificar previamente la existencia del espacio de nombres en `_G`.
2. Las tablas de configuración deben consultarse en modo lectura sin sobreescribir valores por omisión no validados.
3. El intercambio de datos con otros addons debe efectuarse a través del bus oficial `WoWPeru_Companion` o hooks de eventos estándar.
