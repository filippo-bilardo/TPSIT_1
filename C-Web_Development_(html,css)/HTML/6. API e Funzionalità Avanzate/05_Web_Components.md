# Web Components

## Introduzione ai Web Components

I Web Components rappresentano un insieme di tecnologie standardizzate che permettono di creare elementi HTML personalizzati, riutilizzabili e incapsulati. Questa tecnologia consente agli sviluppatori di costruire componenti modulari che possono essere facilmente condivisi e riutilizzati in diverse applicazioni web, indipendentemente dal framework o dalla libreria utilizzata.

I Web Components si basano su quattro tecnologie principali:

1. **Custom Elements**: API per definire nuovi elementi HTML con comportamenti personalizzati
2. **Shadow DOM**: sistema che permette di incapsulare stili e markup all'interno del componente
3. **HTML Templates**: frammenti di codice HTML che non vengono renderizzati immediatamente ma possono essere clonati e utilizzati più volte
4. **HTML Imports** (deprecato): meccanismo per importare documenti HTML in altri documenti

Queste tecnologie lavorano insieme per creare componenti web modulari, riutilizzabili e interoperabili.

## Custom Elements

I Custom Elements permettono di definire nuovi tipi di elementi HTML con funzionalità personalizzate. Esistono due tipi di custom elements:

- **Autonomous custom elements**: elementi completamente nuovi che non ereditano da elementi HTML esistenti
- **Customized built-in elements**: elementi che estendono elementi HTML esistenti

```javascript
// Definizione di un autonomous custom element
class UserCard extends HTMLElement {
  constructor() {
    super();
    
    // Creazione della struttura del componente
    this.innerHTML = `
      <div class="user-card">
        <img src="${this.getAttribute('avatar')}">
        <div>
          <h3>${this.getAttribute('name')}</h3>
          <p>${this.getAttribute('email')}</p>
          <button id="details">Dettagli</button>
        </div>
      </div>
    `;
    
    // Aggiunta di event listeners
    this.querySelector('#details').addEventListener('click', () => {
      alert(`Maggiori informazioni su ${this.getAttribute('name')}`);
    });
  }
}

// Registrazione del custom element
customElements.define('user-card', UserCard);
```

Utilizzo del custom element nel HTML:

```html
<user-card
  name="Mario Rossi"
  email="mario.rossi@example.com"
  avatar="https://example.com/avatars/mario.jpg">
</user-card>
```

## Shadow DOM

Il Shadow DOM fornisce un meccanismo di incapsulamento che permette di isolare il markup, lo stile e il comportamento di un componente dal resto della pagina. Questo evita conflitti di stile e garantisce che il componente funzioni in modo coerente in qualsiasi contesto.

```javascript
class ToggleButton extends HTMLElement {
  constructor() {
    super();
    
    // Creazione del shadow DOM
    const shadow = this.attachShadow({mode: 'open'});
    
    // Creazione degli elementi
    const button = document.createElement('button');
    button.textContent = this.getAttribute('text') || 'Toggle';
    
    // Aggiunta di stili incapsulati
    const style = document.createElement('style');
    style.textContent = `
      button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      button:hover {
        background-color: #45a049;
      }
    `;
    
    // Aggiunta di event listeners
    button.addEventListener('click', () => {
      button.textContent = button.textContent === 'ON' ? 'OFF' : 'ON';
    });
    
    // Aggiunta degli elementi al shadow DOM
    shadow.appendChild(style);
    shadow.appendChild(button);
  }
}

customElements.define('toggle-button', ToggleButton);
```

## HTML Templates

L'elemento `<template>` permette di definire frammenti di markup HTML che non vengono renderizzati immediatamente, ma possono essere clonati e utilizzati più volte tramite JavaScript.

