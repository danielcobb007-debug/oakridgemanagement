// CEH formula bar. Cyan left accent. Mono equation with c1/c2/c3 color codes.
function FormulaBar() {
  return (
    <div className="formula-bar">
      <div className="f-label">CEH™ Formula</div>
      <div className="f-eq">
        <span className="c1">CEH™</span> = ( <span className="c2">TDP_W</span> × Units × Util% × PUE ) ÷ 1,000 ÷ <span className="c3">Output_Units/hr</span>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <span className="c1">CEH™ Cost</span> = CEH™ × <span className="c2">$/kWh (any energy source)</span>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <span className="c1">CEH™ Carbon</span> = CEH™ × <span className="c3">kg CO₂/kWh</span>
      </div>
      <div className="f-cite">
        CEH™ is a trademark of Oak Ridge Management. v1.0 first published April 21, 2026.
        Full derivation: <a href="#methodology" style={{ color: 'var(--a1)' }}>Methodology ↗</a>
      </div>
    </div>
  );
}
window.FormulaBar = FormulaBar;
