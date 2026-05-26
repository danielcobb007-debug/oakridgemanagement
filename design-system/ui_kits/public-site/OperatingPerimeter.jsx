// "Defining the Operating Perimeter" — what ORM is / is not. Institutional.
const ORM_IS = [
  { h: 'A private operating and strategy platform',
    d: 'The parent coordination layer for platform architecture, capital formation, market standards, and strategic workstreams.' },
  { h: 'A principal-led platform',
    d: 'Built around selective relationships, proprietary thesis development, and direct involvement in complex market formation.' },
  { h: 'A developer and sponsor of standards and IP',
    d: 'Developer and sponsor of CEH™ — a draft measurement framework for compute-energy underwriting. Methodology preview, subject to validation; not a certified public index.' },
  { h: 'A coordinator of strategic platform relationships',
    d: 'Aligned with DGE&I and other active workstreams where infrastructure, compute, energy, and capital converge.' },
];

const ORM_ISNOT = [
  { h: 'Not a fund or registered investment adviser',
    d: 'ORM does not present itself as a public investment vehicle or provide investment advice through this website.' },
  { h: 'Not a single-product company',
    d: 'CEH™ is one workstream within ORM — a developing methodology framework, not the entirety of the platform and not an externally adopted benchmark unless separately established.' },
  { h: 'Not an open-engagement consultancy',
    d: 'ORM engages selectively by relationship, alignment, and qualified strategic relevance.' },
  { h: 'Not a public capital-raising surface',
    d: 'This website is informational. Confidential materials, portal access, and transaction discussions occur off-site under appropriate diligence and approval controls.' },
];

function OperatingPerimeter() {
  return (
    <section id="perimeter">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 07</div>
          <div className="eyebrow">Oak Ridge Management · Platform Boundaries</div>
          <h2>Defining the Operating Perimeter</h2>
          <p className="descriptor">
            ORM exists to coordinate platform strategy, capital architecture, market
            standards, and operating intelligence across complex private-market
            workstreams. It is intentionally structured as a principal-led operating
            platform, not a public product company or open advisory shop.
          </p>
        </header>

        <div className="perimeter-grid">
          <div className="perimeter-col is">
            <div className="perimeter-label">Oak Ridge Management Is</div>
            {ORM_IS.map((x, i) => (
              <div className="perimeter-item" key={i}>
                <span className="marker">§</span>
                <div>
                  <div className="item-h">{x.h}</div>
                  <p className="item-d">{x.d}</p>
                </div>
              </div>
            ))}
          </div>
          <div className="perimeter-col isnot">
            <div className="perimeter-label">Oak Ridge Management Is Not</div>
            {ORM_ISNOT.map((x, i) => (
              <div className="perimeter-item" key={i}>
                <span className="marker">—</span>
                <div>
                  <div className="item-h">{x.h}</div>
                  <p className="item-d">{x.d}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
window.OperatingPerimeter = OperatingPerimeter;