```html
<template id="user-template">
  <div class="user-card">
    <img class="avatar">
    <div class="info">
      <h3 class="name"></h3>
      <p class="email"></p>
      <button class="details">Dettagli</button>
    </div>
  </div>
</template>

<script>
  class UserCard extends HTMLElement {

## Introduzione ai Web Components

I Web Components rappresentano un insieme di tecnologie web standard che consentono di creare elementi HTML personalizzati, riutilizzabili e incapsulati. Questa tecnologia permette agli sviluppatori di costruire componenti modulari che possono essere facilmente condivisi e integrati in qualsiasi applicazione web, indipendentemente dal framework o dalla libreria utilizzata.

L'obiettivo principale dei Web Components è risolvere uno dei problemi fondamentali dello sviluppo web: la creazione di componenti riutilizzabili con uno scope isolato, evitando conflitti con il resto dell'applicazione. Prima dell'introduzione dei Web Components, gli sviluppatori dovevano affidarsi a framework specifici o a complesse convenzioni di denominazione per evitare conflitti di stile e comportamento.

I Web Components si basano su quattro tecnologie principali:

1. **Custom Elements**: API per definire nuovi elementi HTML
2. **Shadow DOM**: Sistema per incapsulare stile e markup
3. **HTML Templates**: Meccanismo per dichiarare frammenti di markup riutilizzabili
4. **HTML Imports**: Metodo per includere e riutilizzare HTML (ora deprecato in favore di JavaScript modules)

Queste tecnologie lavorano insieme per fornire un sistema completo per la creazione di componenti web nativi, standardizzati e interoperabili.

## Custom Elements

I Custom Elements permettono di definire nuovi tipi di elementi HTML con comportamenti personalizzati. Esistono due tipi di custom elements:

1. **Autonomous custom elements**: elementi completamente nuovi che non ereditano da elementi HTML esistenti
2. **Customized built-in elements**: elementi che estendono elementi HTML esistenti

```javascript
// Definizione di un autonomous custom element
class UserCard extends HTMLElement {
  constructor() {
    super();
    
    // Inizializzazione del componente
    this.attachShadow({ mode: 'open' });
    this.render();
  }
  
  // Metodo chiamato quando l'elemento viene aggiunto al DOM
  connectedCallback() {
    console.log('UserCard aggiunto al DOM');
  }
  
  // Metodo chiamato quando l'elemento viene rimosso dal DOM
  disconnectedCallback() {
    console.log('UserCard rimosso dal DOM');
  }
  
  // Metodo chiamato quando gli attributi osservati cambiano
  attributeChangedCallback(name, oldValue, newValue) {
    console.log(`Attributo ${name} cambiato da ${oldValue} a ${newValue}`);
    this.render();
  }
  
  // Specifica quali attributi osservare
  static get observedAttributes() {
    return ['name', 'avatar'];
  }
  
