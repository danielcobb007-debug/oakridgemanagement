// Capital Architecture — HoldCo / ProjectCo levels with capital sources.
const LEVELS = [
  { label: 'HoldCo', nodes: [
    { name: 'DGE&I HoldCo',   meta: 'Platform sponsor · GP / promote', cls: 'holdco' },
    { name: 'ORM',            meta: 'Access layer · IP · governance',  cls: 'holdco' },
    { name: 'Advisory',       meta: 'Counsel · structuring · diligence', cls: '' },
  ] },
  { label: 'Capital', nodes: [
    { name: 'Infrastructure Capital', meta: 'Senior + sub debt · ITC bridge', cls: '' },
    { name: 'Real-Estate Capital',    meta: 'Site basis · adaptive reuse',     cls: '' },
    { name: 'Compute / Demand JV',    meta: 'Tenant-aligned co-investment',    cls: '' },
  ] },
  { label: 'ProjectCo', nodes: [
    { name: 'Site SPV · St. Paul',  meta: 'Operating · 120 MW phased',  cls: '' },
    { name: 'Site SPV · Savannah',  meta: 'Diligence · 250 MW',         cls: '' },
    { name: 'Site SPV · Bowman',    meta: 'Diligence · 150 MW',         cls: '' },
  ] },
];

function CapitalArchitecture() {
  return (
    <section className="portal-section alt" id="capital">
      <div className="wrap-wide">
        <header className="portal-section-hdr">
          <div className="psh-left">
            <span className="psh-eyebrow">DGE&amp;I Workstream · Capital Structure</span>
            <h2 className="psh-title">Capital Architecture</h2>
          </div>
          <span className="psh-meta">Conceptual · subject to NDA</span>
        </header>

        <div className="cap-arch">
          {LEVELS.map(lv => (
            <div className="level" key={lv.label}>
              <div className="level-label">{lv.label}</div>
              <div className="level-content">
                {lv.nodes.map(n => (
                  <div key={n.name} className={`cap-node ${n.cls}`}>
                    <div className="cap-node-name">{n.name}</div>
                    <div className="cap-node-meta">{n.meta}</div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
window.CapitalArchitecture = CapitalArchitecture;
