// Portal hero — Restricted Partner Access, memo stamp, disclosure box.
function PortalHero({ onRequestAccess, onLogin }) {
  return (
    <section className="portal-hero">
      <div className="wrap-wide">
        <div className="portal-hero-grid">
          <div>
            <div className="hero-eyebrow">Restricted Partner Access</div>
            <h1>DGE&amp;I Investor Portal</h1>
            <p className="hero-sub">
              Private diligence environment for qualified capital, infrastructure, and strategic partners evaluating the DGE&amp;I platform.
            </p>
            <p className="hero-supporting">
              Access is limited to qualified capital partners, strategic infrastructure participants, hyperscale and offtake counterparties, and approved advisors. Materials are provided for confidential review and are subject to applicable NDA, non-circumvention, and disclosure controls.
            </p>

            <div className="hero-actions">
              <a href="#access" className="btn-navy-filled" onClick={onRequestAccess}>Request Access →</a>
              <a href="#login" className="btn-navy-outline" onClick={onLogin}>Existing Partner Login →</a>
            </div>

            <div className="disclosure-box">
              <span className="label">Disclosure</span>
              Access is by invitation or approval only. Materials are confidential and may require NDA, non-circumvention, and advisor clearance before release. Nothing on this portal constitutes an offer to sell or a solicitation of any security or interest.
            </div>
          </div>

          <aside className="memo-stamp" aria-label="Portal metadata">
            <div className="stamp-hdr">Portal · Status</div>
            <div className="stamp-row"><span className="k">Sponsor</span><span className="v">Oak Ridge Management</span></div>
            <div className="stamp-row"><span className="k">Platform</span><span className="v">DGE&amp;I</span></div>
            <div className="stamp-row"><span className="k">Version</span><span className="v">Diligence v0.9 · April 2026</span></div>
            <div className="stamp-row"><span className="k">Confidentiality</span><span className="v">Restricted · NDA</span></div>
            <div className="stamp-row"><span className="k">Audience</span><span className="v">Approved counterparties</span></div>
            <div className="stamp-foot"><span className="stamp-dot"></span>Materials under controlled release</div>
          </aside>
        </div>
      </div>
    </section>
  );
}
window.PortalHero = PortalHero;
