document.querySelectorAll('form[data-confirm]').forEach(f=>f.addEventListener('submit',e=>{if(!confirm(f.dataset.confirm))e.preventDefault();}));
document.querySelectorAll('[data-remove]').forEach(b=>b.addEventListener('click',()=>{const f=b.closest('form');f.querySelector('input[name="quantity"]').value='0';f.requestSubmit();}));
document.querySelectorAll('[data-submit-once]').forEach(b=>b.closest('form').addEventListener('submit',()=>{b.disabled=true;b.textContent='Đang xử lý...';}));

document.querySelectorAll('[data-price]').forEach(button => button.addEventListener('click', () => {
  const form = button.closest('form');
  const [min, max] = button.dataset.price.split(',');
  form.elements.minPrice.value = min;
  form.elements.maxPrice.value = max;
  form.requestSubmit();
}));
const sortSelect = document.querySelector('[data-catalog-sort]');
sortSelect?.addEventListener('change', () => {
  const form = document.querySelector('#catalog-filter');
  form.elements.sort.value = sortSelect.value;
  form.requestSubmit();
});
document.querySelectorAll('[data-quantity-step]').forEach(button => button.addEventListener('click', () => {
  const input = button.closest('.quantity-stepper').querySelector('input');
  const value = Number(input.value) || 1;
  input.value = String(Math.max(Number(input.min), Math.min(Number(input.max), value + Number(button.dataset.quantityStep))));
  input.dispatchEvent(new Event('change', { bubbles: true }));
}));
const searchInput = document.querySelector('#site-search');
const suggestions = document.querySelector('#book-suggestions');
if (searchInput && suggestions) {
  let debounce;
  let pending;
  searchInput.addEventListener('input', () => {
    clearTimeout(debounce);
    pending?.abort();
    suggestions.replaceChildren();
    const query = searchInput.value.trim();
    if (query.length < 2) return;
    debounce = setTimeout(async () => {
      pending = new AbortController();
      try {
        const response = await fetch('/Home/Suggest?q=' + encodeURIComponent(query), { signal: pending.signal });
        if (!response.ok) return;
        const rows = await response.json();
        if (searchInput.value.trim() !== query) return;
        suggestions.replaceChildren(...rows.map(row => {
          const option = document.createElement('option');
          option.value = row.title;
          return option;
        }));
      } catch (_) { /* Search form remains usable when suggestions cannot load. */ }
    }, 250);
  });
}
document.querySelector('[data-copy-link]')?.addEventListener('click', async () => {
  const status = document.querySelector('[data-copy-status]');
  try {
    await navigator.clipboard.writeText(location.href);
    status.textContent = 'Đã sao chép';
  } catch (_) {
    status.textContent = 'Bạn có thể sao chép địa chỉ trên thanh trình duyệt.';
  }
});
const topButton = document.querySelector('.back-to-top');
if (topButton) {
  const update = () => { topButton.hidden = window.scrollY < 600; };
  window.addEventListener('scroll', update, { passive: true });
  update();
  topButton.addEventListener('click', () => window.scrollTo({ top: 0, behavior: matchMedia('(prefers-reduced-motion: reduce)').matches ? 'auto' : 'smooth' }));
}

