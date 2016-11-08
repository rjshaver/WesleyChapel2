== Think Up Themes ==

- By Think Up Themes, http://www.thinkupthemes.com/

Requires at least:	4.0.0
Tested up to:		4.5.3

Experon is the free version of the multi-purpose professional theme (Experon Pro) ideal for a business or blog website. The theme has a responsive layout, HD retina ready and comes with a powerful theme options panel with can be used to make awesome changes without touching any code. The theme also comes with a full width easy to use slider. Easily add a logo to your site and create a beautiful homepage using the built-in homepage layout.

-----------------------------------------------------------------------------
	Support
-----------------------------------------------------------------------------

- For support for Experon (free) please post a support ticket over at the https://wordpress.org/support/theme/experon.

-----------------------------------------------------------------------------
	Frequently Asked Questions
-----------------------------------------------------------------------------

- None Yet


-----------------------------------------------------------------------------
	Limitations
-----------------------------------------------------------------------------

- RTL support is yet to be added. This is planned for inclusion in v1.1.0


-----------------------------------------------------------------------------
	Copyright, Sources, Credits & Licenses
-----------------------------------------------------------------------------

Experon WordPress Theme, Copyright 2015 Think Up Themes Ltd
Experon is distributed under the terms of the GNU GPL

The following opensource projects, graphics, fonts, API's or other files as listed have been used in developing this theme. Thanks to the author for the creative work they made. All creative works are licensed as being GPL or GPL compatible.

    [1.01] Item:        Underscores (_s) starter theme - Copyright: Automattic, automattic.com
           Item URL:    http://underscores.me/
           Licence:     Licensed under GPLv2 or later
           Licence URL: http://www.gnu.org/licenses/gpl.html

    [1.02] Item:        Redux Framework
           Item URL:    https://github.com/ReduxFramework/ReduxFramework
           Licence:     GPLv3
           Licence URL: http://www.gnu.org/licenses/gpl.html

    [1.03] Item:        html5shiv (jQuery file)
           Item URL:    http://code.google.com/p/html5shiv/
           Licence:     MIT
           Licence MIT: http://opensource.org/licenses/mit-license.html

    [1.04] Item:        PrettyPhoto
           Item URL:    http://www.no-margin-for-errors.com/projects/prettyphoto-jquery-lightbox-clone/
           Licence:     GPLv2
           Licence URL: http://www.gnu.org/licenses/gpl-2.0.html

    [1.05] Item:        ImagesLoaded
           Item URL:    https://github.com/desandro/imagesloaded
           Licence:     MIT
           Licence URL: http://opensource.org/licenses/mit-license.html

    [1.06] Item:        Retina js
           Item URL:    http://retinajs.com
           Licence:     MIT
           Licence URL: http://opensource.org/licenses/mit-license.html

    [1.07] Item:        ResponsiveSlides
           Item URL:    https://github.com/viljamis/ResponsiveSlides.js
           Licence:     MIT
           Licence URL: http://opensource.org/licenses/mit-license.html

    [1.08] Item:        ScrollUp
           Item URL:    https://github.com/markgoodyear/scrollup
           Licence:     MIT
           Licence URL: http://opensource.org/licenses/mit-license.html

    [1.09] Item:        Modernizr
           Item URL:    https://github.com/Modernizr/Modernizr
           Licence:     MIT
           Licence URL: http://opensource.org/licenses/mit-license.html

    [1.10] Item:        Font Awesome
           Item URL:    http://fortawesome.github.io/Font-Awesome/#license
           Licence:     SIL Open Font &  MIT
           Licence OFL: http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL
           Licence MIT: http://opensource.org/licenses/mit-license.html

    [1.11] Item:        Twitter Bootstrap
           Item URL:    https://github.com/twitter/bootstrap/wiki/License
           Licence:     Apache 2.0
           Licence URL: http://www.apache.org/licenses/LICENSE-2.0

    [1.12] Item:        paper-experon.jpg, overlay.png, slide_demo1.png, slide_demo2.png, slide_demo3.png
           Item URL:    Experon/images
           Licence:     CC0
           Licence URL: These items have been produced specifically for Experon and are owned by Think Up Themes. Released under CC0.

-----------------------------------------------------------------------------
	Changelog
-----------------------------------------------------------------------------

