if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });
}
// Otherwise, no push notifications :(
else {
  console.error('Service worker is not supported in this browser');
}