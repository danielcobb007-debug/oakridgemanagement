// Navy footer — institutional confidentiality block.
function PortalFooter() {
  return (
    <footer className="portal-footer">
      <div className="portal-footer-inner">
        <div>
          <div className="pf-brand-row">
            <img src="../../assets/dg-logo.svg" alt="DGE&I" />
            <div>
              <div className="pf-brand-name">Oak Ridge Management &nbsp;·&nbsp; DGE&amp;I Investor Portal</div>
              <div className="pf-brand-tag">Access Layer · Restricted Materials</div>
            </div>
          </div>
        </div>
        <p className="pf-disclosure">
          <strong>Confidential.</strong> This portal is provided to approved counterparties of
          Oak Ridge Management and DGE&amp;I for the purposes of partner diligence. Materials
          may be subject to NDA, non-circumvention, advisor clearance, and disclosure controls.
          Nothing on this portal constitutes investment advice, an offer to sell, or a
          solicitation of any security or interest. Sessions are audit-logged.
          <br /><br />
          © 2026 Oak Ridge Management, LLC. CEH™ is a trademark of Oak Ridge Management.
        </p>
      </div>
    </footer>
  );
}
window.PortalFooter = PortalFooter;