Version 1.0.9
- Fixed:   prettyPhoto.js now fully compatible with https sites.
- Updated: Font Awesome library updated to latest version v4.6.3. Ensures all icons in FA library are available to use.

Version 1.0.8
- Fixed:   Custom Redux extensions now moved to folder main-extensions to ensure compatibility with Redux plugin. Ensures plugin and theme can be used without conflicting.
- Updated: "ReduxFramework::$_url . 'assets/img/layout" changed to "trailingslashit( get_template_directory_uri() ) . 'admin/main/assets/img/layout".

Version 1.0.7
- Updated: Licensing information added for Moderizr and ScrollUp.
- Updated: ScrollUp updated to v2.4.1 and unminified version of jqueryscrollUP.min.js added.
- Removed: Custom Slider option removed.

Version 1.0.6
- Fixed:   Escaped admin_url() with esc_url() on line 113 of class.redux_cdn.php.
- Fixed:   Escaped $v['img'] with esc_url() on line 181 of field_image_select.php.
- Fixed:   Escaped $img[0] with esc_url() on lines 66 and 67 of field_gallery.php.
- Fixed:   Escaped $this->value['url'] with esc_url() on line 189 of field_media.php.
- Fixed:   Escaped $this->value['thumbnail'] with esc_url() on line 190 of field_media.php.
- Fixed:   Escaped $slide_alt and $slide_image with esc_attr() on line 101 of 02.homepage.php.
- Fixed:   Escaped $this->value['background-image'] with esc_url() on line 305 of field_background.php.
- Fixed:   Escaped $this->value['media']['thumbnail'] with esc_url() on line 306 of field_background.php.
- Fixed:   Escaped $slide[ 'image' ] and $slide[ 'thumb' ] with esc_url() on lines 119 and 120 of field_slides.php.
- Fixed:   Escaped $section['icon'] and $sections[ $nextK ]['icon'] with esc_url() on lines 3774 and 3844 framework.php.
- Fixed:   Escaped $v['alt'],$v['class'], $style, $presets and $merge with esc_attr() on line 181 of field_image_select.php.
- Fixed:   Escaped all instances of this->_extension_url and $this->field['upgrade_url'] with esc_url() in file field_thinkup_upgrade.php.
- Updated: Post code in content.php simplified to use less PHP.
- Updated: Search placeholder text can now be fully translated.
- Updated: License information added for images in /images folder.
- Updated: Commented code blocks removed from extension_customizer.php.
- Updated: Changed validation for slider title from esc_attr() to esc_html().
- Updated: Content width implementation updated to be hooked into "after_theme_setup".
- Updated: Scripts and stylesheets in function thinkup_adminscripts() now enenqueued directly.
- Updated: Textdomain in options.php changes from "redux-framework" to match theme textdomain "experon".
- Updated: Function thinkup_adminscripts() now hooked into "customize_controls_enqueue_scripts" instead of "admin_enqueue_scripts".
- Updated: Links to widget page when no widget is assigned to sidebars only shows if users have atleast "edit_theme_options" permissions.
- Removed: All references to "template-blog.php" removed.

Version 1.0.5
- Fixed:   Correctly named WordPress in footer copyright text.
- Updated: All handles for 3rd party scripts and stylesheets now unprefixed.
- Updated: All instances where "get_template_directory_uri" is output now wrapped in esc_url.
- Updated: All 3rd party scripts and stylesheets now load before theme scripts and stylesheets.
- Removed: Unused custom image sizes removed.
- Removed: Custom page template "template-archive.php" removed.
- Removed: Custom page template "template-sitemap.php" removed.
- Removed: Theme global variables migration script removed. Not required as this is a new theme.
- Removed: jQuery enqueue removed from function.php. jQuery is automatically loaded when dependent script it loaded.

Version 1.0.4
- Updated: Various minor styling updates in style.css.
- Updated: Improved sanitization in template-sitemap.php.
- Updated: Improved sanitization in template-archive.php.
- Updated: Screenshot updated and is now 1200x900 px in size.
- Updated: All theme sidebar names are now transalation ready.
- Updated: jQuery Masonry script now output on all archive pages.
- Updated: Translation .pot file updated to use correct translation file for Experon.
- Removed: Depreciated tags removed from style.css.
- Removed: Deregistering of 'wpb_ace' script in framework.php removed.
- Removed: sub-footer sidebars removed as they are not used in the theme.
- Removed: Deregistering of 'jquerySelect2' script in enqueue.php removed.