// Keep the current browsing context when adding a book. The server still validates stock.
const feedback = document.querySelector('.cart-feedback');
let feedbackTimer;
function cartFeedback(message, error = false, destination = "/Cart", linkLabel = "Xem giỏ hàng →") {
  if (!feedback) return;
  clearTimeout(feedbackTimer);
  feedback.querySelector('[data-cart-feedback-text]').textContent = message;
  const link = feedback.querySelector('a');
  if (link) { link.href = destination; link.textContent = linkLabel; }
  feedback.classList.toggle('is-error', error);
  feedback.hidden = false;
  feedbackTimer = setTimeout(() => { feedback.hidden = true; }, 8000);
}
document.querySelector('[data-dismiss-feedback]')?.addEventListener('click', () => { feedback.hidden = true; });
document.addEventListener('submit', async event => {
  const form = event.target;
  if (!form.matches('form[data-cart-add]') || event.submitter?.value === 'checkout' || form.closest('[data-cart-refresh]')) return;
  event.preventDefault();
  if (form.dataset.busy === 'true') return;
  form.dataset.busy = 'true';
  const button = event.submitter || form.querySelector('button[type="submit"]');
  const label = button?.textContent;
  const data = new FormData(form); // Includes the MVC antiforgery token.
  if (button) { button.disabled = true; button.textContent = 'Đang thêm…'; }
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 20000);
  try {
    const response = await fetch(form.action, { method: 'POST', body: data,
      credentials: 'same-origin', headers: { 'X-Requested-With': 'XMLHttpRequest' }, signal: controller.signal });
    if (!response.headers.get('content-type')?.includes('application/json')) throw new Error('Unexpected response');
    const result = await response.json();
    if (response.ok && result.ok) {
      document.querySelectorAll('[data-cart-count]').forEach(node => { node.textContent = result.count; });
      cartFeedback(result.message);
    } else cartFeedback(result.message || 'Chưa thể thêm sách. Vui lòng kiểm tra giỏ hàng.', true);
  } catch (_) {
    cartFeedback('Chưa xác nhận được kết quả. Hãy kiểm tra giỏ hàng trước khi thêm lại.', true);
  } finally {
    clearTimeout(timeout);
    form.dataset.busy = 'false';
    if (button) { button.disabled = false; button.textContent = label; }
  }
});
document.querySelectorAll('[data-password-toggle]').forEach(button => button.addEventListener('click', () => {
  const input = document.getElementById(button.dataset.passwordToggle);
  const show = input.type === 'password';
  input.type = show ? 'text' : 'password';
  button.textContent = show ? 'Ẩn' : 'Hiện';
  button.setAttribute('aria-pressed', String(show));
}));
if (document.querySelector('.mobile-purchase-bar')) document.body.classList.add('has-mobile-purchase');
const mobileFilters = matchMedia('(max-width: 640px)');
document.querySelectorAll('.filter-details').forEach(details => { if (mobileFilters.matches) details.open = false; });
function imageFallback(image) {
  if (!(image instanceof HTMLImageElement) || image.dataset.fallback === 'true') return;
  image.dataset.fallback = 'true';
  image.src = '/images/default.svg';
}
document.addEventListener('error', event => imageFallback(event.target), true);
document.querySelectorAll('img').forEach(image => { if (image.complete && image.naturalWidth === 0) imageFallback(image); });

// Category shelves: links remain usable when JavaScript is disabled.
document.querySelectorAll('[data-shelf-tabs]').forEach(nav => {
  const tabs = [...nav.querySelectorAll('[data-shelf-tab]')];
  const panels = tabs.map(tab => document.getElementById(tab.dataset.shelfTab));
  if (!tabs.length || panels.some(panel => !panel)) return;
  nav.setAttribute('role', 'tablist');
  tabs.forEach((tab, i) => {
    tab.setAttribute('role', 'tab');
    tab.setAttribute('aria-controls', panels[i].id);
    panels[i].setAttribute('role', 'tabpanel');
    panels[i].setAttribute('aria-labelledby', tab.id);
    panels[i].setAttribute('tabindex', '0');
  });
  function select(index, focus = false) {
    tabs.forEach((tab, i) => {
      tab.setAttribute('aria-selected', String(i === index));
      tab.setAttribute('tabindex', i === index ? '0' : '-1');
      panels[i].hidden = i !== index;
    });
    if (focus) tabs[index].focus();
  }
  const hashIndex = panels.findIndex(panel => '#' + panel.id === location.hash);
  select(hashIndex >= 0 ? hashIndex : 0);
  tabs.forEach((tab, i) => {
    tab.addEventListener('click', event => { event.preventDefault(); select(i); });
    tab.addEventListener('keydown', event => {
      const direction = getComputedStyle(nav).direction === 'rtl' ? -1 : 1;
      let next = i;
      if (event.key === 'ArrowRight') next = (i + direction + tabs.length) % tabs.length;
      else if (event.key === 'ArrowLeft') next = (i - direction + tabs.length) % tabs.length;
      else if (event.key === 'Home') next = 0;
      else if (event.key === 'End') next = tabs.length - 1;
      else return;
      event.preventDefault(); select(next, true);
    });
  });
});

