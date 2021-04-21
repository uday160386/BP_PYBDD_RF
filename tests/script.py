from robot.libraries.BuiltIn import BuiltIn


def capture_custom_screenshot(screen_shot_name):
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    webdriver = seleniumlib.driver

    # capturing body tag gives full page screenshot
    body_tag = webdriver.find_element_by_tag_name('body')
    print(screen_shot_name)
    body_tag.screenshot(screen_shot_name + '.png')
