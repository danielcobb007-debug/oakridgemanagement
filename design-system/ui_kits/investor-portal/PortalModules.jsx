// Seven portal modules — document-card layout with metadata tags and counts.
const MODULES = [
  { num: '01', tag: 'restricted', tagLabel: 'Restricted', title: 'Platform Overview', sub: 'DGE&I thesis · HoldCo architecture',
    desc: "Platform thesis, HoldCo / subsidiary architecture, current rollout strategy, and the value-creation logic across infrastructure, power, and demand.",
    docs: '8 documents' },
  { num: '02', tag: 'restricted', tagLabel: 'Restricted', title: 'Site Portfolio', sub: 'St. Paul · Savannah · Bowman · Montgomery',
    desc: "Active and pipeline sites, with adaptive-reuse versus greenfield posture, capacity, and current diligence status.",
    docs: '4 sites · 12 documents' },
  { num: '03', tag: 'nda',        tagLabel: 'NDA',        title: 'Power Block Specifications', sub: 'BTM · fuel cell · turbine · gas',
    desc: "Behind-the-meter generation options, fuel cell / turbine configurations, gas infrastructure, transformer upgrade pathways, MW phasing, and activation timelines.",
    docs: '6 specs · 3 phasing diagrams' },
  { num: '04', tag: 'restricted', tagLabel: 'Restricted', title: 'Capital Architecture', sub: 'HoldCo / ProjectCo · SPV · waterfall',
    desc: "HoldCo / ProjectCo structure, infrastructure capital, real-estate capital, compute / demand-side JV capital, SPV structures, and waterfall / promote concepts.",
    docs: '5 capital memos' },
  { num: '05', tag: 'nda',        tagLabel: 'NDA',        title: 'Commercial Demand', sub: 'Hyperscale · Neocloud · Enterprise AI',
    desc: "Hyperscale offtake, neocloud and GPU-cluster demand, enterprise AI compute, partner relationships, and tenant qualification status.",
    docs: '9 demand briefs' },
  { num: '06', tag: 'confidential', tagLabel: 'Confidential', title: 'Legal & Governance', sub: 'NDA · Non-circumvention · Advisor access',
    desc: "NDA framework, non-circumvention covenants, advisor access protocols, documentation control, and data-room permissioning.",
    docs: '4 governance instruments' },
  { num: '07', tag: 'restricted', tagLabel: 'Restricted', title: 'Data Room', sub: 'Decks · memos · models · engineering',
    desc: "Strategic decks, memoranda, site files, diligence packets, engineering documents, and financial models — all access-controlled and audit-logged.",
    docs: '42 documents · 6 folders' },
];

function PortalModules() {
  return (
    <section className="portal-section" id="overview">
      <div className="wrap-wide">
        <header className="portal-section-hdr">
          <div className="psh-left">
            <span className="psh-eyebrow">Restricted Partner Access · DGE&amp;I Workstream</span>
            <h2 className="psh-title">Portal Modules</h2>
          </div>
          <span className="psh-meta">7 modules · Diligence v0.9 · APR 2026</span>
        </header>
        <div className="modules-grid">
          {MODULES.map(m => (
            <article key={m.num} className="module-card">
              <div className="module-meta">
                <span className={`module-tag tag-${m.tag}`}>{m.tagLabel}</span>
                <span className="module-num">§ {m.num}</span>
              </div>
              <h3 className="module-title">{m.title}</h3>
              <div className="module-sub">{m.sub}</div>
              <p className="module-desc">{m.desc}</p>
              <div className="module-foot">
                <span className="module-doc-count">{m.docs}</span>
                <a href="#open">Open module →</a>
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
window.PortalModules = PortalModules;
