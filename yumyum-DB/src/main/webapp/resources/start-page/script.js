const modal = document.querySelector('[data-modal]');
const openButtons = document.querySelectorAll('[data-modal-open]');
const closeButtons = document.querySelectorAll('[data-modal-close]');
const tabButtons = document.querySelectorAll('[data-tab-target]');

function openModal() {
  modal?.setAttribute('aria-hidden', 'false');
  document.body.style.overflow = 'hidden';
}

function closeModal() {
  modal?.setAttribute('aria-hidden', 'true');
  document.body.style.overflow = '';
}

openButtons.forEach((button) => {
  button.addEventListener('click', openModal);
});

closeButtons.forEach((button) => {
  button.addEventListener('click', closeModal);
});

modal?.addEventListener('click', (event) => {
  if (event.target === modal) {
    closeModal();
  }
});

window.addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && modal?.getAttribute('aria-hidden') === 'false') {
    closeModal();
  }
});

function setActiveTab(targetId) {
  tabButtons.forEach((button) => {
    const isActive = button.getAttribute('data-tab-target') === targetId;
    button.setAttribute('aria-selected', isActive);
  });

  document.querySelectorAll('[data-tab-panel]').forEach((panel) => {
    const isTarget = panel.id === targetId;
    panel.setAttribute('aria-hidden', !isTarget);
  });
}

if (tabButtons.length) {
  const initial = tabButtons[0].getAttribute('data-tab-target');
  setActiveTab(initial);
}

tabButtons.forEach((button) => {
  button.addEventListener('click', () => {
    const targetId = button.getAttribute('data-tab-target');
    if (targetId) {
      setActiveTab(targetId);
    }
  });
});
