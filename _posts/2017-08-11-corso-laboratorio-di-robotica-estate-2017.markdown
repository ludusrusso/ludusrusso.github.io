---
title: "Corso \"Laboratorio di Robotica\" Estate 2017"
layout: post
date: 2017-08-11
image:
headerImage: false
tag:
 - Corsi
 - Robotica
 - Stampacchia
category: blog
redirect_from:
 - /posts/robotica-estate-2017
author: ludusrusso
description:
---

Al via il corso *Laboratorio di Robotica*, organizzato dal Liceo **G. Stampacchia di Tricase** in collaborazione con il CINI (Consorzio Interuniversitario Nazionale di Informatica).

L’11 Agosto 2017, inizierà la prima lezione del corso “Laboratorio di Robotica”, fortemente voluto dal Liceo G. Stampacchia di Tricase e tenuto dal Dott. Ing. Ludovico Russo, ex studente dell’Istituto che ha recentemente ottenuto un dottorato di Ricerca (con Lode) presso il Politecnico di Torino, e si occupa di tecnologie assistive e robotica educativa presso il laboratorio AsTech (Assistive Technologies) del CINI, nodo di Torino.

Il corso, realizzato grazie ai fondi della presidenza del Consiglio dei Ministri – Dipartimento Pari Opportunità –  sul bando “In estate si imparano le STEM”, di cui il Liceo Stampacchia è risultato vincitore, coinvolgerà 21 studenti (di cui 13 ragazze e 8 ragazzi) di età compresa tra i 13 e i 15 anni, che avranno la possibilità di avvicinarsi al mondo della robotica.

Il corso si articolerà in 40 ore, distribuite su 10 lezioni, che termineranno il 25 Agosto 2017. Durante il corso, i ragazzi impareranno le basi di tecnologie altamente innovative, come Progettazione e Stampa 3D, linguaggi di programmazione (C/C++ e Python) e schede di prototipazione rapida (Arduino e Raspberry Pi).

Il corso si svolgerà con metodologia laboratoriale, in modo cooperativo in aula, e l’intero processo di formazione sarà supportato da una piattaforma di formazione on-line. In questo modo sarà possibile sviluppare sperimentazioni didattiche, nonché fornire indicazioni di articoli di approfondimento e svolgimento di attività pratiche sull’uso di tecnologie che saranno illustrate nei momenti in presenza.

Per coinvolgere ancora di più gli studenti alla sperimentazione e all’autoapprendimento, il corso terminerà con una competizione, in cui gli studenti, organizzati in team, faranno gareggiare i robot da loro costruiti al fine di realizzare un disegno artistico in modo automatico. Il team il cui robot disegnerà il progetto più bello sarà decretato vincitore della competizione.

