// Three audience tracks: Operators / Capital / Research.
const TRACKS = [
  { tone: 'cyan',   num: '01 · Operators', title: 'Adopt the Standard',
    audience: 'Data center operators · Neo-clouds · BTM developers',
    desc: "Publish a CEH™-certified benchmark on your own infrastructure. Differentiate on energy efficiency — not just $/GPU-hr. Get listed in the CEH™ Index with your certification mark.",
    cta: 'Apply for certification →', href: '#operators' },
  { tone: 'orange', num: '02 · Capital', title: 'Invest in the Infrastructure',
    audience: 'Infrastructure LPs · Family offices · Strategic capital',
    desc: "DGE&I is the first commercial BTM compute infrastructure deployment built on CEH™ measurement. 300 MW anchor offtake. Structural energy cost advantage. Qualified capital partners only.",
    cta: 'Request the LP package →', href: '#capital' },
  { tone: 'green',  num: '03 · Research', title: 'Co-Publish the Research',
    audience: 'Standards bodies · Academic labs · Industry analysts',
    desc: "CEH™ methodology is open, versioned, and dated. Independent replication, co-publication, and standards body submission — MLCommons, Green Grid, IEEE, and university partners invited.",
    cta: 'Open a conversation →', href: '#research' },
];

function TrackGrid() {
  return (
    <section className="tracks">
      <div className="wrap">
        <div className="section-hdr">How to Engage</div>
        <div className="track-grid">
          {TRACKS.map(t => (
            <a key={t.tone} href={t.href} className={`track-card ${t.tone}`}>
              <div className="track-accent"></div>
              <div className="track-num">{t.num}</div>
              <div className="track-title">{t.title}</div>
              <div className="track-audience">{t.audience}</div>
              <p className="track-desc">{t.desc}</p>
              <span className="track-cta">{t.cta}</span>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}
window.TrackGrid = TrackGrid;
