# Report Progetto: Analisi e Predizione dell'Inquinamento da PM2.5

Questo report riassume le fasi e i risultati principali di un progetto di Machine Learning volto alla predizione e classificazione dei livelli di PM2.5, esplorando dati sull'inquinamento da India e Cina.

---

## 1. Preparazione dei Dati (Data Preparation)

La fase iniziale del progetto si è concentrata sulla **pulizia, trasformazione e normalizzazione dei dataset**, essenziale per garantire la qualità dei dati forniti ai modelli di Machine Learning.

---

## 2. Problema di Regressione: Predizione dei Livelli di PM2.5

Il primo approccio adottato è stato un **problema di regressione**, con l'obiettivo di predire il valore numerico del PM2.5 per il giorno successivo.

### 2.1. Dataset Unito (India e Cina)

Abbiamo addestrato i modelli su un **dataset unificato** (India e Cina). I risultati sono stati **deludenti**, con le metriche di errore che indicavano un'elevata discrepanza tra predizioni e valori reali. La complessità dei dati combinati ha reso difficile per i modelli apprendere pattern significativi.

### 2.2. Dataset Singoli (Cina e India)

Considerati i risultati insoddisfacenti, abbiamo addestrato modelli di regressione separati sui **dataset singoli** per la Cina e l'India. Anche con questo approccio, i risultati sono rimasti **scadenti**. Questo ha evidenziato la complessità intrinseca della predizione numerica del PM2.5 con i dati a disposizione, suggerendo che un approccio regressivo non fosse il più adatto. Persino l'utilizzo della data augmentation per il dataset dell'India non ha portato a miglioramenti sostanziali che rendessero l'approccio regressivo efficace.

---

## 3. Problema di Classificazione: Categorizzazione dei Livelli di PM2.5

Data la scarsa performance dei modelli di regressione, abbiamo riformulato il problema come un **problema di classificazione**, puntando a predire una categoria di livello di PM2.5 (es. basso, moderato, alto).

### 3.1. Dataset Unito (India e Cina)

Abbiamo addestrato i modelli di classificazione su un **dataset unificato** (India e Cina). I **risultati sono stati significativamente migliori** rispetto all'approccio regressivo. Le metriche di classificazione hanno mostrato una maggiore capacità dei modelli di distinguere le diverse categorie di PM2.5. I modelli come Random Forest e XGBoost hanno mostrato performance notevolmente superiori rispetto all'approccio regressivo, con metriche di accuratezza e F1-score che indicavano una buona capacità predittiva.

### 3.2. Dataset Singoli (Cina e India)

Successivamente, abbiamo addestrato modelli di classificazione sui **dataset singoli** per la Cina e l'India. Anche in questo caso, i risultati sono stati **migliori** e in linea con quelli ottenuti sul dataset unito per la classificazione, confermando l'efficacia di questo approccio. I modelli hanno continuato a dimostrare una buona capacità di classificazione per entrambi i paesi, con i migliori risultati ottenuti in particolare sul dataset dell'India.

---

## 4. Conclusioni e Prossimi Passi

La transizione da un problema di regressione a uno di classificazione si è rivelata cruciale per il successo di questo progetto. Mentre la predizione esatta dei valori di PM2.5 si è dimostrata estremamente complessa, la capacità di classificare i livelli di inquinamento in categorie significative ha fornito risultati promettenti e utili.