  // Metodo per renderizzare il componente
  render() {
    const name = this.getAttribute('name') || 'Utente Anonimo';
    const avatar = this.getAttribute('avatar') || 'default-avatar.png';
    
    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
          border-radius: 8px;
          overflow: hidden;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
          font-family: Arial, sans-serif;
        }
        .card {
          padding: 16px;
          background: white;
        }
        img {
          width: 100%;
          height: auto;
          display: block;
        }
        h2 {
          margin: 8px 0;
          color: #333;
        }
      </style>
      <div class="card">
        <img src="${avatar}" alt="${name}">
        <h2>${name}</h2>
        <slot></slot>
      </div>
    `;
  }
}

// Registrazione del custom element
customElements.define('user-card', UserCard);
```

Utilizzo del custom element:

```html
<user-card name="Mario Rossi" avatar="mario.jpg">
  <p>Frontend Developer</p>
</user-card>
```

Per creare un customized built-in element:

```javascript
// Definizione di un customized built-in element
class FancyButton extends HTMLButtonElement {
  constructor() {
    super();
    this.addEventListener('click', () => this.toggleEffect());
  }
  
  toggleEffect() {
    this.classList.toggle('fancy-active');
  }
}

// Registrazione del customized built-in element
customElements.define('fancy-button', FancyButton, { extends: 'button' });
```

Utilizzo del customized built-in element:

```html
<button is="fancy-button">Clicca qui</button>
```

## Shadow DOM

Il Shadow DOM è una caratteristica fondamentale dei Web Components che permette di incapsulare markup e stili, isolandoli dal resto del documento. Questo previene conflitti di stile e fornisce una vera incapsulazione a livello di DOM.

```javascript
class ToggleSwitch extends HTMLElement {
  constructor() {
    super();
    
    // Creazione del Shadow DOM
    const shadow = this.attachShadow({ mode: 'open' });
    
    // Creazione degli elementi interni
    const wrapper = document.createElement('div');
    wrapper.setAttribute('class', 'switch');
    
    const input = document.createElement('input');
    input.setAttribute('type', 'checkbox');
    input.setAttribute('id', 'toggle');
    
    const label = document.createElement('label');
    label.setAttribute('for', 'toggle');
    
    // Aggiunta degli stili incapsulati
    const style = document.createElement('style');
    style.textContent = `
      .switch {
        position: relative;
        display: inline-block;
      }
      input[type="checkbox"] {
        opacity: 0;
        width: 0;
        height: 0;
      }
      label {
        display: block;
        width: 60px;
        height: 30px;
        background-color: #ccc;
        border-radius: 30px;
        cursor: pointer;
        transition: background-color 0.3s;
        position: relative;
      }
      label::after {
        content: '';
        position: absolute;
        top: 3px;
        left: 3px;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background-color: white;
        transition: transform 0.3s;
      }
      input:checked + label {
        background-color: #2196F3;
      }
      input:checked + label::after {
        transform: translateX(30px);
      }
    `;
    
    // Assemblaggio del componente nel Shadow DOM
    shadow.appendChild(style);
    wrapper.appendChild(input);
    wrapper.appendChild(label);
    shadow.appendChild(wrapper);
    
    // Aggiunta di event listener
    input.addEventListener('change', () => {
      const event = new CustomEvent('toggle', {
        detail: { checked: input.checked },
        bubbles: true,
        composed: true // Permette all'evento di attraversare il confine del Shadow DOM
      });
      this.dispatchEvent(event);
    });
  }
}

customElements.define('toggle-switch', ToggleSwitch);
```

Utilizzo del componente con Shadow DOM:

```html
<toggle-switch></toggle-switch>

<script>
  document.querySelector('toggle-switch').addEventListener('toggle', (e) => {
    console.log('Stato del toggle:', e.detail.checked);
  });
</script>
```

## HTML Templates

L'elemento `<template>` permette di definire frammenti di markup HTML che non vengono renderizzati immediatamente, ma possono essere istanziati in seguito tramite JavaScript. Questo è particolarmente utile per definire la struttura dei Web Components.

```html
<!-- Definizione del template -->
<template id="product-card-template">
  <style>
    .product-card {
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 16px;
      margin: 8px;
      display: inline-block;
      width: 300px;
    }
    .product-image {
      width: 100%;
      height: auto;
    }
    .product-name {
      font-size: 1.2em;
      font-weight: bold;
      margin: 8px 0;
    }
    .product-price {
      color: #e91e63;
      font-weight: bold;
    }
  </style>
  <div class="product-card">
    <img class="product-image">
    <h3 class="product-name"></h3>
    <p class="product-description"></p>
    <div class="product-price"></div>
    <slot name="actions"></slot>
  </div>
</template>

<script>
  class ProductCard extends HTMLElement {
    constructor() {
      super();
      
      // Creazione del Shadow DOM
      const shadow = this.attachShadow({ mode: 'open' });
      
      // Clonazione del template
      const template = document.getElementById('product-card-template');
      const templateContent = template.content.cloneNode(true);
      
      // Popolamento del template con i dati
      const image = templateContent.querySelector('.product-image');
      image.src = this.getAttribute('image') || 'placeholder.jpg';
      image.alt = this.getAttribute('name') || 'Prodotto';
      
      templateContent.querySelector('.product-name').textContent = 
        this.getAttribute('name') || 'Nome Prodotto';
      
      templateContent.querySelector('.product-description').textContent = 
        this.getAttribute('description') || 'Descrizione non disponibile';
      
      templateContent.querySelector('.product-price').textContent = 
        this.getAttribute('price') ? `€${this.getAttribute('price')}` : 'Prezzo non disponibile';
      
      // Aggiunta del template clonato al Shadow DOM
      shadow.appendChild(templateContent);
    }
  }
  
  customElements.define('product-card', ProductCard);
</script>
```

Utilizzo del componente basato su template:

```html
<product-card 
  name="Smartphone XYZ" 
  description="Un potente smartphone con fotocamera avanzata" 
  price="599.99" 
  image="smartphone.jpg">
  <div slot="actions">
    <button>Aggiungi al carrello</button>
  </div>
</product-card>
```

## Slot e Composizione

Gli slot permettono di creare componenti che accettano contenuto esterno, consentendo una maggiore flessibilità e riutilizzabilità. Questo meccanismo è fondamentale per la composizione di componenti complessi.

```javascript
class InfoCard extends HTMLElement {
  constructor() {
    super();
    
    this.attachShadow({ mode: 'open' });
    
    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
          border: 1px solid #ddd;
          border-radius: 8px;
          overflow: hidden;
          margin: 16px 0;
        }
        .header {
          background-color: #f5f5f5;
          padding: 12px 16px;
          border-bottom: 1px solid #ddd;
        }
        .content {
          padding: 16px;
        }
        .footer {
          background-color: #f5f5f5;
          padding: 12px 16px;
          border-top: 1px solid #ddd;
        }
      </style>
      <div class="card">
        <div class="header">
          <slot name="header">Titolo predefinito</slot>
        </div>
        <div class="content">
          <slot>Contenuto predefinito</slot>
        </div>
        <div class="footer">
          <slot name="footer">Footer predefinito</slot>
        </div>
      </div>
    `;
  }
}

