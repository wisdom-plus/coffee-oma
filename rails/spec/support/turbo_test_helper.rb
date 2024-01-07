module TurboTestHelper
  def turbo_lazy_loading(target_id)
    javascript_text = "
      const targetId = document.getElementById('#{target_id}');
      targetId.scrollIntoView({
        behavior: 'smooth',
        block: 'center',
      });
    "
    expect(page).to have_css "##{target_id}"
    execute_script(javascript_text)
  end
end
