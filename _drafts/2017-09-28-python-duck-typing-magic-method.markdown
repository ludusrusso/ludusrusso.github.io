---
title: "Python: duck-typing e Magic Methods"
layout: post
date: 2017-09-28
#image: /assets/screen-shot.png
headerImage: false
tag:
  - Python
category: blog
author: ludusrusso
description: Un breve introduzione ai magic method di Python
---

## Introduzione

A differenza di molti linguaggi di programmazione, Python gode di alcune
caratteristiche peculiari che lo rendono (a mio avviso), uno dei linguaggi di
programmazione più eleganti e funzionali mai creati.

Una di queste caratteristiche sono i cosidetti **special methods** (anche chiamati **magic methods**), metodi speciali che venogono chiamati automaticamente
dall'interprete Python per eseguire una serie di operazioni base, e che, se conosciuti e usati consapevolmente, permettono di creare codice elegante e molto
potente.

Questi metodi speciali sono alla base di alcune delle "stranezze" che molti sviluppatori (abituati ad altri linguaggi di programmazione) scoprono nel momento
in cui si avvicinano a Python la prima volta.

La più classica, che (nella sua banalità) ha stupito anche me è l'utilizzo della sintassi

```Python
len(list)
```

invece di quella

```c++
array.size()
```

per ottenere la lunghezza di una lista (o un vettore).

L'approccio classico, infatti, è quello di creare un oggetto con un metodo che ritorna la lunghezza dell'oggetto stesso. Il problema di questo approccio è che spesso il nome del metodo non è standard (io stesso, scrivendo questo articolo, mi sono chiesto se il methodo corretto in **c++** per ottenere la lunghezza di un vettore fosse **size** o **lenght**).

Python risolve questo problema usando semplicemente la funzione `len()`, che ritorna 
