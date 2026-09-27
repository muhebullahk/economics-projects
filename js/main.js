// Mobile nav toggle
(function () {
  const hamburger = document.querySelector('.hamburger');
  const navLinks  = document.querySelector('.nav-links');

  if (hamburger && navLinks) {
    hamburger.addEventListener('click', function () {
      const open = navLinks.classList.toggle('open');
      hamburger.classList.toggle('open', open);
      hamburger.setAttribute('aria-expanded', open);
    });

    // Close on outside click
    document.addEventListener('click', function (e) {
      if (!hamburger.contains(e.target) && !navLinks.contains(e.target)) {
        navLinks.classList.remove('open');
        hamburger.classList.remove('open');
        hamburger.setAttribute('aria-expanded', false);
      }
    });

    // Close on nav link click (mobile)
    navLinks.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        navLinks.classList.remove('open');
        hamburger.classList.remove('open');
        hamburger.setAttribute('aria-expanded', false);
      });
    });
  }
})();

// Mark active nav link based on current page
(function () {
  const current = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a').forEach(function (link) {
    const href = link.getAttribute('href');
    if (href === current || (current === '' && href === 'index.html')) {
      link.classList.add('active');
    }
  });
})();

// Visitor counter — auto-injects into every page using the shared nav
(function () {
  const navInner = document.querySelector('.nav-inner');
  if (!navInner || document.getElementById('visit-n')) return;

  const span = document.createElement('span');
  span.className = 'visit-ct';
  span.innerHTML = 'Visits: <strong id="visit-n">—</strong>';

  const brand = navInner.querySelector('.nav-brand');
  if (brand && brand.nextSibling) {
    navInner.insertBefore(span, brand.nextSibling);
  } else {
    navInner.appendChild(span);
  }

  const key = 'visits_' + (window.location.pathname.split('/').pop() || 'index.html');
  const n = (parseInt(localStorage.getItem(key)) || 0) + 1;
  localStorage.setItem(key, n);
  document.getElementById('visit-n').textContent = n.toLocaleString();
})();

// Contact form — simple client-side feedback
(function () {
  const form = document.getElementById('contact-form');
  if (!form) return;

  form.addEventListener('submit', function (e) {
    e.preventDefault();
    const btn = form.querySelector('.form-submit');
    btn.textContent = 'Message Sent';
    btn.disabled = true;
    btn.style.background = '#2d6a4f';

    const note = document.createElement('p');
    note.style.cssText = 'font-size:0.85rem;color:#2d6a4f;margin-top:0.75rem;font-family:sans-serif;';
    note.textContent = 'Thank you for your message. I will respond as soon as possible.';
    form.appendChild(note);
  });
})();