const favoriteRequests = new Set();
document.addEventListener('submit', async event => {
  const form = event.target;
  if (!form.matches('form[data-reading-toggle]')) return;
  event.preventDefault();
  const id = form.dataset.bookId;
  if (favoriteRequests.size > 0) return;
  favoriteRequests.add(id);
  const allForms = [...document.querySelectorAll('form[data-reading-toggle]')];
  const forms = allForms.filter(f => f.dataset.bookId === id);
  const allButtons = allForms.map(f => f.querySelector('button'));
  const buttons = forms.map(f => f.querySelector('button'));
  const data = new FormData(form);
  allButtons.forEach(button => { button.disabled = true; });
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 15000);
  try {
    const response = await fetch(form.action, {method:'POST',body:data,credentials:'same-origin',headers:{'X-Requested-With':'XMLHttpRequest'},signal:controller.signal});
    if (!response.headers.get('content-type')?.includes('application/json')) throw new Error('Unexpected response');
    const result = await response.json();
    if (response.ok && result.ok) {
      buttons.forEach(button => {
        button.classList.toggle('is-saved', result.saved);
        button.setAttribute('aria-pressed', String(result.saved));
        button.textContent = button.classList.contains('favorite-button') ? (result.saved ? '♥' : '♡') : (result.saved ? '♥ Đã lưu yêu thích' : '♡ Lưu vào yêu thích');
        const bookCard = button.closest('.book-card');
        const title = bookCard?.querySelector('.book-title')?.textContent;
        if (title) button.setAttribute('aria-label', (result.saved ? 'Bỏ yêu thích: ' : 'Lưu yêu thích: ') + title);
      });
      document.querySelectorAll('[data-favorite-count]').forEach(node => { node.textContent = result.count; });
      cartFeedback(result.message, false, "/Books/Favorites", "Xem yêu thích →");
    } else cartFeedback(result.message || 'Chưa thể cập nhật sách yêu thích.', true, "/Books/Favorites", "Xem yêu thích →");
  } catch (_) {
    cartFeedback('Chưa xác nhận được thay đổi. Hãy mở tủ sách yêu thích để kiểm tra trước khi thử lại.', true, '/Books/Favorites', 'Xem yêu thích →');
  } finally {
    clearTimeout(timeout);favoriteRequests.delete(id);allButtons.forEach(button => { button.disabled = false; });
  }
});
const description = document.querySelector('[data-description]');
const descriptionToggle = document.querySelector('[data-description-toggle]');
if (description && descriptionToggle) {
  const measure = () => {
    if (descriptionToggle.getAttribute('aria-expanded') === 'true') return;
    const long = description.scrollHeight > 300;
    description.classList.toggle('is-collapsed', long);
    descriptionToggle.hidden = !long;
  };
  descriptionToggle.addEventListener('click', () => {
    const expanded = descriptionToggle.getAttribute('aria-expanded') !== 'true';
    description.classList.toggle('is-collapsed', !expanded);
    descriptionToggle.setAttribute('aria-expanded', String(expanded));
    descriptionToggle.textContent = expanded ? 'Thu gọn giới thiệu ↑' : 'Xem thêm giới thiệu ↓';
  });
  measure();window.addEventListener('resize', measure, {passive:true});
}
const coverDialog = document.querySelector('[data-cover-dialog]');
if (coverDialog && typeof coverDialog.showModal === 'function') {
  document.querySelector('[data-cover-open]')?.addEventListener('click', () => coverDialog.showModal());
  document.querySelector('[data-cover-close]')?.addEventListener('click', () => coverDialog.close());
  coverDialog.addEventListener('click', event => { if (event.target === coverDialog) coverDialog.close(); });
}
