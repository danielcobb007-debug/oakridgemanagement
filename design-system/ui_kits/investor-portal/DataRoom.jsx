// Data Room table — document index with access state.
const DOCS = [
  { ext: 'PDF', name: 'DGE&I Platform Overview · v0.9',          cat: 'Platform',  updated: '2026-04-12', access: 'granted', accessLabel: 'Granted' },
  { ext: 'PDF', name: 'HoldCo / ProjectCo Architecture',          cat: 'Capital',   updated: '2026-04-10', access: 'granted', accessLabel: 'Granted' },
  { ext: 'XLSX',name: 'Site Portfolio Master · 2026-04',          cat: 'Sites',     updated: '2026-04-09', access: 'granted', accessLabel: 'Granted' },
  { ext: 'PDF', name: 'Power Block Specifications · v1.2',        cat: 'Power',     updated: '2026-04-08', access: 'pending', accessLabel: 'NDA Pending' },
  { ext: 'PDF', name: 'Anchor Offtake Term Sheet · St. Paul',     cat: 'Commercial',updated: '2026-04-06', access: 'restricted', accessLabel: 'Restricted' },
  { ext: 'PPTX',name: 'Strategic Briefing · Partner Onboarding',  cat: 'Platform',  updated: '2026-04-04', access: 'granted', accessLabel: 'Granted' },
  { ext: 'XLSX',name: 'Capital Stack Concept · DGE&I HoldCo',     cat: 'Capital',   updated: '2026-03-30', access: 'pending', accessLabel: 'NDA Pending' },
  { ext: 'PDF', name: 'Non-Circumvention · Standard Form',        cat: 'Legal',     updated: '2026-03-22', access: 'granted', accessLabel: 'Granted' },
];

function DataRoom() {
  return (
    <section className="portal-section" id="dataroom">
      <div className="wrap-wide">
        <header className="portal-section-hdr">
          <div className="psh-left">
            <span className="psh-eyebrow">Restricted · Audit-Logged Access</span>
            <h2 className="psh-title">Data Room</h2>
          </div>
          <span className="psh-meta">{DOCS.length} documents · {[...new Set(DOCS.map(d => d.cat))].length} categories</span>
        </header>

        <div style={{ overflow: 'auto' }}>
          <table className="dr-table">
            <thead>
              <tr>
                <th>Type</th>
                <th>Document</th>
                <th>Category</th>
                <th>Updated</th>
                <th>Access</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {DOCS.map(d => (
                <tr key={d.name}>
                  <td><span className="dr-icon">{d.ext}</span></td>
                  <td className="dr-name">{d.name}</td>
                  <td>{d.cat}</td>
                  <td>{d.updated}</td>
                  <td><span className={`dr-access ${d.access}`}>{d.accessLabel}</span></td>
                  <td><a href="#" style={{ color: 'var(--navy)', fontFamily: 'var(--mono)', fontSize: 11 }}>Open →</a></td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <p style={{ marginTop: 14, fontFamily: 'var(--mono)', fontSize: 10.5, color: 'var(--text-muted)', letterSpacing: 0.2, lineHeight: 1.85 }}>
          Document access is permissioned per counterparty. NDA execution unlocks pending items.
          All views, downloads, and session timestamps are audit-logged. Restricted items require
          principal-level approval.
        </p>
      </div>
    </section>
  );
}
window.DataRoom = DataRoom;
