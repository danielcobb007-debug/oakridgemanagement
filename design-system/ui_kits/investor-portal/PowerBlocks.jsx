// Power Block Comparison — same SKU structure, refined institutional copy.
const BLOCKS = [
  { id: 'ac',  num: '01 — AC Power Block', name: 'Grid-Connected',
    arch: 'Utility / ATC interconnection',
    rows: [
      ['Capacity', '50 MW'],
      ['Source', 'Utility · ATC Grid'],
      ['Use Case', 'Traditional utility interconnection or transformer-upgrade pathway.'],
      ['Profile', 'Lower operating complexity; slower activation timeline.'],
      ['Capital', 'Utility-dependent; lower infrastructure control.'],
      ['Speed', 'Moderate to slow'],
    ] },
  { id: 'cdc', num: '02 — CDC Block', name: 'Cloud-Direct Compute',
    arch: 'Hybrid BTM + Grid',
    rows: [
      ['Capacity', '100 MW'],
      ['Architecture', 'Hybrid BTM + Grid'],
      ['Use Case', 'Campus-scale compute deployment with blended utility and on-site generation.'],
      ['Profile', 'Balanced speed, redundancy, and financeability.'],
      ['Capital', 'Supports blended infrastructure and real-estate capital.'],
      ['Speed', 'Faster than grid-only'],
    ] },
  { id: 'edc', num: '03 — EDC Block', name: 'Edge / Dispatchable Compute', flagship: true,
    arch: 'Behind-the-meter dispatchable generation',
    rows: [
      ['Capacity', '300 MW'],
      ['Source', 'BTM Dispatchable Generation'],
      ['Use Case', 'Large-scale AI compute campus requiring controllable power and accelerated activation.'],
      ['Profile', 'Highest control; highest complexity; strongest platform leverage.'],
      ['Capital', 'Infrastructure-heavy; potentially strongest GP / platform economics.'],
      ['Speed', 'Fastest when fuel / generation path secured'],
    ] },
];

function PowerBlocks() {
  return (
    <section className="portal-section" id="power">
      <div className="wrap-wide">
        <header className="portal-section-hdr">
          <div className="psh-left">
            <span className="psh-eyebrow">DGE&amp;I Workstream · Power Infrastructure Models</span>
            <h2 className="psh-title">Power Block Comparison</h2>
          </div>
          <span className="psh-meta">Confidential · Diligence Preview</span>
        </header>

        <p style={{ fontFamily: 'var(--serif)', fontSize: 15, lineHeight: 1.6, color: 'var(--text-muted)', maxWidth: 880, margin: '0 0 18px' }}>
          A comparative view of grid-connected, hybrid, and behind-the-meter deployment models used to evaluate site readiness, capital requirements, execution complexity, and speed-to-compute.
        </p>

        <div style={{
          background: 'var(--bronze-soft, #f0e8d2)',
          borderLeft: '2px solid var(--bronze)',
          padding: '12px 16px',
          margin: '0 0 20px',
          fontFamily: 'var(--serif)',
          fontStyle: 'italic',
          fontSize: 14,
          lineHeight: 1.6,
          color: 'var(--text)',
          maxWidth: 920,
        }}>
          Standardized power blocks allow DGE&amp;I to compare sites, compress diligence timelines, match capital to infrastructure risk, and accelerate deployment from land control to energized compute.
        </div>

        <div className="modules-grid" style={{ gridTemplateColumns: 'repeat(3, 1fr)' }}>
          {BLOCKS.map(b => (
            <article key={b.id} className="module-card" style={b.flagship ? { background: '#fdfbf3', borderColor: 'var(--bronze-tag, #dcc998)' } : {}}>
              <div className="module-meta">
                <span className={`module-tag ${b.flagship ? 'tag-nda' : 'tag-confidential'}`}>{b.flagship ? 'Flagship' : 'Reference'}</span>
                <span className="module-num">{b.num}</span>
              </div>
              <h3 className="module-title">{b.name}</h3>
              <div className="module-sub">{b.arch}</div>
              {b.rows.map(([k, v]) => (
                <div key={k} style={{ display: 'grid', gridTemplateColumns: '88px 1fr', gap: 12, padding: '6px 0', borderTop: '1px dashed var(--rule-soft)', alignItems: 'baseline' }}>
                  <span style={{ fontFamily: 'var(--sans, Inter)', fontSize: 10.5, color: 'var(--text-muted)', fontWeight: 500, letterSpacing: 0.2 }}>{k}</span>
                  <span style={{ fontFamily: k === 'Capacity' || k === 'Architecture' || k === 'Source' || k === 'Speed' ? "'Inter', sans-serif" : 'var(--serif)', fontSize: 12.5, color: 'var(--text)', lineHeight: 1.5 }}>{v}</span>
                </div>
              ))}
            </article>
          ))}
        </div>

        <div style={{ marginTop: 16, paddingTop: 12, borderTop: '1px solid var(--rule)', fontFamily: 'var(--mono)', fontSize: 10.5, color: 'var(--text-muted)', letterSpacing: 0.2, lineHeight: 1.85 }}>
          <b style={{ color: 'var(--text)', fontWeight: 500 }}>AC</b> Alternating Current · grid-connected. &nbsp;
          <b style={{ color: 'var(--text)', fontWeight: 500 }}>CDC</b> Cloud-Direct Compute · hybrid BTM + grid. &nbsp;
          <b style={{ color: 'var(--text)', fontWeight: 500 }}>EDC</b> Edge / Dispatchable Compute · behind-the-meter, dispatchable.
        </div>
      </div>
    </section>
  );
}
window.PowerBlocks = PowerBlocks;