Version 1.0.3
- Fixed:   Custom social media icons now applied to footer social media icons as well as header social media icons.
- Fixed:   Page titles escaping updating in main menu due to plugin conflicts (e.g. qTranslateX). Escaping not required as title is passed through apply_filters( 'the_title' ).
- Updated: thinkup_input_wptitle() outputs at start of wp_head().
- Updated: Font size 42px added to icon for Services module style 2.
- Updated: style-shortcodes.css updated to be consistent with all themes.
- Updated: Translation .pot file updated to take account of recent updates in core theme files.
- Updated: Homepage (Featured) sections now use Section style 1 (icon) layout. Previously used image layout.
- Updated: Select field in Homepage (Featured) section of theme options updated to use Font Awesome icons instead of Elusive Icons.
- Removed: Code for sc-progress removed from style.css as it's not being used and causes design issues.

Version 1.0.2
- Fixed:   Comment count in comments.php now translation ready.
- Fixed:   Social media profile names now translation ready using correct textdomain.
- Updated: Translation .pot file updated to take account of recent updates in core theme files.

Version 1.0.1
- New:     Support added for WP v4.5 custom logo options.
- New:     ThinkUpSlider replaced with 3 slide page slider.
- New:     Title tag support added using native WordPress wp_title() feature.
- Fixed:   Checkbox field saves as as "off" when unticked.
- Fixed:   Switch field saves as as "off" when switched off.
- Fixed:   PHP notices fixed for comments form - changes made comments.php file.
- Fixed:   PHP notices fixed upgrade section in theme options - changes made field_thinkup_upgrade.php file.
- Fixed:   Validation removed from $check_logoset on line 17 in 01.general-settings.php. This variable is never output, do validation not required.
- Fixed:   Customizer theme options sections now fully scroll to the bottom. Previously sections with vertical scroll cut-off when using Firefox browser.
- Updated: Logo image width set to "auto".
- Updated: Theme admin scripts only load on customizer page.
- Updated: Upgrade button moved to active theme section of customizer.
- Updated: Logo options removed from theme options section of customizer.
- Updated: Link to gmpg.org in header.php now compatible with https sites.
- Updated: HTML will be stripped from description inputs to if added inline.
- Updated: All non-english text that's output front-end is now translation ready.
- Updated: Various functions which are not currently being used have been removed.
- Updated: Pagination functionaity uses WP core function - the_posts_pagination().
- Updated: Site preview does not move when customizer expands for theme options section.
- Updated: All references to meta variables removed as these are not currently being used.
- Updated: All variables where the value is not know with certainly now escaped on output.
- Updated: Page name on archive pages output using WP core function - the_archive_title().
- Updated: Translation .pot file updated to take account of recent updates in core theme files.
- Updated: Setting 'use_cdn' set to false in options.php to prevent loading of external resources.
- Updated: All translatable strings which are output in html attributes escaped using esc_attr__().
- Updated: Setting 'save_defaults' set to false to ensure no theme settings are saved on activation.
- Updated: Links to widgets page changed from /wp-admin/widgets.php to esc_url( admin_url( 'widgets.php' ) ).
- Updated: Homepage (Content) section renamed to Homepage (Featured) to make it clear that the section is intended for minimal content.
- Updated: Upgrade information moved to theme options section to prevent confusion with 3rd party code which may also be using the customizer.
- Updated: Demo content only displays to users with atleast "edit_theme_options" rights. The user must actively switch on the sections (slider, featured content).
- Updated: Description inputs in "Homepage (Featured)" changed from textarea to text fields to ensure it's clear that the input is intended only for minimal content.
- Removed: Twitter meta removed from header.php.
- Removed: Favicon option removed from theme options.
- Removed: wp_reset_query() removed from template-sitemap.php.
- Removed: alert( 'test000' ); removed from jquery.serializeForm.js.
- Removed: Retina.js removed as it's no longer given custom_logo support.
- Removed: Custom pagination function removed - thinkup_input_pagination().
- Removed: //alert( 'test11-22' ); removed from extension_customizer.min.js.
- Removed: wp_reset_query() removed from archive.php, page.php and single.php.

Version 1.0.0
- Initial release.