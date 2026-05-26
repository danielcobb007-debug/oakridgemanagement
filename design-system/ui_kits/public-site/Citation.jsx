// Formal citation block with gold left accent.
function Citation() {
  return (
    <section className="citation-section">
      <div className="wrap">
        <div className="section-hdr gold">Formal Citation</div>
        <div className="citation-block">
          <span className="cite-label">How to cite CEH™ v1.0</span>
          Cobb, D. (2026). <em>CEH™: A Proposed Standard Unit of Measurement for Compute Energy Intensity.</em>{' '}
          DGE&amp;I / Oak Ridge Management. First published April 21, 2026. arXiv: [pending submission].{' '}
          Available at: <a href="#standard" style={{ color: 'var(--a1)' }}>oakridgemanagement.net/standard</a>
        </div>
      </div>
    </section>
  );
}
window.Citation = Citation;
