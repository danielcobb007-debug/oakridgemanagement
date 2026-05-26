// Six-cell S-F grade scale strip.
const GRADES = [
  { letter: 'S', word: 'Exceptional',  range: '< 2.0 × 10⁻¹⁰' },
  { letter: 'A', word: 'Excellent',    range: '2.0 – 4.0 × 10⁻¹⁰' },
  { letter: 'B', word: 'Good',         range: '4.0 – 8.0 × 10⁻¹⁰' },
  { letter: 'C', word: 'Marginal',     range: '8.0 – 15.0 × 10⁻¹⁰' },
  { letter: 'D', word: 'Poor',         range: '15.0 – 30.0 × 10⁻¹⁰' },
  { letter: 'F', word: 'Unacceptable', range: '> 30.0 × 10⁻¹⁰' },
];

function GradeStrip() {
  return (
    <div className="grade-strip">
      {GRADES.map(g => (
        <div key={g.letter} className={`grade-cell gs-${g.letter}`}>
          <div className="grade-letter">{g.letter}</div>
          <div className="grade-word">{g.word}</div>
          <div className="grade-threshold">{g.range}</div>
        </div>
      ))}
    </div>
  );
}
window.GradeStrip = GradeStrip;
