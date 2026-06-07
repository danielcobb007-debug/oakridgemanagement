import type { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: "https://oakridgemanagement.net",
      lastModified: "2026-06-07",
      changeFrequency: "weekly",
      priority: 1,
    },
  ];
}
