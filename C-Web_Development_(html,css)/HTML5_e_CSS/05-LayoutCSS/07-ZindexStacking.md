# Z-index e Stacking Context in CSS

## Introduzione

Quando si lavora con layout complessi in CSS, spesso ci si trova a gestire elementi che si sovrappongono. Le proprietà `z-index` e il concetto di "stacking context" (contesto di sovrapposizione) sono fondamentali per controllare come gli elementi si sovrappongono tra loro.

## La Proprietà Z-index

La proprietà `z-index` determina l'ordine di sovrapposizione degli elementi posizionati (cioè elementi con una proprietà `position` diversa da `static`). Gli elementi con un valore di `z-index` più alto appariranno sopra gli elementi con un valore più basso.

### Sintassi

```css
.elemento {
  position: relative; /* o absolute, fixed, sticky */
  z-index: valore;
}
```

Dove `valore` può essere:
- Un numero intero (positivo o negativo)
- `auto` (valore predefinito, equivalente a 0)

### Esempio Base

```html
<div class="box box1">Box 1</div>
<div class="box box2">Box 2</div>
<div class="box box3">Box 3</div>
```

```css
.box {
  width: 100px;
  height: 100px;
  position: absolute;
  text-align: center;
  line-height: 100px;
  color: white;
}

.box1 {
  background-color: red;
  top: 50px;
  left: 50px;
  z-index: 1;
}

.box2 {
  background-color: blue;
  top: 80px;
  left: 80px;
  z-index: 2; /* Appare sopra box1 */
}

.box3 {
  background-color: green;
  top: 110px;
  left: 110px;
  z-index: 3; /* Appare sopra box1 e box2 */
}
```

## Stacking Context (Contesto di Sovrapposizione)

Uno stacking context è un livello concettuale in cui gli elementi vengono renderizzati. Gli elementi all'interno di uno stacking context sono ordinati tra loro, ma non possono essere posizionati tra elementi di stacking context diversi.

### Creazione di uno Stacking Context

Uno stacking context viene creato da un elemento quando:

1. È l'elemento radice del documento (l'elemento `<html>`)
2. Ha una proprietà `position` con valore `absolute` o `relative` e un `z-index` diverso da `auto`
3. Ha una proprietà `position` con valore `fixed` o `sticky`
4. È un elemento flex o grid con un `z-index` diverso da `auto`
5. Ha una proprietà `opacity` inferiore a 1
6. Ha una proprietà `transform`, `filter`, `perspective`, `clip-path`, `mask`, `mix-blend-mode` o `isolation` con un valore diverso da `none`
7. Ha una proprietà `will-change` che specifica una delle proprietà sopra elencate

### Esempio di Stacking Context

```html
<div class="parent1">
  <div class="child1">Child 1 (z-index: 10)</div>
</div>

<div class="parent2">
  <div class="child2">Child 2 (z-index: 5)</div>
</div>
```

```css
.parent1, .parent2 {
  position: relative;
  width: 200px;
  height: 200px;
  margin: 20px;
}

.parent1 {
  background-color: rgba(255, 0, 0, 0.3);
  z-index: 1; /* Crea uno stacking context */
}

.parent2 {
  background-color: rgba(0, 0, 255, 0.3);
  z-index: 2; /* Crea uno stacking context con priorità maggiore */
}

.child1, .child2 {
  position: absolute;
  width: 150px;
  height: 150px;
  text-align: center;
  line-height: 150px;
}

.child1 {
  background-color: rgba(255, 0, 0, 0.8);
  top: 50px;
  left: 50px;
  z-index: 10; /* Alto, ma limitato allo stacking context del parent1 */
}

.child2 {
  background-color: rgba(0, 0, 255, 0.8);
  top: 50px;
  left: 50px;
  z-index: 5; /* Più basso di child1, ma il parent2 ha z-index maggiore */
}
```

In questo esempio, nonostante `child1` abbia un `z-index` più alto (10) rispetto a `child2` (5), `child2` apparirà sopra `child1` perché il suo genitore `parent2` ha un `z-index` (2) maggiore di `parent1` (1).

## Ordine di Sovrapposizione all'Interno di uno Stacking Context

All'interno di uno stacking context, gli elementi vengono renderizzati nell'ordine seguente (dal più basso al più alto):

1. Sfondo e bordi dell'elemento che crea lo stacking context
2. Elementi con `z-index` negativo
3. Elementi posizionati con `position: static` (nell'ordine in cui appaiono nel documento)
4. Elementi posizionati con `position` non-static e `z-index: auto` o `z-index: 0`
5. Elementi con `z-index` positivo (in ordine crescente)

## Problemi Comuni e Soluzioni

### 1. Z-index Non Funziona

Se impostare `z-index` non sembra avere effetto, verificare che:

- L'elemento abbia una proprietà `position` diversa da `static`
- L'elemento non sia all'interno di uno stacking context con priorità inferiore

```css
/* Non funziona */
.elemento {
  z-index: 999;
}

/* Funziona */
.elemento {
  position: relative;
  z-index: 999;
}
```

### 2. Z-index Molto Alti

Evitare di utilizzare valori di `z-index` molto alti (come 9999) senza necessità. È meglio utilizzare valori incrementali (1, 2, 3...) per mantenere il codice più gestibile.

### 3. Isolamento di Stacking Context

A volte è utile isolare parti dell'interfaccia creando nuovi stacking context:

```css
.isolato {
  isolation: isolate; /* Crea un nuovo stacking context */
}
```

Questo è particolarmente utile per componenti riutilizzabili che potrebbero sovrapporsi ad altri elementi.

## Best Practices

1. **Usa valori di z-index incrementali e coerenti**
   ```css
   :root {
     --z-dropdown: 100;
     --z-header: 200;
     --z-modal: 300;
     --z-tooltip: 400;
   }
   ```

2. **Limita la profondità degli stacking context annidati**
   Troppi livelli di stacking context possono rendere difficile il debug.

3. **Documenta l'uso di z-index**
   Specialmente in progetti grandi, è utile commentare perché un elemento ha un determinato z-index.

4. **Evita di usare z-index quando non necessario**
   Se gli elementi sono già nell'ordine corretto nel DOM, potresti non aver bisogno di z-index.

## Strumenti di Debug

Per visualizzare e debuggare problemi di sovrapposizione, puoi utilizzare:

1. **DevTools dei browser**: Chrome e Firefox hanno strumenti per ispezionare gli stacking context
2. **Evidenziazione temporanea**: Aggiungi temporaneamente bordi colorati o sfondi per vedere i limiti degli elementi
3. **Estensioni**: Esistono estensioni per browser che aiutano a visualizzare i livelli z-index

## Conclusione

Comprendere `z-index` e gli stacking context è fondamentale per creare layout complessi in CSS. Anche se può sembrare complicato all'inizio, con la pratica diventa più intuitivo gestire la sovrapposizione degli elementi.

Ricorda che il valore di `z-index` ha significato solo all'interno del suo stacking context e che gli elementi in stacking context diversi non possono essere intercalati tra loro.

---

## Navigazione

- [⬅️ Layout Multi-colonna](./06-LayoutMulticolonna.md)
- [🏠 Torna all'indice](./README.md)