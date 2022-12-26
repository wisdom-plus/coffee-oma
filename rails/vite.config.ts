import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import FullReload from "vite-plugin-full-reload";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 100 }),
  ],
  server: {
    host: true,
    port: 3036,
    hmr: {
      host: "0.0.0.0",
    },
    watch: {
      usePolling: true,
    },
  },
});
