import $ from "jquery";

$(document).on("turbolinks:load", function () {
  //  registraction_editのvalidation
  $(".ui.registration_edit.form").form({
    fields: {
      "user[username]": "empty",
      "user[email]": ["empty", "email"],
    },
    prompt: {
      empty: "{name}が入力されていません。",
      email: "{name}は有効なメールアドレスではありません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
      match: "{name}が一致しません。",
    },
  });
  // product_newのvalidation
  $(".ui.product_new.form").form({
    fields: {
      name: "empty",
      shopname: "empty",
      price: ["minLength[1]", "empty", "number"],
      url: "url",
      tag: ["empty", "minCount[1]"],
      description: "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
      minCount: "{name}は最低でも{ruleValue}の選択肢を持たなければなりません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
      match: "{name}が一致しません。",
      number: "{name}は数字で入力してください。",
      url: "{name}は有効なURLではありません。",
    },
  });
  // bean_newのvalidation
  $(".ui.bean_new.form").form({
    fields: {
      name: "empty",
      country: "empty",
      description: "empty",
      url: "url",
      tag: ["empty", "minCount[1]"],
    },
    prompt: {
      empty: "{name}が入力されていません。",
      minCount: "{name}は最低でも{ruleValue}の選択肢を持たなければなりません。",
      url: "{name}は有効なURLではありません。",
    },
  });
  // product_reviewのvalidation
  $(".ui.product_review.form").form({
    fields: {
      title: "empty",
      content: "empty",
      review_rate: "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
    },
  });
  // bean_reviewのvalidation
  $(".ui.bean_review.form").form({
    fields: {
      content: "empty",
      "bean_review[title]": "empty",
      bean_review_acidity: "empty",
      bean_review_bitter: "empty",
      bean_review_sweet: "empty",
      bean_review_rich: "empty",
      bean_review_flavor: "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
    },
  });
  // sign_upのvalidation
  $(".ui.sign_up.form").form({
    fields: {
      username: "empty",
      "user[password]": [
        "minLength[6]",
        "empty",
        "match[password_confirmation]",
      ],
      "user[password_confirmation]": "empty",
      "user[email]": ["empty", "email"],
      policy: "checked",
    },
    prompt: {
      empty: "{name}が入力されていません。",
      email: "{name}は有効なメールアドレスではありません。",
      match: "{name}が一致しません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
      checked: "利用規約とプライベートポリシーに同意する必要があります。",
    },
  });
  // sign_inのvalidation
  $(".ui.sign_in.form").form({
    fields: {
      "user[email]": ["empty", "email"],
      "user[password]": "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
      email: "{name}は有効なメールアドレスではありません。",
    },
  });
  // password_newのvalidation
  $(".ui.password_new.form").form({
    fields: {
      email: ["empty", "email"],
    },
    prompt: {
      empty: "{name}が入力されていません。",
      email: "{name}は有効なメールアドレスではありません。",
    },
  });
  // password_editのvalidation
  $(".ui.password_edit.form").form({
    fields: {
      "user[password]": [
        "minLength[6]",
        "empty",
        "match[password_confirmation]",
      ],
      "user[password_confirmation]": "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
      match: "{name}が一致しません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
    },
  });
  // confirmations_newのvalidation
  $(".ui.confirmations_new.form").form({
    fields: {
      email: ["empty", "email"],
    },
    prompt: {
      empty: "{name}が入力されていません。",
    },
  });
  //  フォームのvalidation設定
  // $(".ui.form").form({
  //   fields: {
  //     "user[username]": "empty",
  //     "user[password]": [
  //       "minLength[6]",
  //       "empty",
  //       "match[password_confirmation]",
  //     ],
  //     "user[password_confirmation]": "empty",
  //     "user[email]": ["empty", "email"],
  //     policy: "checked",
  //     login_password: "empty",
  //     name: "empty",
  //     shopname: "empty",
  //     price: ["minLength[1]", "empty", "number"],
  //     url: "url",
  //     tag: ["empty", "minCount[1]"],
  //     description: "empty",
  //     content: "empty",
  //     review_rate: "empty",
  //     title: "empty",
  //     country: "empty",
  //     bean_review_acidity: "empty",
  //     bean_review_bitter: "empty",
  //     bean_review_sweet: "empty",
  //     bean_review_rich: "empty",
  //     bean_review_flavor: "empty",
  //   },
  //   prompt: {
  //     empty: "{name}が入力されていません。",
  //     email: "{name}は有効なメールアドレスではありません。",
  //     url: "{name}は有効なURLではありません。",
  //     match: "{name}が一致しません。",
  //     minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
  //     minCount: "{name}は最低でも{ruleValue}の選択肢を持たなければなりません。",
  //     number: "{name}は数字で入力してください。",
  //     checked: "利用規約とプライベートポリシーに同意する必要があります。",
  //   },
  // });
});