## Software

 - [Arduino IDE](https://www.arduino.cc/en/Main/Software)

## Kit Arduino
 - [Kit 1](https://www.amazon.it/Smraza-Starter-Arduino-Breadboard-Acrylic/dp/B01LX65IK2/ref=sr_1_sc_1?ie=UTF8&qid=1503124640&sr=8-1-spell&keywords=smaraza)
- [Kit 2](https://www.amazon.it/Smraza-Ultimate-Breadboard-Detailed-Tutorial/dp/B01L1XRUKW/ref=sr_1_sc_2?ie=UTF8&qid=1503124640&sr=8-2-spell&keywords=smaraza)
- [Kit completo utilizzato](https://www.amazon.it/Ultimate-Project-Ultrasonic-Mega2560-Projects/dp/B01L0ZL8N6/ref=sr_1_3?ie=UTF8&qid=1503079580&sr=8-3&keywords=smraza)




##  Slides
<iframe src="https://docs.google.com/presentation/d/1I5cEyMw20VzW4fmZE-IjRFw5MmMWhR-gSe2zYw-T6Lo/embed?start=false&loop=false&delayms=3000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

<iframe src="https://docs.google.com/presentation/d/1kRWQmZ1k9Emzem_UsOagJd9BgA7iX9pXpKt0hmf0p7Y/embed?start=false&loop=false&delayms=3000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

<iframe src="https://docs.google.com/presentation/d/1DvEwGWvwgnSdhajP-gV-FnbSZBya_ezd_GaveQwy1MU/embed?start=false&loop=false&delayms=3000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

<iframe src="https://docs.google.com/presentation/d/16563eWcjv2oLysPOxwEr048id-bzFzUCkJBTzKTzXEE/embed?start=false&loop=false&delayms=3000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Materiale

 - [Slide stampa 3D](https://www.dropbox.com/s/fies0rk7siiptuk/Open%20Source%20e%20Open%20Hardware.pptx?dl=0)
 - [Tutorial Molto utili per usare TinkerCAD fatti da Michele Maffucci](http://www.maffucci.it/2017/02/14/introduzione-alla-stampa-3d-presentazione/)
 - [Progetto di Partenza](http://www.instructables.com/id/Low-Cost-Arduino-Compatible-Drawing-Robot/)
 - [Modello Chassis](https://www.tinkercad.com/things/f8bBuwyZuHJ-chassis-base)
 - [Modello Ruote](https://www.tinkercad.com/things/6n4tTRBr6TG-ruote)
 - [Corso completo di Arduino fatto da Michele Maffucci](http://www.maffucci.it/area-studenti/arduino/)

## Ciclo For

```
for (int valore_led = 0; valore_led < 256; valore_led++) 	{
    analogWrite(11, valore_led);
    delay(2);
    }
```

## Esempi di codice

### Monitor Seriale - Esempio 1

```cpp

void setup() {
  Serial.begin(9600); //Inizializzo la seriale:
  Serial.println("Sono la funzione di Setup!"); // stampo sulla seriale
}

void loop() {
  Serial.println("Sono la funzione di loop!");  // stampo sulla seriale
  delay(1000); // aspetto un secondo
}

```

### Monitor Seriale - Esempio 2

```cpp
int contatore = 0;

void setup() {
  Serial.begin(9600); //Inizializzo la seriale
  Serial.println("setup!"); // stampo sulla seriale
}

void loop() {
  Serial.print("loop: ");  // stampo sulla seriale
  Serial.println(contatore);
  contatore += 1;
  delay(1000); // aspetto un secondo
}
```

### Monitor Seriale - Soluzione LED

```cpp
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("Led Acceso");
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);
  Serial.println("Led Spento");
  delay(1000);                       // wait for a second
}
```

### Bottoni - Esempio 1

```cpp
int status_btn = 0;  // variabile per salvare lo status del bottone
int btn_pin = 2; // pin del bottone

void setup()
{
  Serial.begin(9600); //Inizializzo la seriale
  pinMode(btn_pin, INPUT); // il bottone è un INPUT
}

void loop()
{
  val = digitalRead(inPin);   // legge il valore
  Serial.print("status bottone: ");  // stampo sulla seriale
  Serial.println(val);
  delay(100);
}
```
### Bottoni - Esempio 2



```cpp
int status_btn = 0;  // variabile per salvare lo status del bottone
int btn_pin = 2; // pin del bottone

void setup()
{
  Serial.begin(9600); //Inizializzo la seriale
  pinMode(btn_pin, INPUT); // il bottone è un INPUT
}

void loop()
{
  val = digitalRead(inPin);   // legge il valore
  Serial.print("status bottone: ");  // stampo sulla seriale
  if (val == 0) { // faccio una scelta!
    Serial.println("Aperto");
  } else {
    Serial.println("Chiuso");
  }

  delay(100);
}
```

### Valori analogici - Codice 1

```cpp
int sensorPin = A0;    // PIN Analogico A0
int val = 0;  // variabile di lettura

void setup()
{
  Serial.begin(9600); //Inizializzo la seriale
}

void loop()
{
  val = analogRead(sensorPin);   // legge il valore
  Serial.print("valore letto: ");  // stampo sulla seriale
  Serial.println(val);
  delay(100);
}
```

### Valori analogici - Codice 2

```cpp
int sensorPin = A0;    // PIN Analogico A0
int val = 0;  // variabile di lettura
float x = 0.0; // variabile di lettura in volt

void setup()
{
  Serial.begin(9600); //Inizializzo la seriale
}

void loop()
{
  val = analogRead(sensorPin);   // legge il valore
  x = val*5.0/1023; // converto val in volt
  Serial.print("valore letto: ");  // stampo sulla seriale
  Serial.print(val);

  Serial.print(" - in volt: ");  // stampo sulla seriale
  Serial.print(x);
  Serial.println(" Volt");
  delay(100);
}
```

# Esempi per muovere i motori

Per farlo funzionare, includere la libreria [AccelStepper](http://www.airspayce.com/mikem/arduino/AccelStepper/), scaricabile [cliccando qui](http://www.airspayce.com/mikem/arduino/AccelStepper/AccelStepper-1.57.zip).

## Un motore
```cpp
#include <AccelStepper.h>

// creo un oggetto per gestire uno stepper a 4 pin connessi ai pin 8, 9, 10, 11
AccelStepper motor(AccelStepper::FULL4WIRE, 8,  9, 10, 11);
void setup()
{  

   // setto la velocità massima per lo stepper
   motor.setMaxSpeed(1000);

   // setto la velocità del motori
   motor.setSpeed(50.0);
}

void loop()
{  
   // per far muovere i motori, evitare i delay()
   motor.runSpeed();
}
```

## Due motori
```cpp
#include <AccelStepper.h>

// creo un oggetto per gestire uno stepper a 4 pin connessi ai pin 2,3,4,5
AccelStepper motor_dx(AccelStepper::FULL4WIRE, 2,  3,  4,  5);

// creo un oggetto per gestire uno stepper a 4 pin connessi ai pin 8, 9, 10, 11
AccelStepper motor_sx(AccelStepper::FULL4WIRE, 8,  9, 10, 11);
void setup()
{  

   // setto la velocità massima per gli stepper
   motor_dx.setMaxSpeed(1000);
   motor_sx.setMaxSpeed(1000);

   // setto la velocità dei motori
   motor_dx.setSpeed(50.0);
   motor_sx.setSpeed(50.0);
}

void loop()
{  
   // per far muovere i motori, evitare i delay()
   motor_dx.runSpeed();
   motor_sx.runSpeed();
}
```

## Cambiare direzione ai motori

```cpp
#include <AccelStepper.h>

int last_time = 0;
int dir = -1;

AccelStepper motor_dx(AccelStepper::FULL4WIRE, 2,  3,  4,  5);
AccelStepper motor_sx(AccelStepper::FULL4WIRE, 8,  9, 10, 11);
void setup()
{

   motor_dx.setMaxSpeed(1000);
   motor_sx.setMaxSpeed(1000);

   motor_dx.setSpeed(350.0);
   motor_sx.setSpeed(350.0);
}

void loop()
{  
   if (millis() - last_time > 2000) {
     motor_dx.setSpeed(dir*350.0);
     motor_sx.setSpeed(-dir*350.0);
     dir = -dir;
     last_time = millis();
   }
   motor_dx.runSpeed();
   motor_sx.runSpeed();
}
```

## Esempio di movimento dinamico del Robot

```cpp
#include <AccelStepper.h>

unsigned long int last_time = 0;  // ultima volta che è stato chiamata la funzione.
int cnt = 0;            // contatore
int time_wait = 1000;   // tempo del contatore (1s)

AccelStepper motor_dx(AccelStepper::FULL4WIRE, 2,  4,  3,  5);
AccelStepper motor_sx(AccelStepper::FULL4WIRE, 8,  10, 9, 11);

void setup()
{
   motor_dx.setMaxSpeed(1000);
   motor_sx.setMaxSpeed(1000);   
}

void loop()
{  
   if (millis() - last_time > time_wait) {
     if (contatore == 0) {
      motor_dx.setSpeed(350.0);
      motor_sx.setSpeed(-350.0);
     } else if (contatore == 1) {
      motor_dx.setSpeed(350.0);
      motor_sx.setSpeed(350.0);
     } else if (contatore == 2) {
      motor_dx.setSpeed(-350.0);
      motor_sx.setSpeed(-350.0);
     }
     contatore = (contatore + 1) % 3;
     last_time = millis();
   }
   motor_dx.runSpeed();
   motor_sx.runSpeed();
}
```
