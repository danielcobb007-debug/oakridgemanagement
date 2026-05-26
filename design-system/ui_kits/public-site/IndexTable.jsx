// CEH Index — top-5 hardware preview table.
const INDEX_ROWS = [
  { rank: 1, rankClass: 'rank-gold',   name: 'NVIDIA B200',     gen: 'Blackwell · 2025',     badge: 'NEW', rate: '1.07 × 10⁻¹⁰', rateClass: 'green', grid: '$0.009', btm: '$0.004', grade: 'S' },
  { rank: 2, rankClass: 'rank-silver', name: 'NVIDIA H200',     gen: 'Hopper · 2024',        badge: 'NEW', rate: '2.21 × 10⁻¹⁰', rateClass: 'cyan',  grid: '$0.019', btm: '$0.008', grade: 'A' },
  { rank: 3, rankClass: 'rank-bronze', name: 'Google TPU v4',   gen: 'Google · 2023',        badge: null,  rate: '2.63 × 10⁻¹⁰', rateClass: 'cyan',  grid: '$0.022', btm: '$0.009', grade: 'A' },
  { rank: 4, rankClass: '',            name: 'NVIDIA H100 SXM', gen: 'Hopper · 2023',        badge: null,  rate: '3.18 × 10⁻¹⁰', rateClass: 'cyan',  grid: '$0.027', btm: '$0.011', grade: 'A' },
  { rank: 5, rankClass: '',            name: 'NVIDIA L40S',     gen: 'Ada Lovelace · 2023',  badge: 'BTM', rate: '5.43 × 10⁻¹⁰', rateClass: 'blue', grid: '$0.046', btm: '$0.019', grade: 'B' },
];

function IndexTable() {
  return (
    <div className="table-wrap">
      <table>
        <thead>
          <tr>
            <th>#</th>
            <th>Hardware</th>
            <th className="r">CEH Rate (kWh/token)</th>
            <th className="r">Grid $/M Tokens</th>
            <th className="r">BTM $/M Tokens</th>
            <th>Grade</th>
          </tr>
        </thead>
        <tbody>
          {INDEX_ROWS.map(r => (
            <tr key={r.rank}>
              <td className={r.rankClass} style={{ fontWeight: 700 }}>{r.rank}</td>
              <td>
                <span className="chip-name">{r.name}</span>
                <span className="chip-gen">{r.gen}{' '}{r.badge && <span className={`badge-tag ${r.badge === 'NEW' ? 'badge-new' : 'badge-btm'}`}>{r.badge === 'BTM' ? 'BTM ADVANTAGE' : r.badge}</span>}</span>
              </td>
              <td className={`r ${r.rateClass === 'green' ? 'green' : r.rateClass === 'cyan' ? 'cyan' : ''}`} style={r.rateClass === 'blue' ? { color: '#4fa3ff' } : {}}>{r.rate}</td>
              <td className="r">{r.grid}</td>
              <td className="r green">{r.btm}</td>
              <td><span className={`grade grade-${r.grade}`}>{r.grade}</span></td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
window.IndexTable = IndexTable;
