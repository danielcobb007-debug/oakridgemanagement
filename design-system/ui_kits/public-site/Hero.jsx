// ORM Hero — institutional, restrained, parent-platform positioning.
function Hero() {
  return (
    <section className="hero" id="top">
      <div className="wrap">
        <div className="hero-grid">
          <div>
            <div className="hero-eyebrow">Oak Ridge Management · Private Operating Platform</div>
            <h1 className="hero-headline">
              Platform strategy, <em>capital architecture</em>, and operating intelligence for complex markets.
            </h1>
            <p className="hero-body">
              Oak Ridge Management is a private operating and strategy platform
              coordinating platform architecture, capital formation, market standards,
              strategic investments, and operating intelligence across infrastructure,
              compute, energy, and complex private markets.
            </p>
            <div className="hero-actions">
              <a href="#domains" className="btn btn-navy">Explore Operating Domains →</a>
              <a href="#contact" className="btn btn-outline-bronze">Request a Strategic Conversation</a>
            </div>
          </div>

          <aside className="hero-memo" aria-label="Firm facts">
            <div className="memo-hdr">Firm · At a Glance</div>
            <div className="memo-row"><span className="k">Form</span><span className="v">Oak Ridge Management, LLC</span></div>
            <div className="memo-row"><span className="k">Based</span><span className="v">Atlanta, Georgia</span></div>
            <div className="memo-row"><span className="k">Founded</span><span className="v">2025</span></div>
            <div className="memo-row"><span className="k">Posture</span><span className="v">Principal-led · Private</span></div>
            <div className="memo-row"><span className="k">Coverage</span><span className="v serif">Infrastructure · Compute · Energy · Complex private markets</span></div>
            <div className="memo-row"><span className="k">Engagement</span><span className="v">By relationship or qualified introduction</span></div>
          </aside>
        </div>
      </div>
    </section>
  );
}
window.Hero = Hero;