customElements.define('info-card', InfoCard);
```

Utilizzo del componente con slot:

```html
<info-card>
  <h2 slot="header">Informazioni importanti</h2>
  <p>Questo è il contenuto principale della card.</p>
  <p>Puoi inserire qualsiasi elemento HTML qui.</p>
  <div slot="footer">
    <button>Chiudi</button>
    <button>Salva</button>
  </div>
</info-card>
```

## Comunicazione tra componenti

I Web Components possono comunicare tra loro attraverso eventi personalizzati, proprietà e metodi pubblici.

```javascript
// Componente emittente
class ColorPicker extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    
    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
        }
        .color-options {
          display: flex;
          gap: 8px;
        }
        .color-option {
          width: 30px;
          height: 30px;
          border-radius: 50%;
          cursor: pointer;
          border: 2px solid transparent;
        }
        .color-option.selected {
          border-color: #333;
        }
      </style>
      <div class="color-picker">
        <div class="color-options">
          <div class="color-option" style="background-color: #ff0000;" data-color="#ff0000"></div>
          <div class="color-option" style="background-color: #00ff00;" data-color="#00ff00"></div>
          <div class="color-option" style="background-color: #0000ff;" data-color="#0000ff"></div>
          <div class="color-option" style="background-color: #ffff00;" data-color="#ffff00"></div>
          <div class="color-option" style="background-color: #ff00ff;" data-color="#ff00ff"></div>
        </div>
      </div>
    `;
    
    //
---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Progressive Web Apps](<04_Progressive_Web_Apps.md>)
- [➡️ Performance Optimization](<06_Performance_Optimization.md>)