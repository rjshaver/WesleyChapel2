<?php
/**
 * Homepage functions.
 *
 * @package ThinkUpThemes
 */

/* ----------------------------------------------------------------------------------
	ENABLE SLIDER - HOMEPAGE & INNER-PAGES
---------------------------------------------------------------------------------- */

// Add full width slider class to body
function thinkup_input_sliderclass($classes){
global $thinkup_homepage_sliderswitch;
global $thinkup_homepage_sliderpresetwidth;

	if ( is_front_page() or thinkup_check_ishome() ) {
		if ( empty( $thinkup_homepage_sliderswitch ) or $thinkup_homepage_sliderswitch == 'option1' or $thinkup_homepage_sliderswitch == 'option4' ) {
			if ( empty( $thinkup_homepage_sliderpresetwidth ) or $thinkup_homepage_sliderpresetwidth == '1' ) {
				$classes[] = 'slider-full';
			} else {
				$classes[] = 'slider-boxed';
			}
		}
	}
	return $classes;
}
add_action( 'body_class', 'thinkup_input_sliderclass');


/* ----------------------------------------------------------------------------------
	ENABLE HOMEPAGE SLIDER
---------------------------------------------------------------------------------- */

// Content for slider layout - Standard
function thinkup_input_sliderhomepage() {
global $thinkup_homepage_sliderpage1;
global $thinkup_homepage_sliderpage2;
global $thinkup_homepage_sliderpage3;

	// Get url of featured images in slider pages
	$slide1_image_url = wp_get_attachment_url( get_post_thumbnail_id( $thinkup_homepage_sliderpage1 ) );
	$slide2_image_url = wp_get_attachment_url( get_post_thumbnail_id( $thinkup_homepage_sliderpage2 ) );
	$slide3_image_url = wp_get_attachment_url( get_post_thumbnail_id( $thinkup_homepage_sliderpage3 ) );

	// Get titles of slider pages
	$slide1_title = get_the_title( $thinkup_homepage_sliderpage1 );
	$slide2_title = get_the_title( $thinkup_homepage_sliderpage2 );
	$slide3_title = get_the_title( $thinkup_homepage_sliderpage3 );
	
	// Get descriptions (excerpt) of slider pages
	$slide1_description = apply_filters( 'the_excerpt', get_post_field( 'post_excerpt', $thinkup_homepage_sliderpage1 ) );
	$slide2_description = apply_filters( 'the_excerpt', get_post_field( 'post_excerpt', $thinkup_homepage_sliderpage2 ) );
	$slide3_description = apply_filters( 'the_excerpt', get_post_field( 'post_excerpt', $thinkup_homepage_sliderpage3 ) );

	// Get url of slider pages
	$slide1_url = get_permalink( $thinkup_homepage_sliderpage1 );
	$slide2_url = get_permalink( $thinkup_homepage_sliderpage2 );
	$slide3_url = get_permalink( $thinkup_homepage_sliderpage3 );

	// Create array for slider content
	$thinkup_homepage_sliderpage = array( 
		array(
			'slide_id'          => $thinkup_homepage_sliderpage1,
			'slide_image_url'   => $slide1_image_url,
			'slide_title'       => $slide1_title,
			'slide_description' => $slide1_description,
			'slide_url'         => $slide1_url 
		),
		array( 
			'slide_id'          => $thinkup_homepage_sliderpage2, 
			'slide_image_url'   => $slide2_image_url, 
			'slide_title'       => $slide2_title, 
			'slide_description' => $slide2_description, 
			'slide_url'         => $slide2_url 
		),
		array( 
			'slide_id'          => $thinkup_homepage_sliderpage3, 
			'slide_image_url'   => $slide3_image_url, 
			'slide_title'       => $slide3_title, 
			'slide_description' => $slide3_description, 
			'slide_url'         => $slide3_url 
		),
	);

	foreach ($thinkup_homepage_sliderpage as $slide) {

		if ( is_numeric( $slide['slide_id'] ) ) {

			// Get url of background image or set video overlay image
			$slide_image = 'background: url(' . esc_url( $slide['slide_image_url'] ) . ') no-repeat center; background-size: cover;';

			// Used for slider image alt text
			if ( ! empty( $slide['slide_title'] ) ) {
				$slide_alt = esc_html( $slide['slide_title'] );
			} else {
				$slide_alt = esc_html__( 'Slider Image', 'experon' );
			}

			echo '<li>',
				 '<img src="' . esc_url( get_template_directory_uri() ) . '/images/transparent.png" style="' . esc_attr( $slide_image ) . '" alt="' . esc_attr( $slide_alt ) . '" />',
				 '<div class="rslides-content">',
				 '<div class="wrap-safari">',
				 '<div class="rslides-content-inner">',
				 '<div class="featured">';

				if ( ! empty( $slide['slide_title'] ) ) {

					// Wrap text in <span> tags
					$slide['slide_title'] = '<span>' . esc_html( $slide['slide_title'] ) . '</span>';
					$slide['slide_title'] = str_replace( '<br />', '</span><br /><span>', $slide['slide_title'] );
					$slide['slide_title'] = str_replace( '<br/>', '</span><br/><span>', $slide['slide_title'] );

					echo '<div class="featured-title">',
						 $slide['slide_title'],
						 '</div>';
				}
				if ( ! empty( $slide['slide_description'] ) ) {
					$slide_description = '<p><span>' . esc_html( wp_strip_all_tags( $slide['slide_description'] ) ) . '</span></p>';

					// Wrap text in <span> tags
					$slide_description = str_replace( '<br />', '</span><br /><span>', $slide_description );
					$slide_description = str_replace( '<br/>', '</span><br/><span>', $slide_description );

					echo '<div class="featured-excerpt">',
						 $slide_description,
						 '</div>';
				}
				if ( ! empty( $slide['slide_url'] ) ) {

					if ( empty( $slide['slide_button'] ) ) {
						$slide['slide_button'] = __( 'Read More', 'experon' );
					}

					echo '<div class="featured-link">',
						 '<a href="' . esc_url( $slide['slide_url'] ) . '"><span>' . esc_html( $slide['slide_button'] ) . '</span></a>',
						 '</div>';
				}

			echo '</div>',
				  '</div>',
				  '</div>',
				  '</div>',
				  '</li>';
		}
	}
}

