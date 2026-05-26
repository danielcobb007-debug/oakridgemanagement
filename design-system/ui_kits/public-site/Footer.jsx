// Navy institutional footer.
const FOOTER_LINKS = [
  ['Operating Domains', '#domains'],
  ['Current Thesis',    '#thesis'],
  ['Active Workstreams', '#workstreams'],
  ['Operating Principles', '#principles'],
  ['Partner Access',    '#access'],
  ['Strategic Conversations', '#contact'],
  ['CEH™ Standard (preview) ↗',   'https://cehstandard.com'],
  ['CEH™ Index (internal draft) ↗', 'https://www.cehinfrastructureindex.com'],
];

function Footer() {
  return (
    <footer className="site-footer">
      <div className="footer-inner">
        <div>
          <div className="footer-mark">Oak Ridge Management</div>
          <div className="footer-tag">Private Operating Platform · Atlanta, GA</div>
          <p className="footer-disc">
            Oak Ridge Management is a private operating and strategy platform.
            Nothing on this website constitutes investment advice, an offer to sell,
            or a solicitation of any security or interest. Confidential materials
            and portal access are provided only to approved counterparties and may
            be subject to NDA, non-circumvention, and disclosure controls.
          </p>
        </div>
        <div>
          <ul className="footer-links">
            {FOOTER_LINKS.map(([label, href]) => (
              <li key={label}><a href={href}>{label}</a></li>
            ))}
          </ul>
          <div className="footer-rule"></div>
          <div className="footer-base">
            © 2026 Oak Ridge Management, LLC. CEH™ is a trademark of Oak Ridge Management and refers to a developing methodology framework — methodology preview, subject to validation. All rights reserved.
          </div>
        </div>
      </div>
    </footer>
  );
}
window.Footer = Footer;
