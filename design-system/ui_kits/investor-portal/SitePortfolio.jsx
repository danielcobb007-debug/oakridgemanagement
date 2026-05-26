// Site Portfolio — four named sites + future pipeline. Institutional table.
const SITES = [
  { name: 'St. Paul, MN',   meta: 'Adaptive reuse · industrial campus',  status: 'Operating',   tone: 'active',     mw: '120 MW phased', power: 'Hybrid BTM + Grid', anchor: 'Strategic offtake', notes: 'Active diligence with anchor counterparty.' },
  { name: 'Savannah, GA',   meta: 'Greenfield · gas-adjacent corridor',  status: 'Diligence',   tone: 'diligence',  mw: '250 MW',        power: 'BTM dispatchable',  anchor: 'In discussion',     notes: 'Permitting + interconnect path under review.' },
  { name: 'Bowman, GA',     meta: 'Adaptive reuse · rural utility tie',  status: 'Diligence',   tone: 'diligence',  mw: '150 MW',        power: 'Hybrid',            anchor: 'Multiple inbound',  notes: 'Tenant qualification underway.' },
  { name: 'Montgomery, AL', meta: 'Greenfield · transformer upgrade',    status: 'Pipeline',    tone: 'pipeline',   mw: '200–300 MW',    power: 'BTM dispatchable',  anchor: 'Open',              notes: 'Land control · pre-diligence.' },
  { name: 'Future pipeline', meta: 'Additional sites under evaluation',  status: 'Future',      tone: 'future',     mw: '—',             power: '—',                 anchor: '—',                  notes: 'Adaptive-reuse and greenfield candidates being qualified.' },
];

function SitePortfolio() {
  return (
    <section className="portal-section alt" id="sites">
      <div className="wrap-wide">
        <header className="portal-section-hdr">
          <div className="psh-left">
            <span className="psh-eyebrow">DGE&amp;I Workstream · Site Portfolio</span>
            <h2 className="psh-title">Site Portfolio</h2>
          </div>
          <span className="psh-meta">5 entries · Refreshed April 2026</span>
        </header>
        <div style={{ overflow: 'auto' }}>
          <table className="sites-table">
            <thead>
              <tr>
                <th>Site</th>
                <th>Strategy</th>
                <th>Status</th>
                <th>Target MW</th>
                <th>Power Pathway</th>
                <th>Anchor</th>
                <th>Notes</th>
              </tr>
            </thead>
            <tbody>
              {SITES.map(s => (
                <tr key={s.name}>
                  <td>
                    <span className="site-name">{s.name}</span>
                    <span className="site-meta">{s.meta}</span>
                  </td>
                  <td>{s.meta.split('·')[0].trim()}</td>
                  <td><span className={`site-status status-${s.tone}`}>{s.status}</span></td>
                  <td>{s.mw}</td>
                  <td>{s.power}</td>
                  <td>{s.anchor}</td>
                  <td style={{ minWidth: 220 }}>{s.notes}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <p className="sites-footnote">
          Site detail, capacity, and status are subject to ongoing diligence and may evolve.
          Adaptive-reuse versus greenfield posture is selected to balance speed-to-compute,
          capital intensity, and counterparty fit. All site disclosures are confidential and
          subject to NDA.
        </p>
      </div>
    </section>
  );
}
window.SitePortfolio = SitePortfolio;
