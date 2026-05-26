// CEH Index ticker — Bloomberg-style horizontal scroll. Pause on hover.
const TICKER_ROWS = [
  { hw: 'NVIDIA B200',     grade: 'S', gradeClass: 'gs', rate: '1.07×10⁻¹⁰ kWh/tok', cost: '$0.009/M grid · $0.004/M BTM' },
  { hw: 'NVIDIA H200',     grade: 'A', gradeClass: 'ga', rate: '2.21×10⁻¹⁰ kWh/tok', cost: '$0.019/M grid · $0.008/M BTM' },
  { hw: 'Google TPU v4',   grade: 'A', gradeClass: 'ga', rate: '2.63×10⁻¹⁰ kWh/tok', cost: '$0.022/M grid · $0.009/M BTM' },
  { hw: 'NVIDIA H100 SXM', grade: 'A', gradeClass: 'ga', rate: '3.18×10⁻¹⁰ kWh/tok', cost: '$0.027/M grid · $0.011/M BTM' },
  { hw: 'NVIDIA L40S',     grade: 'B', gradeClass: 'gb', rate: '5.43×10⁻¹⁰ kWh/tok', cost: '$0.046/M grid · $0.019/M BTM' },
  { hw: 'AMD MI300X',      grade: 'B', gradeClass: 'gb', rate: '6.11×10⁻¹⁰ kWh/tok', cost: '$0.052/M grid · $0.021/M BTM' },
  { hw: 'NVIDIA A100 SXM', grade: 'C', gradeClass: 'gc', rate: '8.92×10⁻¹⁰ kWh/tok', cost: '$0.076/M grid · $0.031/M BTM' },
];

function Ticker() {
  // Duplicate the row set for seamless loop
  const rows = [...TICKER_ROWS, ...TICKER_ROWS];
  return (
    <div className="ceh-ticker">
      <div className="ticker-label">CEH™ Index</div>
      <div className="ticker-scroll">
        <div className="ticker-track">
          {rows.map((r, i) => (
            <span className="t-item" key={i}>
              <span className="t-hw">{r.hw}</span>
              <span className="t-div">·</span>
              <span className={`t-grade ${r.gradeClass}`}>{r.grade}</span>
              <span className="t-div">·</span>
              <span className="t-rate">{r.rate}</span>
              <span className="t-div">·</span>
              <span className="t-cost">{r.cost}</span>
            </span>
          ))}
        </div>
      </div>
    </div>
  );
}
window.Ticker = Ticker;
