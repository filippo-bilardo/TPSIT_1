# Navigazione nel Progetto Finale

## Introduzione

Una navigazione ben progettata è fondamentale per qualsiasi sito web. Permette agli utenti di muoversi facilmente tra le diverse sezioni e trovare rapidamente le informazioni che cercano. In questo modulo, esploreremo come implementare una navigazione efficace e responsive per il nostro progetto finale.

## Tipi di Navigazione

### 1. Navigazione Principale

La navigazione principale è tipicamente posizionata nell'header del sito e contiene i link alle pagine principali:

```html
<header>
  <nav class="main-nav">
    <a href="index.html" class="logo">Nome Sito</a>
    <ul class="nav-links">
      <li><a href="index.html" class="active">Home</a></li>
      <li><a href="about.html">Chi Siamo</a></li>
      <li><a href="services.html">Servizi</a></li>
      <li><a href="blog.html">Blog</a></li>
      <li><a href="contact.html">Contatti</a></li>
    </ul>
    <button class="hamburger" aria-label="Menu">
      <span></span>
      <span></span>
      <span></span>
    </button>
  </nav>
</header>
```

### 2. Navigazione a Piè di Pagina

Il footer spesso contiene link aggiuntivi o ripete quelli principali:

```html
<footer>
  <div class="footer-nav">
    <div class="footer-section">
      <h3>Pagine</h3>
      <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="about.html">Chi Siamo</a></li>
        <li><a href="services.html">Servizi</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="contact.html">Contatti</a></li>
      </ul>
    </div>
    <!-- Altre sezioni del footer -->
  </div>
</footer>
```

### 3. Navigazione Secondaria

Può includere breadcrumb, menu laterali o tab di navigazione:

```html
<!-- Breadcrumb -->
<nav aria-label="Breadcrumb">
  <ol class="breadcrumb">
    <li><a href="index.html">Home</a></li>
    <li><a href="services.html">Servizi</a></li>
    <li aria-current="page">Web Design</li>
  </ol>
</nav>

<!-- Menu laterale -->
<aside>
  <nav class="sidebar-nav">
    <h3>Categorie Blog</h3>
    <ul>
      <li><a href="#">Web Design</a></li>
      <li><a href="#">UX/UI</a></li>
      <li><a href="#">Sviluppo Frontend</a></li>
      <li><a href="#">SEO</a></li>
    </ul>
  </nav>
</aside>
```

## Implementazione di una Navigazione Responsive

### Menu Hamburger per Dispositivi Mobili

Una soluzione comune per la navigazione su dispositivi mobili è il menu hamburger:

```css
/* Stile base per desktop */
.nav-links {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
}

.hamburger {
  display: none;
  background: none;
  border: none;
  cursor: pointer;
}

/* Media query per dispositivi mobili */
@media (max-width: 768px) {
  .nav-links {
    display: none;
    position: absolute;
    top: 60px;
    left: 0;
    width: 100%;
    background-color: #fff;
    flex-direction: column;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }
  
  .nav-links.active {
    display: flex;
  }
  
  .nav-links li {
    margin: 0;
    text-align: center;
  }
  
  .nav-links li a {
    display: block;
    padding: 15px;
    border-bottom: 1px solid #eee;
  }
  
  .hamburger {
    display: block;
  }
}
```

E il JavaScript per attivare il menu:

```javascript
document.querySelector('.hamburger').addEventListener('click', function() {
  document.querySelector('.nav-links').classList.toggle('active');
});
```

### Menu Dropdown

Per menu con sottocategorie:

```html
<nav class="main-nav">
  <ul>
    <li><a href="#">Home</a></li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle">Servizi</a>
      <ul class="dropdown-menu">
        <li><a href="#">Web Design</a></li>
        <li><a href="#">Sviluppo App</a></li>
        <li><a href="#">SEO</a></li>
      </ul>
    </li>
    <!-- Altri elementi del menu -->
  </ul>
</nav>
```

```css
.dropdown {
  position: relative;
}

.dropdown-menu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #fff;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  min-width: 200px;
  z-index: 1;
}

.dropdown:hover .dropdown-menu {
  display: block;
}

/* Versione mobile */
@media (max-width: 768px) {
  .dropdown-menu {
    position: static;
    box-shadow: none;
    width: 100%;
    background-color: #f9f9f9;
  }
  
  .dropdown-menu li a {
    padding-left: 30px;
  }
}
```

## Stato Attivo e Feedback Visivo

È importante fornire un feedback visivo per indicare la pagina corrente:

```css
.nav-links a {
  color: #333;
  text-decoration: none;
  padding: 10px 15px;
  transition: all 0.3s ease;
}

.nav-links a:hover {
  color: #0066cc;
}

.nav-links a.active {
  color: #0066cc;
  font-weight: bold;
  border-bottom: 2px solid #0066cc;
}
```

Per impostare dinamicamente la classe active con JavaScript:

```javascript
document.addEventListener('DOMContentLoaded', function() {
  const currentLocation = location.pathname;
  const navLinks = document.querySelectorAll('.nav-links a');
  
  navLinks.forEach(link => {
    if(link.getAttribute('href') === currentLocation || 
       currentLocation.includes(link.getAttribute('href'))) {
      link.classList.add('active');
    }
  });
});
```

## Accessibilità della Navigazione

Per rendere la navigazione accessibile:

1. **Usa elementi semantici**: `<nav>`, `<ul>`, `<li>` per la struttura del menu
2. **Aggiungi attributi ARIA**: `aria-current="page"` per la pagina corrente, `aria-expanded` per menu dropdown
3. **Assicura la navigabilità da tastiera**: Tutti i link devono essere raggiungibili con Tab
4. **Fornisci alternative al menu hamburger**: Considera un menu a fisarmonica o un menu semplificato per schermi piccoli

Esempio di menu hamburger accessibile:

```html
<button class="hamburger" aria-expanded="false" aria-controls="nav-links" aria-label="Menu">
  <span></span>
  <span></span>
  <span></span>
</button>
<ul id="nav-links" class="nav-links">
  <!-- Link del menu -->
</ul>
```

```javascript
const hamburger = document.querySelector('.hamburger');
const navLinks = document.querySelector('.nav-links');

hamburger.addEventListener('click', function() {
  const isExpanded = hamburger.getAttribute('aria-expanded') === 'true';
  hamburger.setAttribute('aria-expanded', !isExpanded);
  navLinks.classList.toggle('active');
});
```

## Tecniche Avanzate di Navigazione

### Navigazione Sticky

Un menu che rimane visibile durante lo scorrimento:

```css
.main-nav {
  position: sticky;
  top: 0;
  background-color: #fff;
  z-index: 1000;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
```

### Mega Menu

Per siti con molte categorie:

```html
<li class="mega-dropdown">
  <a href="#">Prodotti</a>
  <div class="mega-menu">
    <div class="mega-menu-column">
      <h3>Categoria 1</h3>
      <ul>
        <li><a href="#">Prodotto 1.1</a></li>
        <li><a href="#">Prodotto 1.2</a></li>
      </ul>
    </div>
    <div class="mega-menu-column">
      <h3>Categoria 2</h3>
      <ul>
        <li><a href="#">Prodotto 2.1</a></li>
        <li><a href="#">Prodotto 2.2</a></li>
      </ul>
    </div>
    <!-- Altre colonne -->
  </div>
</li>
```

```css
.mega-dropdown {
  position: static;
}

.mega-menu {
  display: none;
  position: absolute;
  left: 0;
  width: 100%;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  z-index: 1000;
}

.mega-dropdown:hover .mega-menu {
  display: flex;
}

.mega-menu-column {
  flex: 1;
  padding: 0 15px;
}

@media (max-width: 768px) {
  .mega-menu {
    flex-direction: column;
    position: static;
    box-shadow: none;
  }
}
```

## Conclusione

Una navigazione ben progettata è cruciale per l'usabilità del tuo sito web. Assicurati che sia intuitiva, responsive e accessibile. Testa la tua navigazione su diversi dispositivi e con diversi utenti per garantire che funzioni correttamente in tutte le situazioni.

Per il progetto finale, implementa una navigazione che si adatti alle esigenze del tuo sito e del tuo pubblico target, considerando sia l'aspetto estetico che funzionale.

## Esercizio Pratico

Implementa una navigazione completa per il tuo progetto finale che includa:

1. Menu principale responsive con stato attivo
2. Menu hamburger per dispositivi mobili
3. Breadcrumb per la navigazione secondaria
4. Footer con link di navigazione aggiuntivi

Assicurati che la navigazione sia accessibile e funzioni correttamente su tutti i dispositivi.

## Risorse Aggiuntive

- [MDN Web Docs: Navigazione Accessibile](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Navigation_Role)
- [Smashing Magazine: Patterns di Navigazione Responsive](https://www.smashingmagazine.com/2017/05/responsive-navigation-patterns/)
- [Nielsen Norman Group: Usabilità della Navigazione](https://www.nngroup.com/articles/navigation-cognitive-strain/)

## Navigazione
- [Indice del Progetto Finale](./README.md)
- [⬅️ Layout Responsive](./02-LayoutResponsive.md)
- [➡️ Contenuti Multimediali](./04-ContenutiMultimediali.md)