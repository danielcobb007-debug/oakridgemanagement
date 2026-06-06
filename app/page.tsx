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
            <a href="#strategy" className="hover:text-amber-400 transition-colors">Strategy</a>
            <a href="#portfolio" className="hover:text-amber-400 transition-colors">Portfolio</a>
            <a href="#contact" className="hover:text-amber-400 transition-colors">Contact</a>
          </div>
          <a
            href="#contact"
            className="text-sm font-medium bg-amber-400 text-zinc-950 px-4 py-2 rounded hover:bg-amber-300 transition-colors"
          >
            Get in Touch
          </a>
        </div>
      </nav>

      {/* HERO */}
      <section className="pt-32 pb-24 px-6">
        <div className="mx-auto max-w-7xl">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 mb-6 px-3 py-1.5 rounded-full border border-amber-400/20 bg-amber-400/5">
              <div className="w-1.5 h-1.5 rounded-full bg-amber-400 animate-pulse" />
              <span className="text-amber-400 text-xs font-medium tracking-wide uppercase">Private Investment Office</span>
            </div>
            <h1 className="text-5xl md:text-7xl font-black tracking-tight text-zinc-50 leading-[1.05] mb-6">
              Capital Deployed<br />
              <span className="text-amber-400">With Precision.</span>
            </h1>
            <p className="text-lg md:text-xl text-zinc-400 leading-relaxed max-w-2xl mb-10">
              Oak Ridge Management is a private investment office focused on real estate acquisition,
              structured capital, and long-term asset control across high-conviction opportunities.
            </p>
            <div className="flex flex-col sm:flex-row gap-4">
              <a
                href="#strategy"
                className="inline-flex items-center justify-center gap-2 bg-amber-400 text-zinc-950 font-semibold px-8 py-4 rounded hover:bg-amber-300 transition-colors"
              >
                Our Strategy
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 8l4 4m0 0l-4 4m4-4H3" />
                </svg>
              </a>
              <a
                href="#portfolio"
                className="inline-flex items-center justify-center gap-2 border border-zinc-700 text-zinc-300 font-semibold px-8 py-4 rounded hover:border-zinc-500 hover:text-zinc-100 transition-colors"
              >
                Portfolio
              </a>
            </div>
          </div>

          {/* Stats row */}
          <div className="mt-20 grid grid-cols-2 md:grid-cols-4 gap-px bg-zinc-800/50 rounded-xl overflow-hidden border border-zinc-800">
            {[
              { label: "Assets Under Management", value: "$40M+", sub: "Across entities" },
              { label: "Real Estate Holdings", value: "12+", sub: "Active properties" },
              { label: "Years Operating", value: "8+", sub: "Track record" },
              { label: "Entities Managed", value: "6", sub: "HoldCo structure" },
            ].map((stat) => (
              <div key={stat.label} className="bg-zinc-900 px-6 py-8">
                <div className="text-3xl font-black text-amber-400 mb-1">{stat.value}</div>
                <div className="text-sm font-medium text-zinc-200 mb-0.5">{stat.label}</div>
                <div className="text-xs text-zinc-500">{stat.sub}</div>
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
                Built for Long-Term<br />Asset Control
              </h2>
              <p className="text-zinc-400 leading-relaxed mb-4">
                Oak Ridge Management operates as a private investment office and holding company,
                structured to acquire, develop, and manage assets across real estate, infrastructure,
                and adjacent opportunities.
              </p>
              <p className="text-zinc-400 leading-relaxed mb-4">
                We operate under a HoldCo model — each asset or business sits inside a dedicated entity,
                providing tax efficiency, liability isolation, and long-term optionality. We don&apos;t chase
                trends; we build position.
              </p>
              <p className="text-zinc-400 leading-relaxed">
                Founded by Daniel Cobb, the firm has been quietly deploying capital into high-conviction
                opportunities across the Southeast and beyond.
              </p>
            </div>
            <div className="grid grid-cols-2 gap-4">
              {[
                { icon: "🏢", title: "HoldCo Structure", desc: "Entity-per-asset model for maximum tax efficiency and liability isolation." },
                { icon: "📊", title: "Capital Allocation", desc: "Disciplined deployment across real estate, structured debt, and operating businesses." },
                { icon: "🔒", title: "Asset Control", desc: "Long-term ownership mindset. We buy to hold, not to flip." },
                { icon: "⚡", title: "Execution Speed", desc: "Private structure means fast decisions without committee delays." },
              ].map((item) => (
                <div key={item.title} className="bg-zinc-900 border border-zinc-800 rounded-xl p-5 hover:border-amber-400/30 transition-colors">
                  <div className="text-2xl mb-3">{item.icon}</div>
                  <div className="font-semibold text-zinc-100 text-sm mb-2">{item.title}</div>
                  <div className="text-zinc-500 text-xs leading-relaxed">{item.desc}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* STRATEGY */}
      <section id="strategy" className="py-24 px-6 border-t border-zinc-800/50 bg-zinc-900/30">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-16">
            <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">Strategy</p>
            <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight">
              How We Think About Capital
            </h2>
          </div>
          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                number: "01",
                title: "Asymmetric Upside",
                desc: "We seek deals where downside is bounded and upside is outsized. Distressed assets, off-market transactions, and structured notes with equity kickers.",
              },
              {
                number: "02",
                title: "Tax-Aware Structure",
                desc: "Every deal is structured with the exit in mind. Depreciation, 1031 exchanges, opportunity zones, and cost segregation are operational tools — not afterthoughts.",
              },
              {
                number: "03",
                title: "Operating Leverage",
                desc: "We don't just own — we operate. Property management, construction oversight, and asset repositioning are done in-house to protect margin.",
              },
              {
                number: "04",
                title: "Entity Isolation",
                desc: "Each asset lives in its own LLC or entity. HoldCo sits above, providing credit separation and clean exit optionality per property.",
              },
              {
                number: "05",
                title: "Velocity of Decisions",
                desc: "No committees. No investment memos with 30-day approval cycles. We move when opportunity appears — and that speed is a competitive advantage.",
              },
              {
                number: "06",
                title: "Compounding Position",
                desc: "Cash flow from stabilized assets funds acquisitions. The portfolio is designed to self-fund its own growth over a 10-year horizon.",
              },
            ].map((item) => (
              <div key={item.number} className="bg-zinc-900 border border-zinc-800 rounded-xl p-6 hover:border-amber-400/20 transition-colors group">
                <div className="text-amber-400/40 font-black text-4xl mb-4 group-hover:text-amber-400/60 transition-colors">{item.number}</div>
                <h3 className="font-bold text-zinc-100 text-lg mb-3">{item.title}</h3>
                <p className="text-zinc-400 text-sm leading-relaxed">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* PORTFOLIO */}
      <section id="portfolio" className="py-24 px-6 border-t border-zinc-800/50">
        <div className="mx-auto max-w-7xl">
          <div className="flex items-end justify-between mb-12">
            <div>
              <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">Portfolio</p>
              <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight">
                Active Holdings
              </h2>
            </div>
            <span className="text-zinc-500 text-sm hidden md:block">Select assets — full portfolio available upon request</span>
          </div>
          <div className="grid md:grid-cols-3 gap-6">
            {[
              { type: "Multi-Family Residential", location: "Southeast Region", status: "Stabilized", yield: "8.2% CoC" },
              { type: "Commercial Mixed-Use", location: "Tennessee", status: "Value-Add", yield: "14% Proj. IRR" },
              { type: "Single-Tenant NNN", location: "Regional", status: "Stabilized", yield: "6.8% CoC" },
              { type: "Residential Portfolio", location: "Southeast Region", status: "Stabilized", yield: "9.1% CoC" },
              { type: "Light Industrial", location: "Tennessee", status: "Repositioning", yield: "16% Proj. IRR" },
              { type: "Structured Note", location: "Private Credit", status: "Active", yield: "11% Fixed" },
            ].map((asset, i) => (
              <div key={i} className="bg-zinc-900 border border-zinc-800 rounded-xl p-6 hover:border-amber-400/20 transition-colors">
                <div className="flex items-center justify-between mb-4">
                  <span className={`text-xs font-medium px-2.5 py-1 rounded-full ${
                    asset.status === "Stabilized" ? "bg-green-400/10 text-green-400" :
                    asset.status === "Value-Add" ? "bg-amber-400/10 text-amber-400" :
                    asset.status === "Repositioning" ? "bg-blue-400/10 text-blue-400" :
                    "bg-zinc-700 text-zinc-300"
                  }`}>
                    {asset.status}
                  </span>
                  <span className="text-zinc-500 text-xs">{asset.location}</span>
                </div>
                <h3 className="font-semibold text-zinc-100 mb-1">{asset.type}</h3>
                <div className="text-amber-400 font-bold text-lg">{asset.yield}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CONTACT */}
      <section id="contact" className="py-24 px-6 border-t border-zinc-800/50 bg-zinc-900/30">
        <div className="mx-auto max-w-7xl">
          <div className="max-w-2xl mx-auto text-center">
            <p className="text-amber-400 text-sm font-semibold tracking-widest uppercase mb-4">Contact</p>
            <h2 className="text-4xl md:text-5xl font-black text-zinc-50 tracking-tight mb-6">
              Let&apos;s Talk
            </h2>
            <p className="text-zinc-400 text-lg mb-10 leading-relaxed">
              We work with a small group of partners, co-investors, and operators.
              If you have a deal, a question, or a conversation worth having — reach out.
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
            <span className="text-zinc-500 text-sm">Oak Ridge Management</span>
          </div>
          <p className="text-zinc-600 text-sm">
            © {new Date().getFullYear()} Oak Ridge Management. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  );
}
