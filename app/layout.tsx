import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Oak Ridge Management",
  description: "Strategic capital allocation and real estate investment management.",
  openGraph: {
    title: "Oak Ridge Management",
    description: "Strategic capital allocation and real estate investment management.",
    url: "https://oakridgemanagement.net",
    siteName: "Oak Ridge Management",
    type: "website",
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
