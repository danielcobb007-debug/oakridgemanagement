// ORM public-site nav. Quiet wordmark + restrained nav + single Access CTA.
function Nav({ active }) {
  const links = [
    { href: '#domains',     label: 'Domains',     key: 'domains' },
    { href: '#thesis',      label: 'Thesis',      key: 'thesis' },
    { href: '#workstreams', label: 'Workstreams', key: 'workstreams' },
    { href: '#principles',  label: 'Principles',  key: 'principles' },
    { href: '#access',      label: 'Access',      key: 'access' },
    { href: '#contact',     label: 'Contact',     key: 'contact' },
  ];
  return (
    <nav className="site-nav" id="site-nav">
      <div className="nav-inner">
        <a href="#top" className="nav-logo" aria-label="Oak Ridge Management">
          <span className="nav-logo-mark">Oak Ridge Management</span>
          <span className="nav-logo-tag">Private Operating Platform</span>
        </a>
        <ul className="nav-links">
          {links.map(l => (
            <li key={l.key}>
              <a href={l.href} aria-current={active === l.key ? 'page' : undefined}>{l.label}</a>
            </li>
          ))}
        </ul>
        <a href="#contact" className="nav-cta">Request a Conversation</a>
      </div>
    </nav>
  );
}
window.Nav = Nav;
