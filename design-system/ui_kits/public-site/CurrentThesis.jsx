// Current Thesis — single load-bearing statement, editorial serif emphasis.
function CurrentThesis() {
  return (
    <section className="alt" id="thesis">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 02</div>
          <div className="eyebrow">Current Thesis</div>
          <h2>Why ORM exists</h2>
          <p className="descriptor">
            A short statement of what ORM is built to do, and where it engages.
          </p>
        </header>

        <p className="thesis-statement">
          ORM operates where fragmented markets need
          <em> structure</em>, <em>measurement</em>, <em>capital alignment</em>,
          and <em>execution discipline</em> — and where principal-led platforms can be built
          with durable institutional credibility.
        </p>

        <div className="thesis-foot">
          <span>The four needs map to the four operating domains.</span>
          <span className="sep">·</span>
          <span>Each ORM workstream serves at least one.</span>
        </div>
      </div>
    </section>
  );
}
window.CurrentThesis = CurrentThesis;
