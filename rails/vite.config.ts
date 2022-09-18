import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import FullReload from "vite-plugin-full-reload";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 100 }),
  ],
  server: {
    hmr: {
      port: 3036,
      protocol: "ws",
      host: "localhost",
      clientPort: 3036,
    },
    port: 3036,
  },
});
