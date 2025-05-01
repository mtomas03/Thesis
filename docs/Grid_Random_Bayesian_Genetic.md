## **1. Grid Search (Ricerca a Griglia)**
### **Vantaggi**:
- **Completo**: Esplora tutte le combinazioni predefinite nello spazio di ricerca.
- **Deterministico**: Ripetibile, poiché non c’è casualità.
- **Semplice da implementare**: Ideale per spazi piccoli e ben definiti.

### **Svantaggi**:
- **Costo computazionale esponenziale**: Impraticabile con molti hyperparametri (maledizione della dimensionalità).
- **Inefficiente**: Spreca risorse su regioni poco promettenti dello spazio.

### **Quando usarlo**:
- Spazi di ricerca **piccoli** (es. 2-3 hyperparametri con pochi valori).
- Risorse computazionali abbondanti e necessità di risultati esatti.

---

## **2. Random Search (Ricerca Casuale)**
### **Vantaggi**:
- **Efficiente**: Campiona casualmente lo spazio, riducendo il costo computazionale.
- **Adatto a spazi ad alta dimensionalità**: Performa meglio di Grid Search quando alcuni hyperparametri hanno impatto marginale (dimostrato da [Bergstra & Bengio, 2012](https://www.jmlr.org/papers/volume13/bergstra12a/bergstra12a.pdf)).
- **Facile da parallelizzare**.

### **Svantaggi**:
- **Non guidato**: Potrebbe mancare combinazioni ottimali per puro caso.
- **Risultati non ripetibili** (a meno di fissare un seed).

### **Quando usarlo**:
- Spazi di ricerca **ampi** (es. >4 hyperparametri).
- Risorse computazionali limitate, ma sufficienti per esplorare casualmente.

---

## **3. Bayesian Optimization (Ottimizzazione Bayesiana)**
### **Vantaggi**:
- **Efficienza intelligente**: Usa un modello surrogato (es. Gaussian Process o TPE) per predire le regioni promettenti, riducendo le valutazioni necessarie.
- **Bilanciamento exploration-exploitation**: Cerca nuovi punti (esplorazione) e raffina quelli noti (sfruttamento).
- **Adatto a funzioni costose**: Ottimo quando ogni valutazione (es. addestramento di una DNN) richiede ore/giorni.

### **Svantaggi**:
- **Overhead computazionale**: Il modello surrogato aggiunge complessità.
- **Difficile da parallelizzare** (se non con estensioni come *Parallel Bayesian Optimization*).
- **Sensibile a rumore** (es. metriche instabili).

### **Quando usarlo**:
- Ottimizzazione di modelli **costosi** (es. reti neurali profonde).
- Quando si hanno **risorse limitate** (es. budget di 50-100 valutazioni).
- Spazi di ricerca continui o misti (discreti + continui).

---

## **4. Genetic Algorithms (Algoritmi Genetici)**
### **Vantaggi**:
- **Esplorazione robusta**: Trova ottimi globali in spazi complessi/non lineari grazie a crossover e mutazione.
- **Parallelizzabile**: Valutazioni del fitness possono essere distribuite.
- **Adatto a spazi misti**: Gestisce sia hyperparametri discreti (es. tipo di ottimizzatore) che continui (es. learning rate).

### **Svantaggi**:
- **Lento**: Richiede molte generazioni e valutazioni.
- **Parametri aggiuntivi**: Dimensioni della popolazione, tasso di mutazione e crossover influenzano i risultati.
- **Nessuna garanzia di convergenza**: Potrebbe richiedere tuning dell’algoritmo stesso.

### **Quando usarlo**:
- Spazi di ricerca **molto complessi** con interazioni non lineari tra hyperparametri.
- Quando si hanno **risorse computazionali massive** (es. cluster distribuiti).
- Problemi di ottimizzazione multi-obiettivo (es. bilanciare accuratezza e tempo d’inferenza).

---

## **Tabella Riassuntiva**
| Metodo               | Vantaggi                                        | Svantaggi                                  | Scenario Ideale                          |
|----------------------|------------------------------------------------|--------------------------------------------|------------------------------------------|
| **Grid Search**      | Completo, deterministico                      | Costoso, inefficiente                      | Spazi piccoli (2-3 hyperparametri)       |
| **Random Search**    | Efficiente, parallelizzabile                  | Non guidato, casuale                       | Spazi ampi, risorse limitate             |
| **Bayesian Opt.**    | Intelligente, adatto a funzioni costose       | Complesso, difficile da parallelizzare     | Modelli costosi, budget ridotto          |
| **Genetic Algorithms**| Esplorazione robusta, spazi misti            | Lento, parametri aggiuntivi                | Spazi complessi, risorse computazionali  |

---

## **Guida alla Scelta**
1. **Inizio semplice**: Usa **Random Search** come baseline per spazi medi/ampi.
2. **Modelli costosi** (es. reti neurali): Preferisci **Bayesian Optimization**.
3. **Hyperparametri categorici + continui**: **Genetic Algorithms** o Bayesian Optimization con TPE.
4. **Risorse illimitate e spazi piccoli**: Grid Search (raro nella pratica moderna).
5. **Ottimizzazione multi-obiettivo**: Genetic Algorithms (es. NSGA-II).

---

## **Conclusione**
La scelta dipende da:
- **Dimensione/complessità dello spazio di ricerca**.
- **Costo computazionale per valutazione**.
- **Risorse disponibili** (tempo, hardware).
- **Tipo di hyperparametri** (discreti, continui, categorici).

Nella pratica, **Random Search** e **Bayesian Optimization** sono i più utilizzati, mentre **Genetic Algorithms** sono riservati a casi estremamente complessi o multi-obiettivo.