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
import Rails from "@rails/ujs";
import tubolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "@rails/actiontext";
import "@/custom/jquery";
import "fomantic-ui";
import "@/custom/application";
import "@/custom/scroll";
import "@/custom/chart";
import "@/custom/rating";
import "@/custom/modal";
import "@/custom/anime";
import "@/custom/dimmer";
import "@/custom/popup";
import "@/custom/actiontext";
import "@/custom/swiper";
import.meta.globEager("../channels/*_channel.js");
import "@/custom/form";
import "@/custom/form_validate";

Rails.start();
tubolinks.start();
ActiveStorage.start();
