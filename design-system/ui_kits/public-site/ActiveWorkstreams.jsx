// Active Workstreams — institutional comparison table.
const WORKSTREAMS = [
  { id: 'DGE&I',                domain: 'Platform Strategy',  stage: 'Operating',         tone: 'forest', focus: 'Behind-the-meter compute infrastructure platform — site portfolio, power blocks, and hyperscale offtake.', surface: 'Partner portal · gated' },
  { id: 'CEH™ Standard',         domain: 'Market Standards',   stage: 'Methodology preview',   tone: 'navy',   focus: 'Compute Energy Hour — developing measurement framework for compute energy efficiency and infrastructure underwriting. Draft methodology, subject to validation.', surface: 'cehstandard.com' },
  { id: 'CEH™ Index',            domain: 'Market Standards',   stage: 'Internal draft',        tone: 'navy',   focus: 'Internal hardware ranking under CEH™ methodology. Not a certified public index or externally adopted benchmark.', surface: 'cehinfrastructureindex.com' },
  { id: 'QumulusAI Exposure',   domain: 'Strategic Capital',  stage: 'Position',          tone: 'bronze', focus: 'Strategic compute exposure via the QumulusAI vehicle and adjacent infrastructure positions.', surface: 'Private' },
  { id: 'SPV Strategy',         domain: 'Strategic Capital',  stage: 'Active mandates',   tone: 'bronze', focus: 'Special-purpose vehicles for principal-led private investments and co-investment alignment.', surface: 'Private' },
  { id: 'Operating Intelligence', domain: 'Command Layer',    stage: 'Ongoing',           tone: 'slate',  focus: 'Capital architecture, commercial strategy, and transaction framing for partners and portfolio.', surface: 'Engagement-based' },
];

function ActiveWorkstreams() {
  return (
    <section id="workstreams">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 03</div>
          <div className="eyebrow">Active Workstreams</div>
          <h2>What ORM is coordinating today</h2>
          <p className="descriptor">
            Workstreams are operating expressions of ORM's domains. They are
            coordinated, not consolidated — each has its own commercial structure
            and counterparty universe.
          </p>
        </header>

        <div style={{ overflow: 'auto' }}>
          <table className="ws-table">
            <thead>
              <tr>
                <th>Workstream</th>
                <th>Domain</th>
                <th>Stage</th>
                <th>Focus</th>
                <th>Surface</th>
              </tr>
            </thead>
            <tbody>
              {WORKSTREAMS.map(w => (
                <tr key={w.id}>
                  <td className="ws-id">{w.id}</td>
                  <td>{w.domain}</td>
                  <td><span className={`ws-stage stage-${w.tone}`}>{w.stage}</span></td>
                  <td className="ws-focus">{w.focus}</td>
                  <td className="ws-surface">{w.surface}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <p className="ws-footnote">
          CEH™ Standard and CEH™ Index are developing methodology frameworks owned
          by Oak Ridge Management. References on this site are to a methodology preview;
          neither is a certified public index nor an externally adopted benchmark unless
          separately established. Nothing on this page constitutes an offer to sell, or
          a solicitation of an offer to buy, any security or interest. Confidential
          materials are released off-site to approved counterparties only.
        </p>
      </div>
    </section>
  );
}
window.ActiveWorkstreams = ActiveWorkstreams;
