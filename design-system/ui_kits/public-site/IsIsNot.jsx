// Signature "What it is / What it is not" rhetorical panel. Green + / Red −.
const IS_ROWS = [
  "An auditable, reproducible standard unit: kWh of energy consumed per output unit of compute work",
  "Energy-agnostic — the formula applies identically to grid power, BTM generation, nuclear, or any source",
  "Workload-portable across LLM inference, model training, HPC simulation, and rendering via Compute Output Unit (COU) definitions",
  "A published, versioned, dated standard — v1.0 first published April 21, 2026 by Oak Ridge Management",
  "Open for independent replication, co-publication, and third-party validation",
];

const ISNOT_ROWS = [
  "Not a product, tool, or service — CEH™ is a measurement standard, like PUE for facilities or MLPerf for ML performance",
  'Not specific to "renewable" or "solar" compute — CEH™ is energy-source agnostic by design',
  "Not an investment product — Oak Ridge Management's capital activities are separate from and do not constitute the CEH™ standard",
  "Not a closed or proprietary standard — methodology is publicly disclosed and open to challenge and replication",
  "Not finalized — the standard invites industry comment, co-publication, and formal submission to recognized standards bodies",
];

function IsIsNot() {
  return (
    <section className="isnot-section">
      <div className="wrap">
        <div className="section-hdr">Understanding CEH™</div>
        <div className="isnot-grid">
          <div className="isnot-panel is">
            <h3>What CEH™ Is</h3>
            {IS_ROWS.map((r, i) => (
              <div className="isnot-row" key={i}><span className="isnot-icon">+</span><span>{r}</span></div>
            ))}
          </div>
          <div className="isnot-panel isnot">
            <h3>What CEH™ Is Not</h3>
            {ISNOT_ROWS.map((r, i) => (
              <div className="isnot-row" key={i}><span className="isnot-icon">−</span><span>{r}</span></div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
window.IsIsNot = IsIsNot;
