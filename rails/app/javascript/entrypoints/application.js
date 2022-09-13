// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log("Vite ⚡️ Rails");

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log(
  "Visit the guide for more information: ",
  "https://vite-ruby.netlify.app/guide/rails"
);

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("semantic-ui-sass");
require("infinite-scroll");
require("jquery");
require("jquery-ui");
require("trix");
require("@rails/actiontext");
require("jquery-raty-js");
require("custom/application");
require("custom/actiontext");
require("custom/form");
require("custom/chart");
require("custom/rating");
require("custom/scroll");
require("custom/modal");
require("custom/anime");
require("custom/dimmer");
require("custom/popup");

import $ from "jquery/dist/jquery.js";

globalThis.jQuery = $;
globalThis.$ = $;