// Add Slider - Homepage
function thinkup_input_sliderhome() {
global $thinkup_homepage_sliderswitch;
global $thinkup_homepage_sliderpage1;
global $thinkup_homepage_sliderpage2;
global $thinkup_homepage_sliderpage3;

$thinkup_class_fullwidth = NULL;
$slide_image             = NULL;
$slider_default          = NULL;

	if ( is_front_page() or thinkup_check_ishome() ) {

		// Set default slider
		$slider_default .= '<li><img src="' . esc_url( get_template_directory_uri() ) . '/images/transparent.png" style="background: url(' . esc_url( get_template_directory_uri() ) . '/images/slideshow/slide_demo1.png) no-repeat center; background-size: cover;" alt="' . esc_attr__( 'Demo Image', 'experon' ) . '" /></li>';
		$slider_default .= '<li><img src="' . esc_url( get_template_directory_uri() ) . '/images/transparent.png" style="background: url(' . esc_url( get_template_directory_uri() ) . '/images/slideshow/slide_demo2.png) no-repeat center; background-size: cover;" alt="' . esc_attr__( 'Demo Image', 'experon' ) . '" /></li>';
		$slider_default .= '<li><img src="' . esc_url( get_template_directory_uri() ) . '/images/transparent.png" style="background: url(' . esc_url( get_template_directory_uri() ) . '/images/slideshow/slide_demo3.png) no-repeat center; background-size: cover;" alt="' . esc_attr__( 'Demo Image', 'experon' ) . '" /></li>';

		if ( ( current_user_can( 'edit_theme_options' ) and empty( $thinkup_homepage_sliderswitch ) ) or $thinkup_homepage_sliderswitch == 'option1' ) {

			echo '<div id="slider"><div id="slider-core">';
			echo '<div class="rslides-container"><div class="rslides-inner"><ul class="slides">';
				echo $slider_default;
			echo '</ul></div></div>';
			echo '</div></div>';

		} else if ( $thinkup_homepage_sliderswitch == 'option2' ) {

			echo '';

		} else if ( $thinkup_homepage_sliderswitch == 'option3' ) {

			echo '';

		} else if ( $thinkup_homepage_sliderswitch == 'option4' ) {

			// Check if page slider has been set
			if( ! is_numeric( $thinkup_homepage_sliderpage1 ) and ! is_numeric( $thinkup_homepage_sliderpage2 ) and ! is_numeric( $thinkup_homepage_sliderpage3 ) ) {

				echo '<div id="slider"><div id="slider-core">';
				echo '<div class="rslides-container"><div class="rslides-inner"><ul class="slides">';
					echo $slider_default;
				echo '</ul></div></div>';
				echo '</div></div>';

			} else {

				echo '<div id="slider"><div id="slider-core">';
				echo '<div class="rslides-container"><div class="rslides-inner"><ul class="slides">';
					thinkup_input_sliderhomepage();
				echo '</ul></div></div>';
				echo '</div></div>';
				
			}
		}
	}
}

