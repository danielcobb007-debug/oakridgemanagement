// Portal nav under the ORM ribbon. Top items per spec.
function InvestorNav({ active, onLogout }) {
  const links = [
    { href: '#overview',  label: 'Overview',  key: 'overview' },
    { href: '#platform',  label: 'Platform',  key: 'platform' },
    { href: '#sites',     label: 'Sites',     key: 'sites' },
    { href: '#power',     label: 'Power',     key: 'power' },
    { href: '#capital',   label: 'Capital',   key: 'capital' },
    { href: '#dataroom',  label: 'Data Room', key: 'dataroom' },
  ];
  return (
    <nav className="portal-nav" id="site-nav">
      <div className="portal-nav-inner">
        <img src="../../assets/dg-logo.svg" alt="DGE&I" className="dg-logo" />
        <div className="portal-nav-divider"></div>
        <div className="portal-nav-brand">
          <span className="portal-nav-name">DGE&amp;I Investor Portal</span>
          <span className="portal-nav-tag">Oak Ridge Management · Access Layer</span>
        </div>
        <ul className="portal-nav-links">
          {links.map(l => (
            <li key={l.key}>
              <a href={l.href} className={active === l.key ? 'active' : ''}>{l.label}</a>
            </li>
          ))}
        </ul>
        {onLogout
          ? <button className="portal-nav-cta" onClick={onLogout} style={{ background: 'transparent', color: 'var(--text-muted)', border: '1px solid var(--border-md)' }}>Log out</button>
          : <a href="#access" className="portal-nav-cta">Request Access →</a>}
      </div>
    </nav>
  );
}
window.InvestorNav = InvestorNav;
