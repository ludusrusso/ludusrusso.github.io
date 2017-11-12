---
title: "Implementiamo un bot Telegram con Python - I Comandi 2"
layout: post
date: 2017-11-11
# image: /assets/imgs/2017-10-04-tdd-flask-pytest-1.markdown/tdd-python.png
tag:
  - Python
  - Tutorial
  - Telegram
category: blog
author: ludusrusso
description: Cosa vuol dire scrivere codice Ideomatico? Cosa è esattamente Pythonico?
---

Nell'articolo precedente abbiamo visto come sviluppare un semplice comando Telegram
con parametri. In questo post, invece, vediamo come sviluppare un comando che ha
più senso come applicazione reale. E per farlo, utilizzeremo una libreria Python
chiamata `wikipedia`... Vediamo chi indovina qual è il tema di oggi!!

Esatto!!
Facciamo in modo che il
nostro Bot sia in grado di fare ricerche su wikipedia, e ritornare alcune informazioni
della ricerca che abbiamo appena fatto.

Per fare questo, aggiungiamo un comando `/wiki` che funziona in questo modo:

 - `/wiki` da solo ritorna una frase di help, del tipo:
    *`Uso: /wiki <ricerca>`*
 - `/wiki <ricerca>`, dove `<ricerca>` può essere una qualsiasi frase che vogliamo
 ricercare, effettua una ricerca su wikipedia, e risponde con delle informazioni
 preliminari più il link stesso alla pagina di wikipedia per approfondimenti. In base al risultato della ricerca, possono accadere 3 code:
  1. Se il risultato della ricerca è unico, viene ritornato direttamente il link della pagina su wikipedia.
  2. Se vengono trovate più di una pagina, vengono mostrati i vari risultati e all'utente viene chiesto di essere più specifico.
  3. Se non si ottengono risultati, il bot ritorna risponde con il messaggio "non ho trovato nulla".

Per farlo, possiamo utilizzare una bellissimo pacchetto python chiamato (appunto) Wikipedia, che si installa semplicemente digitando i comandi:

```bash
(env) pip install wikipedia
```

## Implementiamo il comando `/wiki`






## Gestire meglio i comandi: utilizziamo i decoratori

Il nostro bot inizia ad essere interessante, però ha alcuni svantaggi implementativi:

 - Se abbiamo tanti comandi, il codice potrebbe diventare complicato da leggere,
 - Ogni volta che aggiungiamo un comando, dobbiamo ricordarci ci comando gestire il comando `/help` con le nuove informazioni.

Alcune librerie Python Telegram, permettono di avere una migliore gestione
dei comandi, dando la possibilità di sviluppare funzioni a cui delegare. Telepot
(da quello che ne so, non ho letto completamente il codice implementativo),
non implementa una funzionalità di per questo tipo di gestione, tuttavia, niente
vieta a noi di implementare un modo migliore per gestire tali informazioni.

Scegliamo alcune specifiche della funzionalità da sviluppare:

 - Vogliamo una gestione più pulita dei comandi, tramite funzioni registrare ad
 ogni specifico comando
 - Vogliamo una gestione automatica del comando `/help`.

Implementato questo, mi è