// Add ThinkUpSlider Height - Homepage
function thinkup_input_sliderhomeheight() {
global $thinkup_homepage_sliderpresetheight;

	if ( empty( $thinkup_homepage_sliderpresetheight ) ) $thinkup_homepage_sliderpresetheight = '350';

	if ( is_front_page() or thinkup_check_ishome() ) {
		if ( empty( $thinkup_homepage_sliderswitch ) or $thinkup_homepage_sliderswitch == 'option1' or $thinkup_homepage_sliderswitch == 'option4' ) {
		echo 	"\n" .'<style type="text/css">' . "\n",
			'#slider .rslides, #slider .rslides li { height: ' . esc_html( $thinkup_homepage_sliderpresetheight ) . 'px; max-height: ' . esc_html( $thinkup_homepage_sliderpresetheight ) . 'px; }' . "\n",
			'#slider .rslides img { height: 100%; max-height: ' . esc_html( $thinkup_homepage_sliderpresetheight ) . 'px; }' . "\n",
			'</style>' . "\n";
		}
	}
}
add_action( 'wp_head','thinkup_input_sliderhomeheight', '13' );


//----------------------------------------------------------------------------------
//	ENABLE HOMEPAGE CONTENT
//----------------------------------------------------------------------------------

function thinkup_input_homepagesection() {
global $thinkup_homepage_sectionswitch;
global $thinkup_homepage_section1_icon;
global $thinkup_homepage_section1_title;
global $thinkup_homepage_section1_desc;
global $thinkup_homepage_section1_link;
global $thinkup_homepage_section1_url;
global $thinkup_homepage_section1_button;
global $thinkup_homepage_section2_icon;
global $thinkup_homepage_section2_title;
global $thinkup_homepage_section2_desc;
global $thinkup_homepage_section2_link;
global $thinkup_homepage_section2_url;
global $thinkup_homepage_section2_button;
global $thinkup_homepage_section3_icon;
global $thinkup_homepage_section3_title;
global $thinkup_homepage_section3_desc;
global $thinkup_homepage_section3_link;
global $thinkup_homepage_section3_url;
global $thinkup_homepage_section3_button;

	// Set default values for icons
	if ( empty( $thinkup_homepage_section1_icon ) ) $thinkup_homepage_section1_icon = 'fa fa-thumbs-up';
	if ( empty( $thinkup_homepage_section2_icon ) ) $thinkup_homepage_section2_icon = 'fa fa-desktop';
	if ( empty( $thinkup_homepage_section3_icon ) ) $thinkup_homepage_section3_icon = 'fa fa-gears';

	// Set default values for titles
	if ( empty( $thinkup_homepage_section1_title ) ) $thinkup_homepage_section1_title = __( 'Perfect For All', 'experon' );
	if ( empty( $thinkup_homepage_section2_title ) ) $thinkup_homepage_section2_title = __( '100% Responsive', 'experon' );
	if ( empty( $thinkup_homepage_section3_title ) ) $thinkup_homepage_section3_title = __( 'Powerful Framework', 'experon' );

	// Set default values for descriptions
	if ( empty( $thinkup_homepage_section1_desc ) ) 
	$thinkup_homepage_section1_desc = __( 'The modern design of Experon (Free) makes it the perfect choice for any website. Business, charity, blog, well everything!', 'experon' );

	if ( empty( $thinkup_homepage_section2_desc ) ) 
	$thinkup_homepage_section2_desc = __( 'Experon (Free) is 100% responsive. It looks great on all devices, from mobile to desktops and everything in between!', 'experon' );

	if ( empty( $thinkup_homepage_section3_desc ) ) 
	$thinkup_homepage_section3_desc = __( 'Get a taste of our awesome ThinkUpThemes Framework and make changes to your site easily, without touching any code at all!', 'experon' );

	// Get page names for links
	if ( ! empty( $thinkup_homepage_section1_url ) ) {
		$thinkup_homepage_section1_link = $thinkup_homepage_section1_url;
	} else if ( ! empty( $thinkup_homepage_section1_link ) ) {
		$thinkup_homepage_section1_link = get_permalink( $thinkup_homepage_section1_link );
	}
	if ( ! empty( $thinkup_homepage_section2_url ) ) {
		$thinkup_homepage_section2_link = $thinkup_homepage_section2_url;
	} else if ( ! empty( $thinkup_homepage_section2_link ) ) {
		$thinkup_homepage_section2_link = get_permalink( $thinkup_homepage_section2_link );
	}
	if ( ! empty( $thinkup_homepage_section3_url ) ) {
		$thinkup_homepage_section3_link = $thinkup_homepage_section3_url;
	} else if ( ! empty( $thinkup_homepage_section3_link ) ) {
		$thinkup_homepage_section3_link = get_permalink( $thinkup_homepage_section3_link );
	}

	// Get button text
	if ( empty( $thinkup_homepage_section1_button ) )
		$thinkup_homepage_section1_button = __( 'Read More', 'experon' );
	if ( empty( $thinkup_homepage_section2_button ) )
		$thinkup_homepage_section2_button = __( 'Read More', 'experon' );
	if ( empty( $thinkup_homepage_section3_button ) )
		$thinkup_homepage_section3_button = __( 'Read More', 'experon' );

	// Output featured content areas
	if ( is_front_page() or thinkup_check_ishome() ) {
		if ( ( current_user_can( 'edit_theme_options' ) and empty( $thinkup_homepage_sectionswitch ) ) or $thinkup_homepage_sectionswitch == '1' ) {

		echo '<div id="section-home"><div id="section-home-inner">';

			echo '<article class="section1 one_third">',
					'<div class="services-builder style1">',
					'<div class="iconimage">';
					if ( empty( $thinkup_homepage_section1_icon ) ) {
						echo '<i class="' . esc_attr( $thinkup_homepage_section1_icon ) . ' fa-2x fa-inverse"></i>';
					} else {
						if ( ! empty( $thinkup_homepage_section1_link ) ) {
							echo '<a href="' . esc_url( $thinkup_homepage_section1_link ) . '"><i class="' . esc_attr( $thinkup_homepage_section1_icon ) . ' fa-2x fa-inverse"></i></a>';
						} else {
							echo '<i class="' . esc_attr( $thinkup_homepage_section1_icon ) . ' fa-2x fa-inverse"></i>';
						}
					}
			echo	'</div>',
					'<div class="iconmain">',
					'<h3>' . esc_html( $thinkup_homepage_section1_title ) . '</h3>' . wpautop( do_shortcode( wp_strip_all_tags( esc_html( $thinkup_homepage_section1_desc ) ) ) );
					if ( ! empty( $thinkup_homepage_section1_link ) ) {
						echo '<p class="iconurl"><a class="" href="' . esc_url( $thinkup_homepage_section1_link ) . '">' . esc_html( $thinkup_homepage_section1_button ) . '</a></p>';
					}
			echo	'</div>',
					'</div>',
				'</article>';
			echo '<article class="section2 one_third">',
					'<div class="services-builder style1">',
					'<div class="iconimage">';
					if ( empty( $thinkup_homepage_section2_icon ) ) {
						echo '<i class="' . esc_attr( $thinkup_homepage_section2_icon ) . ' fa-2x fa-inverse"></i>';
					} else {
						if ( ! empty( $thinkup_homepage_section2_link ) ) {
							echo '<a href="' . esc_url( $thinkup_homepage_section2_link ) . '"><i class="' . esc_attr( $thinkup_homepage_section2_icon ) . ' fa-2x fa-inverse"></i></a>';
						} else {
							echo '<i class="' . esc_attr( $thinkup_homepage_section2_icon ) . ' fa-2x fa-inverse"></i>';
						}
					}
			echo	'</div>',
					'<div class="iconmain">',
					'<h3>' . esc_html( $thinkup_homepage_section2_title ) . '</h3>' . wpautop( do_shortcode( wp_strip_all_tags( esc_html( $thinkup_homepage_section2_desc ) ) ) );
					if ( ! empty( $thinkup_homepage_section2_link ) ) {
						echo '<p class="iconurl"><a class="" href="' . esc_url( $thinkup_homepage_section2_link ) . '">' . esc_html( $thinkup_homepage_section2_button ) . '</a></p>';
					}
			echo	'</div>',
					'</div>',
				'</article>';

			echo '<article class="section3 one_third last">',
					'<div class="services-builder style1">',
					'<div class="iconimage">';
					if ( empty( $thinkup_homepage_section3_icon ) ) {
						echo '<i class="' . esc_attr( $thinkup_homepage_section3_icon ) . ' fa-2x fa-inverse"></i>';
					} else {
						if ( ! empty( $thinkup_homepage_section3_link ) ) {
							echo '<a href="' . esc_url( $thinkup_homepage_section3_link ) . '""><i class="' . esc_attr( $thinkup_homepage_section3_icon ) . ' fa-2x fa-inverse"></i></a>';
						} else {
							echo '<i class="' . esc_attr( $thinkup_homepage_section3_icon ) . ' fa-2x fa-inverse"></i>';
						}
					}
			echo	'</div>',
					'<div class="iconmain">',
					'<h3>' . esc_html( $thinkup_homepage_section3_title ) . '</h3>' . wpautop( do_shortcode( wp_strip_all_tags( esc_html( $thinkup_homepage_section3_desc ) ) ) );
				if ( ! empty( $thinkup_homepage_section3_link ) ) {
					echo '<p class="iconurl"><a class="" href="' . esc_url( $thinkup_homepage_section3_link ) . '">' . esc_html( $thinkup_homepage_section3_button ) . '</a></p>';
				}
			echo	'</div>',
					'</div>',
				'</article>';

		echo '<div class="clearboth"></div></div></div>';
		}
	}
}


