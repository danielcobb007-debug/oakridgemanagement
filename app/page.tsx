export default function Home() {
  return (
    <main className="min-h-screen bg-zinc-950">
      {/* NAV */}
      <nav className="fixed top-0 left-0 right-0 z-50 border-b border-zinc-800/50 bg-zinc-950/80 backdrop-blur-md">
        <div className="mx-auto max-w-7xl px-6 py-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-7 h-7 bg-amber-400 rounded-sm flex items-center justify-center">
              <span className="text-zinc-950 font-black text-xs">ORM</span>
            </div>
            <span className="font-semibold text-zinc-100 tracking-tight">Oak Ridge Management</span>
          </div>
          <div className="hidden md:flex items-center gap-8 text-sm text-zinc-400">
            <a href="#about" className="hover:text-amber-400 transition-colors">About</a>
            <a href="#platforms" className="hover:text-amber-400 transition-colors">Platforms</a>
            <a href="#contact" className="hover:text-amber-400 transition-colors">Contact</a>
          </div>
          <a
            href="#contact"
            className="text-sm font-medium bg-amber-400 text-zinc-950 px-4 py-2 rounded hover:bg-amber-300 transition-colors"
          >
            Qualified Access
          </a>
        </div>
      </nav>

      {/* HERO */}
      <section className="pt-32 pb-24 px-6">
        <div className="mx-auto max-w-7xl">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 mb-6 px-3 py-1.5 rounded-full border border-amber-400/20 bg-amber-400/5">
              <div className="w-1.5 h-1.5 rounded-full bg-amber-400 animate-pulse" />
              <span className="text-amber-400 text-xs font-medium tracking-wide uppercase">Principal-Led Private Operating Platform</span>
            </div>
            <h1 className="text-5xl md:text-7xl font-black tracking-tight text-zinc-50 leading-[1.05] mb-6">
              Capital Architecture.<br />
              <span className="text-amber-400">Principal-Led.</span>
            </h1>
            <p className="text-lg md:text-xl text-zinc-400 leading-relaxed max-w-2xl mb-10">
              Oak Ridge Management is a Georgia-based holding company and capital allocator organized to coordinate strategic platforms across infrastructure investment, intellectual property origination, and AI-adjacent capital activity.
            </p>
            <div className="flex flex-col sm:flex-row gap-4">
              <a
                href="#platforms"
                className="inline-flex items-center justify-center gap-2 bg-amber-400 text-zinc-950 font-semibold px-8 py-4 rounded hover:bg-amber-300 transition-colors"
              >
                Active Platforms
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 8l4 4m0 0l-4 4m4-4H3" />
                </svg>
              </a>
              <a
                href="#about"
                className="inline-flex items-center justify-center gap-2 border border-zinc-700 text-zinc-300 font-semibold px-8 py-4 rounded hover:border-zinc-500 hover:text-zinc-100 transition-colors"
              >
                About ORM
              </a>
            </div>
          </div>

          {/* Descriptor tiles */}
          <div className="mt-20 grid grid-cols-2 md:grid-cols-4 gap-px bg-zinc-800/50 rounded-xl overflow-hidden border border-zinc-800">
            {[
              { label: "IP Origination & Stewardship", sub: "CEH™ methodology and standards governance infrastructure" },
              { label: "Infrastructure Investment", sub: "Behind-the-meter compute and power asset deployment" },
              { label: "Capital Architecture", sub: "Principal-led HoldCo and entity structuring" },
              { label: "Strategic Platform Coordination", sub: "Affiliated workstreams and operating relationships" },
            ].map((item) => (
              <div key={item.label} className="bg-zinc-900 px-6 py-8">
                <div className="w-2 h-2 rounded-full bg-amber-400 mb-4" />
                <div className="text-sm font-semibold text-zinc-200 mb-1.5">{item.label}</div>
                <div className="text-xs text-zinc-500 leading-relaxed">{item.sub}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ABOUT */}
      <section id="about" className="py-24 px-6 border-t border-zinc-800/50">
        <div className="mx-auto max-w-7xl">
          <div className="grid md:grid-cols-2 gap-16 items-center">
            <div>
              <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">About</p>
              <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight mb-6 leading-tight">
                Georgia-Based HoldCo<br />and Capital Allocator
              </h2>
              <p className="text-zinc-400 leading-relaxed mb-4">
                Oak Ridge Management, LLC (&ldquo;ORM&rdquo;) is a Georgia-based private holding and operating
                platform led by Daniel Cobb.
              </p>
              <p className="text-zinc-400 leading-relaxed mb-4">
                ORM serves as the parent architecture for select strategic workstreams across infrastructure,
                compute, energy, intellectual property, capital formation, and operating intelligence. The company
                coordinates platform strategy, commercial architecture, IP origination, affiliated relationships,
                and private capital activity across markets where energy, infrastructure, compute demand, and
                capital formation are converging.
              </p>
              <p className="text-zinc-400 leading-relaxed">
                ORM is the originator and steward of the CEH™ methodology framework and maintains strategic
                platform relationships with affiliated infrastructure and compute-related ventures, including
                DG Energy &amp; Infrastructure. ORM does not operate as a public fund, registered investment
                adviser, or open consulting platform.
              </p>
            </div>
            <div className="grid grid-cols-2 gap-4">
              {[
                {
                  icon: "⚙️",
                  title: "HoldCo Architecture",
                  desc: "Institutional parent entity governing intercompany relationships and capital allocation authority across affiliated ventures and platforms.",
                },
                {
                  icon: "📐",
                  title: "IP Origination",
                  desc: "Originator and registered trademark holder of the CEH™ standard and associated standards governance and research infrastructure.",
                },
                {
                  icon: "🔒",
                  title: "Principal-Led Structure",
                  desc: "Private operating platform under direct principal control. Not a fund, not a registered investment adviser, not a public offering vehicle.",
                },
                {
                  icon: "⚡",
                  title: "Platform Coordination",
                  desc: "Strategic coordination of affiliated workstreams spanning infrastructure development, compute-energy research, and capital activity.",
                },
              ].map((item) => (
                <div
                  key={item.title}
                  className="bg-zinc-900 border border-zinc-800 rounded-xl p-5 hover:border-amber-400/30 transition-colors"
                >
                  <div className="text-2xl mb-3">{item.icon}</div>
                  <div className="font-semibold text-zinc-100 text-sm mb-2">{item.title}</div>
                  <div className="text-zinc-500 text-xs leading-relaxed">{item.desc}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ACTIVE PLATFORMS & WORKSTREAMS */}
      <section id="platforms" className="py-24 px-6 border-t border-zinc-800/50 bg-zinc-900/30">
        <div className="mx-auto max-w-7xl">
          <div className="mb-16">
            <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">
              Active Platforms &amp; Workstreams
            </p>
            <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight max-w-2xl">
              Coordinated Through ORM
            </h2>
            <p className="text-zinc-500 text-sm mt-4 max-w-xl leading-relaxed">
              The following platforms and workstreams operate under or in affiliation with ORM. Each represents
              a distinct strategic function within the broader operating architecture.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-6">
            {/* CEH Methodology Framework */}
            <div className="bg-zinc-900 border border-zinc-800 rounded-xl p-8 hover:border-amber-400/20 transition-colors flex flex-col">
              <div className="flex items-start justify-between mb-6">
                <span className="text-xs font-medium px-2.5 py-1 rounded-full bg-amber-400/10 text-amber-400">
                  IP Origination
                </span>
                <span className="text-zinc-600 text-xs">ORM Originated</span>
              </div>
              <h3 className="font-bold text-zinc-100 text-xl mb-3">CEH™ Methodology Framework</h3>
              <p className="text-zinc-400 text-sm leading-relaxed mb-4 flex-1">
                A developing compute-energy measurement concept originated and stewarded by ORM, intended to
                evaluate the relationship between compute output, energy consumption, infrastructure efficiency,
                cost, and related market inputs. First published April 21, 2026, and subject to ongoing
                methodology development.
              </p>
              <p className="text-zinc-500 text-xs leading-relaxed italic border-t border-zinc-800 pt-4">
                Subject to ongoing validation and methodology development. Not a certified public index or
                externally adopted benchmark standard.
              </p>
              <a
                href="https://cehstandard.com"
                target="_blank"
                rel="noopener noreferrer"
                className="mt-4 inline-flex items-center gap-1.5 text-amber-400 text-xs font-medium hover:text-amber-300 transition-colors"
              >
                cehstandard.com
                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
              </a>
            </div>

            {/* CEH Infrastructure Index */}
            <div className="bg-zinc-900 border border-zinc-800 rounded-xl p-8 hover:border-amber-400/20 transition-colors flex flex-col">
              <div className="flex items-start justify-between mb-6">
                <span className="text-xs font-medium px-2.5 py-1 rounded-full bg-blue-400/10 text-blue-400">
                  Research Platform
                </span>
                <span className="text-zinc-600 text-xs">ORM Governed</span>
              </div>
              <h3 className="font-bold text-zinc-100 text-xl mb-3">CEH Infrastructure Index™</h3>
              <p className="text-zinc-400 text-sm leading-relaxed mb-4 flex-1">
                A research and publication platform for compute-energy infrastructure, benchmark concepts,
                market structure analysis, and methodology development. Operates as an intelligence and
                research platform for qualified institutional readers and strategic stakeholders.
              </p>
              <p className="text-zinc-500 text-xs leading-relaxed italic border-t border-zinc-800 pt-4">
                A research and editorial platform. Not a finalized exchange-traded index or certified
                external benchmark standard.
              </p>
              <a
                href="https://cehinfrastructureindex.com"
                target="_blank"
                rel="noopener noreferrer"
                className="mt-4 inline-flex items-center gap-1.5 text-blue-400 text-xs font-medium hover:text-blue-300 transition-colors"
              >
                cehinfrastructureindex.com
                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
              </a>
            </div>

            {/* DG Energy & Infrastructure */}
            <div className="bg-zinc-900 border border-zinc-800 rounded-xl p-8 hover:border-amber-400/20 transition-colors flex flex-col">
              <div className="flex items-start justify-between mb-6">
                <span className="text-xs font-medium px-2.5 py-1 rounded-full bg-green-400/10 text-green-400">
                  Infrastructure
                </span>
                <span className="text-zinc-600 text-xs">Affiliated Platform</span>
              </div>
              <h3 className="font-bold text-zinc-100 text-xl mb-3">DG Energy &amp; Infrastructure</h3>
              <p className="text-zinc-400 text-sm leading-relaxed mb-4 flex-1">
                A strategic infrastructure platform relationship focused on behind-the-meter power, adaptive
                infrastructure deployment, and compute-oriented site development. DGE&amp;I operates as an
                affiliated infrastructure development platform coordinated through ORM&apos;s capital and
                strategic architecture.
              </p>
              <p className="text-zinc-500 text-xs leading-relaxed italic border-t border-zinc-800 pt-4">
                An affiliated platform relationship. Qualified infrastructure inquiries available on a
                confidential basis.
              </p>
            </div>

            {/* Strategic Compute & Capital Exposure */}
            <div className="bg-zinc-900 border border-zinc-800 rounded-xl p-8 hover:border-amber-400/20 transition-colors flex flex-col">
              <div className="flex items-start justify-between mb-6">
                <span className="text-xs font-medium px-2.5 py-1 rounded-full bg-zinc-700 text-zinc-300">
                  Capital Activity
                </span>
                <span className="text-zinc-600 text-xs">Principal-Led</span>
              </div>
              <h3 className="font-bold text-zinc-100 text-xl mb-3">Strategic Compute &amp; Capital Exposure</h3>
              <p className="text-zinc-400 text-sm leading-relaxed mb-4 flex-1">
                Private investment, SPV, and AI-infrastructure-adjacent capital activity coordinated through
                ORM&apos;s principal-led structure. Focused on early-stage positioning, infrastructure adjacency,
                and long-term capital architecture across compute and power asset classes.
              </p>
              <p className="text-zinc-500 text-xs leading-relaxed italic border-t border-zinc-800 pt-4">
                Private activity coordinated on a principal basis. Not a public offering. Qualified partner
                access on a confidential review basis only.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* MARKET CONTEXT QUOTE */}
      <section className="py-20 px-6 border-t border-zinc-800/50 bg-zinc-950">
        <div className="mx-auto max-w-4xl text-center">
          <p className="text-zinc-600 text-xs font-medium tracking-widest uppercase mb-8">Market Context</p>
          <blockquote className="text-2xl md:text-3xl font-light text-zinc-300 leading-relaxed italic mb-6">
            &ldquo;The demand for computing power is so large that a new asset class will spring up.&rdquo;
          </blockquote>
          <p className="text-zinc-500 text-sm mb-6">
            — Larry Fink, Chairman &amp; CEO, BlackRock<br />
            <span className="text-zinc-600 text-xs">Bloomberg / Milken Institute, May 7, 2026</span>
          </p>
          <p className="text-zinc-700 text-xs max-w-xl mx-auto leading-relaxed">
            Quote provided for context only. Larry Fink and BlackRock have not reviewed, endorsed, or affiliated
            with this organization or its products.
          </p>
        </div>
      </section>

      {/* CONTACT */}
      <section id="contact" className="py-24 px-6 border-t border-zinc-800/50">
        <div className="mx-auto max-w-7xl">
          <div className="max-w-2xl mx-auto text-center">
            <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">Contact</p>
            <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight mb-6">
              Qualified Partner Access
            </h2>
            <p className="text-zinc-400 text-lg mb-4 leading-relaxed">
              ORM engages with a select group of qualified partners, institutional counterparties, and
              strategic collaborators. Inquiries are reviewed on a confidential basis.
            </p>
            <p className="text-zinc-500 text-sm mb-10 leading-relaxed">
              Relevant inquiries may include infrastructure co-development, methodology collaboration,
              capital architecture discussion, or IP licensing. ORM does not accept unsolicited
              investment solicitations.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="mailto:dpc@oakridgemanagement.net"
                className="inline-flex items-center justify-center gap-2 bg-amber-400 text-zinc-950 font-semibold px-8 py-4 rounded hover:bg-amber-300 transition-colors"
              >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
                dpc@oakridgemanagement.net
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* FOOTER */}
      <footer className="py-8 px-6 border-t border-zinc-800/50">
        <div className="mx-auto max-w-7xl flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-3">
            <div className="w-6 h-6 bg-amber-400 rounded-sm flex items-center justify-center">
              <span className="text-zinc-950 font-black text-[10px]">ORM</span>
            </div>
            <span className="text-zinc-500 text-sm">Oak Ridge Management, LLC</span>
          </div>
          <p className="text-zinc-600 text-xs text-center leading-relaxed">
            © {new Date().getFullYear()} Oak Ridge Management, LLC. All rights reserved.
            CEH™ and CEH Infrastructure Index™ are trademarks of Oak Ridge Management, LLC.
          </p>
        </div>
      </footer>
    </main>
  );
}
