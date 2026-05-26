// Strategic Conversations — qualified intake. Light institutional.
const CONV = [
  { num: '01', label: 'Infrastructure & Energy', sub: 'DGE&I · BTM · dispatchable generation · data centers' },
  { num: '02', label: 'Capital Partners',        sub: 'LPs · family offices · co-investment · project debt' },
  { num: '03', label: 'Compute Counterparties',  sub: 'Hyperscale offtake · GPU cloud · enterprise AI' },
  { num: '04', label: 'Strategic Collaborators', sub: 'Standards bodies · advisors · operator partners' },
];

function StrategicConversations() {
  return (
    <section className="alt" id="contact">
      <div className="wrap">
        <header className="section-head">
          <div className="num">§ 06</div>
          <div className="eyebrow">Oak Ridge Management · Strategic Conversations</div>
          <h2>Request a Strategic Conversation</h2>
          <p className="descriptor">
            ORM engages selectively with capital partners, infrastructure operators,
            strategic counterparties, advisors, and platform collaborators where
            there is clear alignment around complex market formation, capital
            architecture, or operating strategy.
          </p>
        </header>

        <div className="conv-grid">
          {CONV.map(c => (
            <div key={c.num} className="conv-card">
              <div className="num">{c.num}</div>
              <div className="label">{c.label}</div>
              <div className="sub">{c.sub}</div>
            </div>
          ))}
        </div>

        <div className="conv-cta-row">
          <a href="mailto:conversations@oakridgemanagement.net" className="conv-cta">conversations@oakridgemanagement.net →</a>
          <span className="conv-note">By invitation or qualified introduction.</span>
          <a href="#access" className="btn btn-outline-navy" style={{ marginLeft: 'auto' }}>Partner Access →</a>
        </div>
      </div>
    </section>
  );
}
window.StrategicConversations = StrategicConversations;
