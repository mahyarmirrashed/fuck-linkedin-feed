(function () {
  function nuke() {
    const feed = document.querySelector('[data-testid="mainFeed"]');
    if (feed) feed.remove();
  }

  nuke();

  new MutationObserver(nuke).observe(document.documentElement, {
    childList: true,
    subtree: true,
  });
})();
