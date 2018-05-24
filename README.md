# MedicTent-Woodland-ACR
Script with deployable medical tent

Alpha 1.0

# Hur kan man använda sig av skriptet?

1. Välj ut lämplig låda som är bärbar
2. Ändra på lådans variabelnamn till ``tentbox``
3. I init för denna låda lägger ni in följande text:
```
    tentbox addAction ["<t color=""#F8FF24"">" +format["Sätt upp sjukvårdstältet."],"unpack.sqf"];
```

**Förbättring:**
Sätt en trigger med följande kod:
```
    if (!alive(tentbox)) {
        //Spawna in ny låda på lämpligt ställe
    }
```

**Skript skapat av [Ken](https://steamcommunity.com/profiles/76561197985606066/)**