/* ----------------------------------------------------------------------------------
	CALL TO ACTION - INTRO
---------------------------------------------------------------------------------- */

function thinkup_input_ctaintro() {
global $thinkup_homepage_introswitch;
global $thinkup_homepage_introstyle;
global $thinkup_homepage_introaction;
global $thinkup_homepage_introactionteaser;
global $thinkup_homepage_introactiontext1;
global $thinkup_homepage_introactionlink1;
global $thinkup_homepage_introactionpage1;
global $thinkup_homepage_introactioncustom1;

	if ( $thinkup_homepage_introswitch == '1' and ( is_front_page() or thinkup_check_ishome() ) and ! empty( $thinkup_homepage_introaction ) ) {

		// Determine style for call to action
		if ( empty( $thinkup_homepage_introstyle ) or $thinkup_homepage_introstyle == 'option1' ) {
			$style      = 'style1';
			$class      = NULL;
			$wrap_start = NULL;
			$wrap_end   = NULL;
		} else if ( $thinkup_homepage_introstyle == 'option2' ) {
			$style      = 'style2';
			$class     = ' one_third last';
			$wrap_start = '<div class="action-message two_third">';
			$wrap_end   = '</div>';
		}

		echo '<div id="introaction" class="' . esc_attr( $style ) . '"><div id="introaction-core">';

			echo $wrap_start;

			echo '<div class="action-text">',
				 '<h3>' . esc_html( $thinkup_homepage_introaction ) . '</h3>',
				 '</div>';

			echo '<div class="action-teaser">',
				 wpautop( esc_html( $thinkup_homepage_introactionteaser ) ),
				 '</div>';

			echo $wrap_end;

			if ( ( !empty( $thinkup_homepage_introactionlink1) and $thinkup_homepage_introactionlink1 !== 'option3' ) ) {

				// Set default value of buttons to "Read more"
				if( empty( $thinkup_homepage_introactiontext1 ) ) { $thinkup_homepage_introactiontext1 = __( 'Read More', 'experon' ); }
				
				echo '<div class="action-link' . $class . '">';
					// Add call to action button 1
					if ( $thinkup_homepage_introactionlink1 == 'option1' ) {
						echo '<a class="themebutton" href="' . esc_url( get_permalink( $thinkup_homepage_introactionpage1 ) ) . '">',
						esc_html( $thinkup_homepage_introactiontext1 ),
						'</a>';
					} else if ( $thinkup_homepage_introactionlink1 == 'option2' ) {
						echo '<a class="themebutton" href="' . esc_url( $thinkup_homepage_introactioncustom1 ) . '">',
						esc_html( $thinkup_homepage_introactiontext1 ),
						'</a>';
					}
				echo '</div>';
			}

		echo '</div></div>';
	}
}


?>