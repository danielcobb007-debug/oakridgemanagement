(function () {
  var nav = document.getElementById('site-nav');
  var btn = document.querySelector('.nav-mobile-btn');
  if (!nav || !btn) return;
  btn.addEventListener('click', function () {
    var isOpen = nav.classList.toggle('mobile-open');
    btn.setAttribute('aria-expanded', isOpen);
    btn.setAttribute('aria-label', isOpen ? 'Close menu' : 'Open menu');
  });
})();
