// ORM access ribbon — establishes the parent context above the portal nav.
function OrmRibbon() {
  return (
    <div className="orm-ribbon" aria-label="Oak Ridge Management access layer">
      <div className="orm-ribbon-left">
        <span>Oak Ridge Management</span>
        <span className="sep">·</span>
        <span>Investor Access Layer</span>
      </div>
      <div className="orm-ribbon-right">
        <span>DGE&amp;I Workstream</span>
        <span className="badge">Restricted</span>
      </div>
    </div>
  );
}
window.OrmRibbon = OrmRibbon;
