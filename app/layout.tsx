import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Oak Ridge Management",
  description:
    "Georgia-based holding company and capital allocator coordinating infrastructure investment, IP origination, and AI-adjacent capital activity.",
  openGraph: {
    title: "Oak Ridge Management",
    description:
      "Georgia-based holding company and capital allocator coordinating infrastructure investment, IP origination, and AI-adjacent capital activity.",
    url: "https://oakridgemanagement.net",
    siteName: "Oak Ridge Management",
    type: "website",
  },
  twitter: {
    card: "summary",
    title: "Oak Ridge Management",
    description:
      "Georgia-based holding company and capital allocator coordinating infrastructure investment, IP origination, and AI-adjacent capital activity.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="bg-zinc-950 text-zinc-50 antialiased">{children}</body>
    </html>
  );
}
