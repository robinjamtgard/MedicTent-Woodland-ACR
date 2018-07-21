# MedicTent-Woodland-ACR
Script with deployable medical tent by Ken

Alpha 1.0

## Hur kan man använda sig av skriptet?

1. Välj ut lämplig låda som är bärbar
2. Ändra på lådans variabelnamn till ``tentbox``
3. Ladda ner ``medicalText.sqf`` till din mission mapp
4. Lägg till följande i ``init.sqf``:
```
#include "medicalTent.sqf"
[tentbox] call ase_fnc_medicalTentInit;
```

## Funktioner

### ase_fnc_medicalTentInit

```
[_box, "CampEmpty"] call ase_fnc_medicalTentInit;
```

Lägger till sjukvårdstältfunktionen på lådan `_box`.
Objektet av typen som skickas in som andra parametern kommer skapas bredvid lådan.
Om inte något klassnamn skickas med så spawnas som default `CampEmpty`

## Variabler

### ase_medicalTentObject

Objektet som spawnas som camp

### ase_medicalTentActionPack

Definerar texten som ska visas för att packa ihop tältet

### ase_medicalTentActionUnpack

Definerar texten som ska visas för att packa upp tältet

## Förbättring

Sätt en trigger med följande kod:
```
    if (!alive(tentbox)) {
        //Spawna in ny låda på lämpligt ställe
    }
```

**Skript skapat av [Ken](https://steamcommunity.com/profiles/76561197985606066/)**
