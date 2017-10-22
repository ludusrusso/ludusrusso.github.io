---
title: "Implementiamo codice Pythonico"
layout: post
# date: 2017-10-04
# image: /assets/imgs/2017-10-04-tdd-flask-pytest-1.markdown/tdd-python.png
headerImage: true
tag:
  - Python
category: blog
author: ludusrusso
description: Cosa vuol dire scrivere codice Ideomatico? Cosa è esattamente Pythonico?
---


Non scrivete

```python
list = ['ciao', 'come', 'va', '?']
for i in range(len(list)):
  print("{0} -> {1}".format(i, list[i]))
```

Scrivete invece:

```python
list = ['ciao', 'come', 'va', '?']
for i, el in enumerate(list):
  print("{0} -> {1}".format(i, el))
```

Nel linguaggi di programmazione, spesso si sente parlare di *ideomatico*, ma cosa vuol dire
esattamente questa parola? Per *ideomatico* intendiamo una serie di regole (non obbligatorie)
che sono incoraggiate in un particolare linguaggio di programmazione al fine di
implementare codice "migliore".

Python, in particolare, è uno dei linguaggi di programmazione che più di tutti
incoraggia l'implementazione di codice ideomatico, tanto che è stata inventata
un'apposita parola per questo: **Pythonico**.

## The Zen of Python

> Scusate, ma tradurre in italiano il titolo è un pugno nell'occhio! Molto meglio
come suona in inglese.

**The Zen of Python** sono una serie di principii intorno ai quali è stato sviluppato
il linguaggio di programmazione, e che la community di Python incoraggia ad
applicare all'interno del codice. Vediamo quali sono:

> Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.

Che si traducono come segue:








Python è ormai da 3 anni il mio linguaggio di programmazione principale, ma prima
di conoscerlo e padroneggiarlo, ero principalmente uno sviluppatore C/C++.
