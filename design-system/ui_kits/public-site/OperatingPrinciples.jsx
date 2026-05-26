// Operating Principles — five maxims, editorial serif.
const PRINCIPLES = [
  { n: '01', text: 'Structure before scale.' },
  { n: '02', text: 'Measurement before management.' },
  { n: '03', text: 'Capital follows clarity.' },
  { n: '04', text: 'Platforms beat projects.' },
  { n: '05', text: 'Trust is built through execution.' },
];

function OperatingPrinciples() {
  return (
    <section className="alt" id="principles">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 04</div>
          <div className="eyebrow">Operating Principles</div>
          <h2>How ORM operates</h2>
          <p className="descriptor">
            Five principles that shape how ORM picks workstreams, structures capital,
            and engages partners.
          </p>
        </header>

        <div className="principles-list">
          {PRINCIPLES.map(p => (
            <div className="principle" key={p.n}>
              <span className="p-num">{p.n}</span>
              <span className="p-text">{p.text}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
window.OperatingPrinciples = OperatingPrinciples;
