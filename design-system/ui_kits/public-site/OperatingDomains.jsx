// Four Operating Domains — light institutional 2x2, single-accent treatment.
const DOMAINS = [
  { num: '01', title: 'Platform Strategy',     meta: 'DGE&I · Energy Infrastructure · Compute',
    desc: "Platform formation across energy infrastructure, behind-the-meter generation, data centers, and AI compute.",
    cta: 'View Platform Strategy' },
  { num: '02', title: 'Market Standards & IP', meta: 'CEH™ · Underwriting · Index Development',
    desc: "Development of measurement frameworks and intellectual property for compute-energy efficiency, infrastructure underwriting, and market standardization. CEH™ is a developing framework — methodology preview, subject to validation.",
    cta: 'About CEH™ (in development)' },
  { num: '03', title: 'Strategic Capital',     meta: 'Private Investments · SPVs · Compute Exposure',
    desc: "Direct private investments, SPV structures, capital partnerships, and strategic exposure to infrastructure-adjacent compute opportunities.",
    cta: 'View Capital Themes' },
  { num: '04', title: 'Operating Intelligence', meta: 'Advisory · Command Layer · Transaction Framing',
    desc: "Capital architecture, commercial strategy, partner alignment, diligence framing, and decision systems for complex platform-building work.",
    cta: 'Explore Operating Intelligence' },
];

function OperatingDomains() {
  return (
    <section id="domains">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 01</div>
          <div className="eyebrow">Oak Ridge Management · Operating Architecture</div>
          <h2>Operating Domains</h2>
          <p className="descriptor">
            Oak Ridge Management coordinates strategy, capital architecture, market
            standards, and operating intelligence across markets where infrastructure,
            compute, energy, and private capital are converging.
          </p>
          <div className="meta-line">DGE&amp;I &nbsp;/&nbsp; CEH™ &nbsp;/&nbsp; QumulusAI &nbsp;/&nbsp; SPV Strategy &nbsp;/&nbsp; Advisory</div>
        </header>

        <div className="domains-grid">
          {DOMAINS.map(d => (
            <article key={d.num} className="domain-card">
              <span className="num">{d.num}</span>
              <h3>{d.title}</h3>
              <div className="meta">{d.meta}</div>
              <p className="desc">{d.desc}</p>
              <span className="cta">{d.cta}</span>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
window.OperatingDomains = OperatingDomains;
