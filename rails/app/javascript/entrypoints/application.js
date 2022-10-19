// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
// console.log("Vite ⚡️ Rails");

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

// console.log(
//   "Visit the guide for more information: ",
//   "https://vite-ruby.netlify.app/guide/rails"
// );

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
import * as ujs from "@rails/ujs";
import tubolinks from "turbolinks";
ujs.start();
tubolinks.start();
import "infinite-scroll";
import "jquery";
import "trix";
import "@rails/actiontext";
import "@/custom/jquery";
import "@/custom/scroll";
import "@/custom/form";
import "@/custom/chart";
import "@/custom/rating";
import "@/custom/modal";
import "@/custom/anime";
import "@/custom/dimmer";
import "@/custom/popup";
import "@/custom/actiontext";
import "@/custom/swiper";

import "@/channels";
import "semantic-ui-sass";
import "jquery-raty-js";
import "@/custom/application";
