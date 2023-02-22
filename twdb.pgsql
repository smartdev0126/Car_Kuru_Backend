--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_interface_theme; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.admin_interface_theme (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    active boolean NOT NULL,
    title character varying(50) NOT NULL,
    title_visible boolean NOT NULL,
    logo character varying(100) NOT NULL,
    logo_visible boolean NOT NULL,
    css_header_background_color character varying(10) NOT NULL,
    title_color character varying(10) NOT NULL,
    css_header_text_color character varying(10) NOT NULL,
    css_header_link_color character varying(10) NOT NULL,
    css_header_link_hover_color character varying(10) NOT NULL,
    css_module_background_color character varying(10) NOT NULL,
    css_module_text_color character varying(10) NOT NULL,
    css_module_link_color character varying(10) NOT NULL,
    css_module_link_hover_color character varying(10) NOT NULL,
    css_module_rounded_corners boolean NOT NULL,
    css_generic_link_color character varying(10) NOT NULL,
    css_generic_link_hover_color character varying(10) NOT NULL,
    css_save_button_background_color character varying(10) NOT NULL,
    css_save_button_background_hover_color character varying(10) NOT NULL,
    css_save_button_text_color character varying(10) NOT NULL,
    css_delete_button_background_color character varying(10) NOT NULL,
    css_delete_button_background_hover_color character varying(10) NOT NULL,
    css_delete_button_text_color character varying(10) NOT NULL,
    list_filter_dropdown boolean NOT NULL,
    related_modal_active boolean NOT NULL,
    related_modal_background_color character varying(10) NOT NULL,
    related_modal_rounded_corners boolean NOT NULL,
    logo_color character varying(10) NOT NULL,
    recent_actions_visible boolean NOT NULL,
    favicon character varying(100) NOT NULL,
    related_modal_background_opacity character varying(5) NOT NULL,
    env_name character varying(50) NOT NULL,
    env_visible_in_header boolean NOT NULL,
    env_color character varying(10) NOT NULL,
    env_visible_in_favicon boolean NOT NULL,
    related_modal_close_button_visible boolean NOT NULL,
    language_chooser_active boolean NOT NULL,
    language_chooser_display character varying(10) NOT NULL,
    list_filter_sticky boolean NOT NULL,
    form_pagination_sticky boolean NOT NULL,
    form_submit_sticky boolean NOT NULL,
    css_module_background_selected_color character varying(10) NOT NULL,
    css_module_link_selected_color character varying(10) NOT NULL,
    logo_max_height smallint NOT NULL,
    logo_max_width smallint NOT NULL,
    foldable_apps boolean NOT NULL,
    CONSTRAINT admin_interface_theme_logo_max_height_check CHECK ((logo_max_height >= 0)),
    CONSTRAINT admin_interface_theme_logo_max_width_check CHECK ((logo_max_width >= 0))
);


ALTER TABLE public.admin_interface_theme OWNER TO buznatsdb;

--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.admin_interface_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_interface_theme_id_seq OWNER TO buznatsdb;

--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.admin_interface_theme_id_seq OWNED BY public.admin_interface_theme.id;


--
-- Name: apps_aboutus; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_aboutus (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    image character varying(254) NOT NULL,
    title text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.apps_aboutus OWNER TO buznatsdb;

--
-- Name: apps_aboutus_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_aboutus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_aboutus_id_seq OWNER TO buznatsdb;

--
-- Name: apps_aboutus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_aboutus_id_seq OWNED BY public.apps_aboutus.id;


--
-- Name: apps_addon; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_addon (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    add_on_category_id integer
);


ALTER TABLE public.apps_addon OWNER TO buznatsdb;

--
-- Name: apps_addon_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_addon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_addon_id_seq OWNER TO buznatsdb;

--
-- Name: apps_addon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_addon_id_seq OWNED BY public.apps_addon.id;


--
-- Name: apps_addoncategory; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_addoncategory (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.apps_addoncategory OWNER TO buznatsdb;

--
-- Name: apps_addoncategory_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_addoncategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_addoncategory_id_seq OWNER TO buznatsdb;

--
-- Name: apps_addoncategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_addoncategory_id_seq OWNED BY public.apps_addoncategory.id;


--
-- Name: apps_banner; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_banner (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    image character varying(254) NOT NULL,
    is_active boolean NOT NULL,
    note text NOT NULL,
    food_id integer
);


ALTER TABLE public.apps_banner OWNER TO buznatsdb;

--
-- Name: apps_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_banner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_banner_id_seq OWNER TO buznatsdb;

--
-- Name: apps_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_banner_id_seq OWNED BY public.apps_banner.id;


--
-- Name: apps_blog; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_blog (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    image character varying(254) NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.apps_blog OWNER TO buznatsdb;

--
-- Name: apps_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_blog_id_seq OWNER TO buznatsdb;

--
-- Name: apps_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_blog_id_seq OWNED BY public.apps_blog.id;


--
-- Name: apps_cart; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_cart (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    quantity integer NOT NULL,
    if_canceled text NOT NULL,
    instruction text NOT NULL,
    total_price integer NOT NULL,
    food_id integer,
    device_id text NOT NULL,
    user_id integer,
    status integer NOT NULL
);


ALTER TABLE public.apps_cart OWNER TO buznatsdb;

--
-- Name: apps_cart_add_on; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_cart_add_on (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    addon_id integer NOT NULL
);


ALTER TABLE public.apps_cart_add_on OWNER TO buznatsdb;

--
-- Name: apps_cart_add_on_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_cart_add_on_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_cart_add_on_id_seq OWNER TO buznatsdb;

--
-- Name: apps_cart_add_on_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_cart_add_on_id_seq OWNED BY public.apps_cart_add_on.id;


--
-- Name: apps_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_cart_id_seq OWNER TO buznatsdb;

--
-- Name: apps_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_cart_id_seq OWNED BY public.apps_cart.id;


--
-- Name: apps_cart_sides; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_cart_sides (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    food_id integer NOT NULL
);


ALTER TABLE public.apps_cart_sides OWNER TO buznatsdb;

--
-- Name: apps_cart_sides_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_cart_sides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_cart_sides_id_seq OWNER TO buznatsdb;

--
-- Name: apps_cart_sides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_cart_sides_id_seq OWNED BY public.apps_cart_sides.id;


--
-- Name: apps_category; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_category (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.apps_category OWNER TO buznatsdb;

--
-- Name: apps_category_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_category_id_seq OWNER TO buznatsdb;

--
-- Name: apps_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_category_id_seq OWNED BY public.apps_category.id;


--
-- Name: apps_cook; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_cook (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    another_phone character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    primary_region character varying(50) NOT NULL,
    thana character varying(50) NOT NULL,
    district character varying(50) NOT NULL,
    firebase_token text NOT NULL,
    lat double precision,
    lng double precision,
    status smallint NOT NULL
);


ALTER TABLE public.apps_cook OWNER TO buznatsdb;

--
-- Name: apps_cook_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_cook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_cook_id_seq OWNER TO buznatsdb;

--
-- Name: apps_cook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_cook_id_seq OWNED BY public.apps_cook.id;


--
-- Name: apps_faq; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_faq (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.apps_faq OWNER TO buznatsdb;

--
-- Name: apps_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_faq_id_seq OWNER TO buznatsdb;

--
-- Name: apps_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_faq_id_seq OWNED BY public.apps_faq.id;


--
-- Name: apps_food; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_food (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL,
    image character varying(254) NOT NULL,
    price double precision NOT NULL,
    category_id integer,
    "group" smallint NOT NULL,
    cook_id integer NOT NULL
);


ALTER TABLE public.apps_food OWNER TO buznatsdb;

--
-- Name: apps_food_add_ons; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_food_add_ons (
    id integer NOT NULL,
    food_id integer NOT NULL,
    addon_id integer NOT NULL
);


ALTER TABLE public.apps_food_add_ons OWNER TO buznatsdb;

--
-- Name: apps_food_add_ons_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_food_add_ons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_food_add_ons_id_seq OWNER TO buznatsdb;

--
-- Name: apps_food_add_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_food_add_ons_id_seq OWNED BY public.apps_food_add_ons.id;


--
-- Name: apps_food_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_food_id_seq OWNER TO buznatsdb;

--
-- Name: apps_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_food_id_seq OWNED BY public.apps_food.id;


--
-- Name: apps_food_ingredient; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_food_ingredient (
    id integer NOT NULL,
    food_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.apps_food_ingredient OWNER TO buznatsdb;

--
-- Name: apps_food_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_food_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_food_ingredient_id_seq OWNER TO buznatsdb;

--
-- Name: apps_food_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_food_ingredient_id_seq OWNED BY public.apps_food_ingredient.id;


--
-- Name: apps_food_sides; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_food_sides (
    id integer NOT NULL,
    from_food_id integer NOT NULL,
    to_food_id integer NOT NULL
);


ALTER TABLE public.apps_food_sides OWNER TO buznatsdb;

--
-- Name: apps_food_sides_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_food_sides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_food_sides_id_seq OWNER TO buznatsdb;

--
-- Name: apps_food_sides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_food_sides_id_seq OWNED BY public.apps_food_sides.id;


--
-- Name: apps_ingredient; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_ingredient (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    image character varying(254) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.apps_ingredient OWNER TO buznatsdb;

--
-- Name: apps_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_ingredient_id_seq OWNER TO buznatsdb;

--
-- Name: apps_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_ingredient_id_seq OWNED BY public.apps_ingredient.id;


--
-- Name: apps_notification; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_notification (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.apps_notification OWNER TO buznatsdb;

--
-- Name: apps_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_notification_id_seq OWNER TO buznatsdb;

--
-- Name: apps_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_notification_id_seq OWNED BY public.apps_notification.id;


--
-- Name: apps_orderdetails; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_orderdetails (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    order_identifier character varying(128) NOT NULL,
    status smallint NOT NULL,
    ts_delivery timestamp with time zone,
    payment_method smallint NOT NULL,
    online_paid_amount double precision NOT NULL,
    delivery_charge double precision NOT NULL,
    discount_amount double precision NOT NULL,
    point_redeem_amount double precision NOT NULL,
    tax double precision NOT NULL,
    total_bill double precision NOT NULL,
    refund_amount double precision NOT NULL,
    final_bill double precision NOT NULL,
    online_payment_details jsonb,
    recipient_lat double precision,
    recipient_lng double precision,
    recipient_phone character varying(24),
    recipient_name character varying(128),
    recipient_address character varying(256),
    review character varying(256) NOT NULL,
    rating smallint NOT NULL,
    is_reviewed boolean NOT NULL,
    is_skipped_review boolean NOT NULL,
    time_slot smallint NOT NULL,
    note character varying(512),
    task_completion_image character varying(100),
    ordered_by_id integer
);


ALTER TABLE public.apps_orderdetails OWNER TO buznatsdb;

--
-- Name: apps_orderdetails_cart; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_orderdetails_cart (
    id integer NOT NULL,
    orderdetails_id integer NOT NULL,
    cart_id integer NOT NULL
);


ALTER TABLE public.apps_orderdetails_cart OWNER TO buznatsdb;

--
-- Name: apps_orderdetails_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_orderdetails_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_orderdetails_cart_id_seq OWNER TO buznatsdb;

--
-- Name: apps_orderdetails_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_orderdetails_cart_id_seq OWNED BY public.apps_orderdetails_cart.id;


--
-- Name: apps_orderdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_orderdetails_id_seq OWNER TO buznatsdb;

--
-- Name: apps_orderdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_orderdetails_id_seq OWNED BY public.apps_orderdetails.id;


--
-- Name: apps_payment; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_payment (
    id integer NOT NULL,
    gateway smallint NOT NULL,
    vendor_uid character varying(1024) NOT NULL,
    payment_uid character varying(1024),
    state smallint NOT NULL,
    amount double precision NOT NULL,
    details jsonb,
    currency smallint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    order_id integer,
    user_id integer,
    CONSTRAINT apps_payment_currency_check CHECK ((currency >= 0)),
    CONSTRAINT apps_payment_gateway_check CHECK ((gateway >= 0)),
    CONSTRAINT apps_payment_state_check CHECK ((state >= 0))
);


ALTER TABLE public.apps_payment OWNER TO buznatsdb;

--
-- Name: apps_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_payment_id_seq OWNER TO buznatsdb;

--
-- Name: apps_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_payment_id_seq OWNED BY public.apps_payment.id;


--
-- Name: apps_settings; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_settings (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    company_name text NOT NULL,
    url text NOT NULL,
    system_email text NOT NULL,
    smtp_host text NOT NULL,
    smtp_user text NOT NULL,
    smtp_password text NOT NULL,
    smtp_port text NOT NULL,
    company_bin text NOT NULL,
    ssl_id text NOT NULL,
    ssl_pass text NOT NULL,
    radius double precision NOT NULL
);


ALTER TABLE public.apps_settings OWNER TO buznatsdb;

--
-- Name: apps_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_settings_id_seq OWNER TO buznatsdb;

--
-- Name: apps_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_settings_id_seq OWNED BY public.apps_settings.id;


--
-- Name: apps_subaddon; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_subaddon (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    add_on_id integer
);


ALTER TABLE public.apps_subaddon OWNER TO buznatsdb;

--
-- Name: apps_subaddon_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_subaddon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_subaddon_id_seq OWNER TO buznatsdb;

--
-- Name: apps_subaddon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_subaddon_id_seq OWNED BY public.apps_subaddon.id;


--
-- Name: apps_user; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.apps_user (
    id integer NOT NULL,
    ts_created timestamp with time zone NOT NULL,
    ts_updated timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    password character varying(18) NOT NULL,
    email character varying(100),
    mobile_info text NOT NULL,
    facebook character varying(18) NOT NULL,
    google character varying(18) NOT NULL,
    image character varying(200) NOT NULL,
    phone character varying(18) NOT NULL,
    type smallint NOT NULL,
    category smallint NOT NULL
);


ALTER TABLE public.apps_user OWNER TO buznatsdb;

--
-- Name: apps_user_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.apps_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_user_id_seq OWNER TO buznatsdb;

--
-- Name: apps_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.apps_user_id_seq OWNED BY public.apps_user.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO buznatsdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO buznatsdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO buznatsdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO buznatsdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO buznatsdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO buznatsdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO buznatsdb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO buznatsdb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO buznatsdb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO buznatsdb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO buznatsdb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO buznatsdb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO buznatsdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO buznatsdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO buznatsdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO buznatsdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO buznatsdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: buznatsdb
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO buznatsdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: buznatsdb
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: buznatsdb
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO buznatsdb;

--
-- Name: admin_interface_theme id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.admin_interface_theme ALTER COLUMN id SET DEFAULT nextval('public.admin_interface_theme_id_seq'::regclass);


--
-- Name: apps_aboutus id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_aboutus ALTER COLUMN id SET DEFAULT nextval('public.apps_aboutus_id_seq'::regclass);


--
-- Name: apps_addon id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_addon ALTER COLUMN id SET DEFAULT nextval('public.apps_addon_id_seq'::regclass);


--
-- Name: apps_addoncategory id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_addoncategory ALTER COLUMN id SET DEFAULT nextval('public.apps_addoncategory_id_seq'::regclass);


--
-- Name: apps_banner id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_banner ALTER COLUMN id SET DEFAULT nextval('public.apps_banner_id_seq'::regclass);


--
-- Name: apps_blog id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_blog ALTER COLUMN id SET DEFAULT nextval('public.apps_blog_id_seq'::regclass);


--
-- Name: apps_cart id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart ALTER COLUMN id SET DEFAULT nextval('public.apps_cart_id_seq'::regclass);


--
-- Name: apps_cart_add_on id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_add_on ALTER COLUMN id SET DEFAULT nextval('public.apps_cart_add_on_id_seq'::regclass);


--
-- Name: apps_cart_sides id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_sides ALTER COLUMN id SET DEFAULT nextval('public.apps_cart_sides_id_seq'::regclass);


--
-- Name: apps_category id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_category ALTER COLUMN id SET DEFAULT nextval('public.apps_category_id_seq'::regclass);


--
-- Name: apps_cook id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cook ALTER COLUMN id SET DEFAULT nextval('public.apps_cook_id_seq'::regclass);


--
-- Name: apps_faq id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_faq ALTER COLUMN id SET DEFAULT nextval('public.apps_faq_id_seq'::regclass);


--
-- Name: apps_food id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food ALTER COLUMN id SET DEFAULT nextval('public.apps_food_id_seq'::regclass);


--
-- Name: apps_food_add_ons id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_add_ons ALTER COLUMN id SET DEFAULT nextval('public.apps_food_add_ons_id_seq'::regclass);


--
-- Name: apps_food_ingredient id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_ingredient ALTER COLUMN id SET DEFAULT nextval('public.apps_food_ingredient_id_seq'::regclass);


--
-- Name: apps_food_sides id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_sides ALTER COLUMN id SET DEFAULT nextval('public.apps_food_sides_id_seq'::regclass);


--
-- Name: apps_ingredient id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_ingredient ALTER COLUMN id SET DEFAULT nextval('public.apps_ingredient_id_seq'::regclass);


--
-- Name: apps_notification id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_notification ALTER COLUMN id SET DEFAULT nextval('public.apps_notification_id_seq'::regclass);


--
-- Name: apps_orderdetails id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails ALTER COLUMN id SET DEFAULT nextval('public.apps_orderdetails_id_seq'::regclass);


--
-- Name: apps_orderdetails_cart id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails_cart ALTER COLUMN id SET DEFAULT nextval('public.apps_orderdetails_cart_id_seq'::regclass);


--
-- Name: apps_payment id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_payment ALTER COLUMN id SET DEFAULT nextval('public.apps_payment_id_seq'::regclass);


--
-- Name: apps_settings id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_settings ALTER COLUMN id SET DEFAULT nextval('public.apps_settings_id_seq'::regclass);


--
-- Name: apps_subaddon id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_subaddon ALTER COLUMN id SET DEFAULT nextval('public.apps_subaddon_id_seq'::regclass);


--
-- Name: apps_user id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_user ALTER COLUMN id SET DEFAULT nextval('public.apps_user_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: admin_interface_theme; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.admin_interface_theme (id, name, active, title, title_visible, logo, logo_visible, css_header_background_color, title_color, css_header_text_color, css_header_link_color, css_header_link_hover_color, css_module_background_color, css_module_text_color, css_module_link_color, css_module_link_hover_color, css_module_rounded_corners, css_generic_link_color, css_generic_link_hover_color, css_save_button_background_color, css_save_button_background_hover_color, css_save_button_text_color, css_delete_button_background_color, css_delete_button_background_hover_color, css_delete_button_text_color, list_filter_dropdown, related_modal_active, related_modal_background_color, related_modal_rounded_corners, logo_color, recent_actions_visible, favicon, related_modal_background_opacity, env_name, env_visible_in_header, env_color, env_visible_in_favicon, related_modal_close_button_visible, language_chooser_active, language_chooser_display, list_filter_sticky, form_pagination_sticky, form_submit_sticky, css_module_background_selected_color, css_module_link_selected_color, logo_max_height, logo_max_width, foldable_apps) FROM stdin;
1	Django	t	BiteClub Admin	t	admin-interface/logo/logo2_1.svg	t	#0C4B33	#F5DD5D	#44B78B	#FFFFFF	#C9F0DD	#44B78B	#FFFFFF	#FFFFFF	#C9F0DD	t	#0C3C26	#156641	#0C4B33	#0C3C26	#FFFFFF	#BA2121	#A41515	#FFFFFF	t	t	#000000	t	#FFFFFF	t		0.3		t	#E74C3C	t	t	t	code	t	f	f	#FFFFCC	#FFFFFF	100	400	t
2	Bootstrap	f	Django administration	f		t	#FFFFFF	#503873	#463265	#463265	#7351A6	#7351A6	#FFFFFF	#CDBFE3	#FFFFFF	t	#463265	#7351A6	#5CB85C	#449D44	#FFFFFF	#D9534F	#C9302C	#FFFFFF	f	t	#503873	t	#503873	t		0.2		t	#E74C3C	t	t	t	code	t	f	f	#FFFFCC	#FFFFFF	100	400	t
\.


--
-- Data for Name: apps_aboutus; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_aboutus (id, ts_created, ts_updated, image, title, description) FROM stdin;
\.


--
-- Data for Name: apps_addon; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_addon (id, ts_created, ts_updated, title, description, price, add_on_category_id) FROM stdin;
4	2022-03-10 10:50:42.391252+00	2022-03-10 10:50:42.814768+00	Regular Spicy	asdasd	10	4
5	2022-03-10 10:51:14.395386+00	2022-03-10 10:51:14.823084+00	More Spicy	More Spicy	20	4
6	2022-03-10 10:51:33.485579+00	2022-03-10 10:51:33.909472+00	Naga Spicy	Naga Spicy	30	4
\.


--
-- Data for Name: apps_addoncategory; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_addoncategory (id, ts_created, ts_updated, title, description) FROM stdin;
2	2022-01-11 07:25:55.671294+00	2022-01-11 07:25:55.671871+00	Choice Of Dips	Choice Of Dips
3	2022-01-11 07:28:34.444452+00	2022-01-11 07:28:34.444969+00	Toppings For Burger	Toppings For Burger
4	2022-03-10 10:50:02.241904+00	2022-03-10 10:50:02.242632+00	Spicy Level	Level of spicy
\.


--
-- Data for Name: apps_banner; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_banner (id, ts_created, ts_updated, image, is_active, note, food_id) FROM stdin;
2	2022-01-11 09:38:11.071644+00	2022-01-11 09:39:13.124869+00	None/Rectangle_12.png	t		3
4	2022-01-31 19:18:52.973303+00	2022-01-31 19:18:53.395899+00	None/Rectangle_12_1nTUwtm.png	t	ajkbdsbkjabsd	3
\.


--
-- Data for Name: apps_blog; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_blog (id, ts_created, ts_updated, image, title, description, "position") FROM stdin;
\.


--
-- Data for Name: apps_cart; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_cart (id, ts_created, ts_updated, quantity, if_canceled, instruction, total_price, food_id, device_id, user_id, status) FROM stdin;
188	2022-02-27 11:38:09.686784+00	2022-02-27 11:59:39.751059+00	2			1	5		7	2
189	2022-02-27 11:41:54.43658+00	2022-02-27 11:59:40.458829+00	2			1	5		7	2
146	2022-02-22 10:53:24.942249+00	2022-02-22 11:05:25.148355+00	2	Cancel Order	Please make it fast	300	2		7	2
190	2022-02-27 11:42:03.260993+00	2022-02-27 11:59:41.166813+00	2			1	5		7	2
104	2022-02-17 09:41:22.431074+00	2022-02-17 09:44:08.177184+00	2			1000	3		7	2
192	2022-02-27 12:02:26.009216+00	2022-02-27 12:04:36.789544+00	2			1	9		7	2
193	2022-02-27 12:04:03.562682+00	2022-02-27 12:04:37.492745+00	3			1	9		7	2
173	2022-02-23 07:33:33.069673+00	2022-02-23 11:19:56.082223+00	1			178	3		7	2
106	2022-02-17 10:30:52.992426+00	2022-02-20 07:42:23.204445+00	2			1	3		7	2
88	2022-02-13 11:15:11.154802+00	2022-02-13 11:50:02.157597+00	16			3200	5	01010	\N	2
174	2022-02-24 05:52:32.638143+00	2022-02-24 05:52:32.638852+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
172	2022-02-23 07:31:01.502235+00	2022-02-24 07:24:09.279591+00	2			356	3		7	2
107	2022-02-17 10:38:17.971433+00	2022-02-20 09:33:47.745755+00	2			400	5		7	2
194	2022-02-27 12:35:09.541371+00	2022-02-27 12:38:23.89497+00	2			1	5		7	2
89	2022-02-13 11:50:50.219267+00	2022-02-13 19:53:22.258923+00	11			220	4	01010	\N	2
91	2022-02-13 19:32:46.456617+00	2022-02-13 19:53:22.966949+00	20			1	3	01010	\N	2
78	2022-02-13 07:11:03.00562+00	2022-02-13 10:08:56.275411+00	1			1	5	01010	\N	2
79	2022-02-13 07:11:05.138618+00	2022-02-13 10:08:56.979107+00	10			1	5	01010	\N	2
195	2022-02-28 04:47:38.395815+00	2022-02-28 04:49:33.266959+00	1	Call Me	ddd	303	10		7	2
92	2022-02-13 19:55:14.705979+00	2022-02-13 20:03:15.032832+00	3			60	4	01010	\N	2
93	2022-02-13 20:02:39.420056+00	2022-02-13 20:03:52.506968+00	20			1	4	01010	\N	2
22	2022-02-05 03:52:49.61561+00	2022-02-05 03:52:51.441959+00	2	Cancel Order	Please make it fast.	1	2	22	\N	0
23	2022-02-05 03:53:17.458129+00	2022-02-05 03:53:19.294193+00	2	Cancel Order	Please make it fast.	1	2	4568	\N	0
196	2022-02-28 06:54:11.754148+00	2022-02-28 07:13:06.298967+00	2			356	3		7	2
24	2022-02-05 03:54:33.038655+00	2022-02-05 03:54:34.907137+00	2		Please make it fast.	1	2	4568	\N	0
25	2022-02-05 09:09:03.525102+00	2022-02-05 09:09:05.456459+00	2	edsf	sdfdsf	1	2	2423	\N	0
26	2022-02-05 09:10:02.340411+00	2022-02-05 09:10:04.166956+00	2	edsf	sdfdsf	1	2	2423	\N	0
94	2022-02-13 20:02:41.070567+00	2022-02-13 20:25:48.784749+00	20			400	4	01010	\N	2
27	2022-02-05 09:11:46.851566+00	2022-02-05 09:11:48.690347+00	2	edsf	sdfdsf	1	2	2423	\N	0
95	2022-02-13 20:02:42.312697+00	2022-02-13 20:25:49.489772+00	20			1	4	01010	\N	2
28	2022-02-05 09:14:39.302976+00	2022-02-05 09:14:41.144225+00	2	edsf	sdfdsf	1	2		\N	0
197	2022-02-28 07:59:55.587886+00	2022-02-28 08:00:21.94503+00	3			1038	8		7	2
29	2022-02-05 09:15:58.800359+00	2022-02-05 09:16:00.747336+00	2	edsf	sdfdsf	1	2	2423	\N	0
30	2022-02-06 06:29:22.580799+00	2022-02-06 06:29:24.410288+00	2	edsf	sdfdsf	1	2	2423	\N	0
31	2022-02-06 06:29:44.140666+00	2022-02-06 06:29:45.974548+00	5	edsf	sdfdsf	1	5	2423	\N	0
33	2022-02-07 11:09:27.539768+00	2022-02-07 11:09:29.378957+00	2	asd	asd	1	2		\N	0
34	2022-02-07 11:18:33.03761+00	2022-02-07 11:18:34.870858+00	2	asd	asd	1	2		\N	0
219	2022-03-01 10:31:08.226922+00	2022-03-01 11:13:58.829301+00	1			303	10		7	2
35	2022-02-07 11:31:33.862637+00	2022-02-07 11:31:35.70968+00	2	asd	asd	1	2		\N	0
36	2022-02-07 11:57:06.652021+00	2022-02-07 11:57:06.652347+00	2	asd	asd	1	2		\N	0
125	2022-02-22 06:49:09.137332+00	2022-02-22 09:30:24.469933+00	1			1	2		7	2
126	2022-02-22 06:50:42.453786+00	2022-02-22 09:58:17.591804+00	2			400	5		7	2
41	2022-02-08 09:15:23.258814+00	2022-02-08 09:15:23.259223+00	2			1	2		\N	0
42	2022-02-08 09:15:36.951797+00	2022-02-08 09:15:36.952096+00	2			1	2		\N	0
170	2022-02-23 05:44:37.201237+00	2022-02-27 07:45:56.699818+00	4			600	5		7	2
127	2022-02-22 10:08:32.636657+00	2022-02-22 10:11:20.162983+00	2	Cancel the entire order	sds	1	5		7	2
171	2022-02-23 07:26:50.479328+00	2022-02-27 07:45:57.405372+00	2			1	3		7	2
96	2022-02-13 20:28:32.613092+00	2022-02-14 05:43:25.900768+00	2			1000	3	01010	\N	2
97	2022-02-13 20:28:36.941431+00	2022-02-14 05:43:26.603713+00	18			9000	3	01010	\N	2
223	2022-03-02 07:36:41.544702+00	2022-03-02 07:37:20.620825+00	4			1340	2		38	2
128	2022-02-22 10:16:49.016186+00	2022-02-22 10:17:18.846563+00	1	Cancel the entire order	faf	1	5		7	2
129	2022-02-22 10:18:47.875816+00	2022-02-22 10:19:08.282386+00	2			1	5		7	2
130	2022-02-22 10:20:21.23479+00	2022-02-22 10:20:54.443909+00	1	Cancel the entire order	aedf	1	5		7	2
178	2022-02-27 08:22:38.549071+00	2022-02-27 08:41:09.493186+00	2			198	6		7	2
221	2022-03-02 04:31:42.820376+00	2022-03-02 10:30:27.222046+00	1			1	10		7	2
100	2022-02-16 06:31:48.615308+00	2022-02-17 06:51:35.37653+00	2			1000	3		7	2
101	2022-02-16 06:32:45.284895+00	2022-02-17 06:51:36.085164+00	2			1	4		7	2
102	2022-02-16 07:32:35.602928+00	2022-02-17 06:51:36.794105+00	2	Cancel Order	Please make it fast.	1540	3		7	2
168	2022-02-23 05:07:04.278831+00	2022-02-23 05:26:06.275068+00	1			346	8		7	2
169	2022-02-23 05:08:53.150984+00	2022-02-23 05:26:06.983835+00	2			420	9		7	2
222	2022-03-02 04:47:30.982007+00	2022-03-02 10:30:27.927994+00	2			334	4		7	2
179	2022-02-27 08:41:42.811495+00	2022-02-27 10:22:53.464182+00	3			501	4		7	2
182	2022-02-27 10:43:09.30435+00	2022-02-27 10:43:58.24148+00	1			178	3		7	2
183	2022-02-27 10:43:31.163131+00	2022-02-27 10:46:17.180136+00	2			356	3		7	2
229	2022-03-02 10:52:28.348423+00	2022-03-02 10:53:06.426287+00	2			1	6		39	2
186	2022-02-27 10:52:58.914005+00	2022-02-27 10:54:01.488055+00	2			1	9		7	2
185	2022-02-27 10:52:23.686766+00	2022-02-27 11:01:27.02167+00	2			1	10		7	2
187	2022-02-27 11:08:30.766384+00	2022-02-27 11:10:58.947161+00	12			1	6		7	2
184	2022-02-27 10:52:17.402806+00	2022-02-27 11:34:42.228224+00	1			1	3		7	2
191	2022-02-27 11:42:49.561726+00	2022-02-27 11:44:47.627362+00	2			1	5		7	2
227	2022-03-02 10:45:39.543449+00	2022-03-03 06:49:55.84981+00	2			1	5		7	2
215	2022-03-01 09:53:07.480597+00	2022-03-01 09:53:07.480984+00	3			1	5		37	0
228	2022-03-02 10:46:45.961434+00	2022-03-03 06:49:56.552734+00	2			1	5		7	2
230	2022-03-02 10:52:30.297777+00	2022-03-03 06:49:57.256151+00	1			1	5		7	2
231	2022-03-02 10:53:04.459447+00	2022-03-03 06:49:57.960677+00	1			1	5		7	2
232	2022-03-02 10:53:38.095812+00	2022-03-03 06:49:58.663115+00	1			1	5		7	2
233	2022-03-02 11:07:17.333403+00	2022-03-03 06:49:59.365799+00	2			1	5		7	2
234	2022-03-02 11:11:25.606645+00	2022-03-03 06:50:00.069972+00	2			1	5		7	2
235	2022-03-02 11:16:03.135132+00	2022-03-03 06:50:00.802196+00	1			1	5		7	2
236	2022-03-02 11:18:06.827154+00	2022-03-03 06:50:01.529221+00	1			1	5		7	2
237	2022-03-02 11:18:40.198631+00	2022-03-03 06:50:02.238084+00	1			1	5		7	2
238	2022-03-02 11:20:30.723319+00	2022-03-03 06:50:02.941277+00	1			1	5		7	2
226	2022-03-02 10:45:16.383643+00	2022-03-03 06:50:03.645421+00	2			300	5		7	2
239	2022-03-02 11:22:53.352397+00	2022-03-03 06:50:04.349383+00	1			1	5		7	2
240	2022-03-02 11:26:41.897145+00	2022-03-03 06:50:05.053358+00	1			1	5		7	2
241	2022-03-03 05:10:00.376914+00	2022-03-03 06:50:05.755966+00	1			1	10		7	2
242	2022-03-03 05:40:29.410004+00	2022-03-03 06:50:06.458524+00	1			1	10		7	2
243	2022-03-03 05:41:17.43478+00	2022-03-03 06:50:07.163167+00	1			1	10		7	2
247	2022-03-03 07:36:39.566233+00	2022-03-03 07:36:53.799584+00	1			1	5		7	2
225	2022-03-02 10:42:42.258157+00	2022-03-03 06:49:55.1455+00	2			1	5		7	2
244	2022-03-03 05:42:09.635235+00	2022-03-03 06:50:07.866221+00	1			1	10		7	2
245	2022-03-03 05:43:16.058547+00	2022-03-03 06:50:08.56934+00	1			1	10		7	2
246	2022-03-03 05:43:56.827832+00	2022-03-03 06:50:09.274053+00	1			1	10		7	2
312	2022-03-10 06:40:09.58518+00	2022-03-10 06:42:27.669415+00	1	Cancel Order	Please make it fast.	1	6		7	2
250	2022-03-06 07:48:54.679724+00	2022-03-06 11:58:30.297308+00	1			1	6		7	2
248	2022-03-06 06:08:40.923854+00	2022-03-06 11:58:31.003986+00	2			198	6		7	2
249	2022-03-06 06:15:46.729504+00	2022-03-06 11:58:31.710385+00	3			297	6		7	2
251	2022-03-06 07:49:52.967296+00	2022-03-06 11:58:32.415688+00	1			1	5		7	2
252	2022-03-06 07:51:37.317333+00	2022-03-06 11:58:33.121+00	2			1	3		7	2
253	2022-03-06 07:51:40.407049+00	2022-03-06 11:58:33.826529+00	2			1	3		7	2
254	2022-03-06 07:51:57.761615+00	2022-03-06 11:58:34.532651+00	2			1	3		7	2
255	2022-03-06 07:52:40.932956+00	2022-03-06 11:58:35.238459+00	12			1	3		7	2
256	2022-03-06 07:57:26.92783+00	2022-03-06 11:58:35.944846+00	1			1	3		7	2
257	2022-03-06 07:59:59.80301+00	2022-03-06 11:58:36.64984+00	1			1	3		7	2
258	2022-03-06 08:00:26.620038+00	2022-03-06 11:58:37.355254+00	1			1	3		7	2
259	2022-03-06 08:10:27.178155+00	2022-03-06 11:58:38.060741+00	1			1	3		7	2
260	2022-03-06 08:11:13.381785+00	2022-03-06 11:58:38.766869+00	2			1	3		7	2
321	2022-03-10 10:03:14.383483+00	2022-03-10 10:03:14.385197+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
322	2022-03-10 10:04:28.414578+00	2022-03-10 10:04:28.415032+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
323	2022-03-10 10:06:35.589602+00	2022-03-10 10:06:35.590118+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
324	2022-03-10 10:06:43.887822+00	2022-03-10 10:06:43.888263+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
325	2022-03-10 10:09:35.003583+00	2022-03-10 10:09:35.004076+00	2	Cancel Order	Please make it fast.	1	2	01010	\N	0
334	2022-03-13 05:24:48.020062+00	2022-03-13 08:47:53.665937+00	1			1	12		7	2
335	2022-03-13 08:31:02.072+00	2022-03-13 08:47:54.372131+00	1	Cancel Order	Please make it fast.	1	5		7	2
336	2022-03-13 08:40:12.330476+00	2022-03-13 08:47:55.125822+00	2	Cancel Order	Please make it fast.	1	16		7	2
337	2022-03-13 08:46:21.529227+00	2022-03-13 08:47:55.831237+00	1	Cancel Order	Please make it fast.	1	5		7	2
338	2022-03-13 09:52:00.53128+00	2022-03-13 09:57:22.332773+00	1	Cancel Order	Please make it fast.	1	19		7	2
339	2022-03-13 10:02:26.576818+00	2022-03-13 10:30:44.908372+00	1	Cancel Order	Please make it fast.	1	8		7	2
340	2022-03-13 11:33:26.245766+00	2022-03-14 05:53:25.485553+00	1			1	9		7	2
341	2022-03-13 12:08:09.72668+00	2022-03-14 05:53:26.190857+00	1			1	41		7	2
342	2022-03-14 05:52:27.584953+00	2022-03-14 05:53:26.897905+00	1			1	41		7	2
\.


--
-- Data for Name: apps_cart_add_on; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_cart_add_on (id, cart_id, addon_id) FROM stdin;
\.


--
-- Data for Name: apps_cart_sides; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_cart_sides (id, cart_id, food_id) FROM stdin;
16	22	3
17	23	3
18	24	3
19	25	3
20	26	3
21	27	3
22	28	3
23	29	3
24	30	3
25	31	3
27	33	3
28	34	3
29	35	3
38	102	3
\.


--
-- Data for Name: apps_category; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_category (id, ts_created, ts_updated, title, description) FROM stdin;
3	2022-01-06 05:32:49.759492+00	2022-02-22 11:15:50.611969+00	APPITIZER	All APPITIZER items will save here
6	2022-01-06 06:30:48.61132+00	2022-02-22 11:17:12.869702+00	Salads	All Salads items will save here
1	2021-12-19 07:03:35.367018+00	2022-02-22 11:18:09.16885+00	CHICKEN BURGERS	ALL CHICKEN BURGERS items will save here
4	2022-01-06 05:33:08.940629+00	2022-02-22 11:18:44.058088+00	BEEF BURGERS	All BEEF BURGERS items will save here
2	2022-01-06 05:01:50.231004+00	2022-02-22 11:19:20.232092+00	WRAPS	All WRAPS items will save here
8	2022-02-22 11:20:27.863653+00	2022-02-22 11:20:27.864284+00	PIZZA	ALL PIZZA items will be save here
9	2022-02-22 11:21:04.696434+00	2022-02-22 11:21:04.697006+00	FISH BITE	All SEA Fish item will save here
10	2022-02-22 11:21:27.784422+00	2022-02-22 11:21:27.785004+00	COLD SANDWICH	All COLD SANDWICH items will save here
5	2022-01-06 05:33:33.592105+00	2022-02-22 11:22:01.357879+00	Beverages	All SOFT DRINKS items will save here
7	2022-02-22 11:19:52.043189+00	2022-02-23 06:21:16.613762+00	SET MEALS (MEAT)	ALL SET MEALS items will save here
11	2022-02-23 06:34:09.742583+00	2022-02-23 06:34:09.743181+00	SET MEAL (FISH)	ALL SEA FISH SET MEAL WILL BE ADD HERE
12	2022-02-23 07:38:22.877253+00	2022-02-23 07:38:22.877874+00	SEA FISH PIZZA	All SEA FISH PIZZA will be add here
13	2022-02-23 09:38:37.004122+00	2022-02-23 09:38:37.004829+00	PANINI	All PANINI item will be add here
14	2022-03-14 09:54:40.907499+00	2022-03-14 09:54:40.908145+00	Custom	Customer Can Customize food
\.


--
-- Data for Name: apps_cook; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_cook (id, ts_created, ts_updated, first_name, last_name, phone, another_phone, email, primary_region, thana, district, firebase_token, lat, lng, status) FROM stdin;
1	2022-01-10 07:09:09.896325+00	2022-01-10 07:09:09.89675+00	w	w	123	456	jjjj@jjj.ss	qwe	qwe	we		12	\N	1
5	2022-01-20 11:19:50.088027+00	2022-01-20 11:19:50.088359+00	Navilur	Rahman	123456789123	123456789123	s@a.com	abc				\N	\N	3
\.


--
-- Data for Name: apps_faq; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_faq (id, ts_created, ts_updated, question, answer, "position") FROM stdin;
\.


--
-- Data for Name: apps_food; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_food (id, ts_created, ts_updated, title, description, image, price, category_id, "group", cook_id) FROM stdin;
6	2022-01-26 10:00:02.014676+00	2022-02-22 12:01:12.404+00	Classic Fries(Regular)	Classic Fries(Regular)	None/Classic_FriesRegular.jpg	99	3	1	1
5	2022-01-06 06:31:59.250619+00	2022-02-22 12:08:45.8577+00	Masala Fries(Regular)	Masala Fries(Regular)	None/Masala_FriesRegular.jpg	150	3	1	1
4	2022-01-06 05:49:53.581138+00	2022-02-23 04:27:48.52649+00	Hand Cut Potato Wedges-Served with Dipping Sauce	Hand Cut Potato Wedges-Served with Dipping Sauce	None/Hand_Cut_Potato_Wedges-Served_with_Dipping_Sauce_2.jpg	167	3	1	1
3	2022-01-05 11:13:31.254594+00	2022-02-23 04:33:43.028569+00	BBQ Chicken Wings-Served with Dipping Sauce -6pcs	BBQ Chicken Wings-Served with Dipping Sauce 6pcs	None/BBQ_Chicken_Wings-Served_with_Dipping_Sauce.jpg	178	3	1	1
7	2022-02-23 04:36:11.758209+00	2022-02-23 04:36:12.182618+00	Naga Chicken Wings-Served with Dipping Sauce 6Pcs	Naga Chicken Wings-Served with Dipping Sauce 6Pcs	None/BBQ_Chicken_Wings-Served_with_Dipping_Sauce_Q0ZDLuO.jpg	189	3	1	1
8	2022-02-23 04:37:35.006684+00	2022-02-23 04:37:35.435096+00	Naga Chicken Wings-Served with Dipping Sauce 12Pcs	Naga Chicken Wings-Served with Dipping Sauce 12Pcs	None/BBQ_Chicken_Wings-Served_with_Dipping_Sauce_NjP5i2z.jpg	346	3	1	1
10	2022-02-23 04:41:27.113472+00	2022-02-23 04:41:27.537888+00	Russian Salad 350gm	Diced Potato, Capsicum, Carrot, Cucumber, Apple and Green Peas with Fresh Mayo Dressing	None/Russian_Salad.jpg	303	6	2	1
9	2022-02-23 04:39:53.881913+00	2022-02-23 04:41:52.798312+00	Egg and Potato Salad 350gm	Roasted Diced Potato, Boiled Egg, House Special Honey Mustard Dressing, Garnished with Lemon Zest	None/Egg_and_Potato_Salad.jpg	210	3	2	1
11	2022-02-23 04:43:07.238209+00	2022-02-23 04:43:07.242374+00	Chicken Cashew Nut Salad 350gm	Stir Fried Chicken, Roasted Cashews, Capsicum, Tomato and Cucumber Fusioned with Chef's Special Sauce	None/Chicken_Cashew_Nut_Salad.jpg	293	\N	2	1
12	2022-02-23 04:45:35.576795+00	2022-02-23 04:45:36.002746+00	Classic Chicken Salad 350gm	Boiled Chicken, Cabbage, Spring Onion, Capsicum, Tomato, Butter Beans, Dressed with Special Sauce	None/Classic_Chicken_Salad.jpg	366	6	2	1
13	2022-02-23 04:45:41.820022+00	2022-02-23 04:45:42.247202+00	Classic Chicken Salad 350gm	Boiled Chicken, Cabbage, Spring Onion, Capsicum, Tomato, Butter Beans, Dressed with Special Sauce	None/Classic_Chicken_Salad_KYGg3Ut.jpg	366	6	2	1
14	2022-02-23 04:47:02.680139+00	2022-02-23 04:47:03.1062+00	Classic Tuna Salad 350gm	Tuna, Cabbage, Potato, Spring Onion, Tomato, Butter Beans, Olive Oil and Lemon Dressing	None/Classic_Tuna_Salad.jpg	349	6	2	1
15	2022-02-23 04:49:47.372414+00	2022-02-23 04:49:47.796491+00	Fresh Green Salad 350gm	Our Garden Greens with Balsamic Vinegar Dressing and Roasted Almonds	None/Fresh_Green_Salad.jpg	210	6	2	1
16	2022-02-23 04:53:42.360217+00	2022-02-23 04:53:42.787705+00	Classic Chicken Burger with Cheese and Fries	Classic Chicken Burger with Cheese and Fries	None/Crispy_Chicken_Burger_with_Cheese_and_Fries.jpg	220	1	1	1
17	2022-02-23 05:16:44.315791+00	2022-02-23 05:16:44.741866+00	Crispy Chicken Burger with Cheese and Fries	Crispy Chicken Burger with Cheese and Fries	None/Crispy_Chicken_Blaster_Burger_Doubled-Up_with_Cheese_and_Fries.jpg	275	1	1	1
18	2022-02-23 05:27:54.796935+00	2022-02-23 05:27:55.264129+00	Crispy Chicken Blaster Burger Doubled-Up with Cheese and Fries	Crispy Chicken Blaster Burger Doubled-Up with Cheese and Fries	None/Crispy_Chicken_Blaster_Burger_Doubled-Up_with_Cheese_and_Fries_1pT3NMR.jpg	330	1	1	1
19	2022-02-23 05:58:13.087337+00	2022-02-23 05:58:13.513986+00	Chicken Supreme Blaster Burger Doubled-Up with Cheese and Fries	Chicken Supreme Blaster Burger Doubled-Up with Cheese and Fries	None/Crispy_Chicken_Blaster_Burger_Doubled-Up_with_Cheese_and_Fries_1.jpg	390	1	1	1
21	2022-02-23 05:59:10.272927+00	2022-02-23 05:59:10.699235+00	Classic Beef Burger with Cheese and Fries	Classic Beef Burger with Cheese and Fries	None/Classic_Beef_Burger_with_Cheese_and_Fries_GfafL8C.jpg	270	4	1	1
23	2022-02-23 06:13:24.080101+00	2022-02-23 06:13:24.508236+00	Beef Cheese Delight with Fries	Beef Cheese Delight with Fries	None/Beef_Cheese_Delight_with_Fries.jpg	380	4	1	1
24	2022-02-23 06:19:49.17394+00	2022-02-23 06:20:18.047903+00	Set Meal 1	Egg Fried Rice, Crispy Chicken Drumstick, Chinese Vegetables and Salad	None/Set_Menu_1.jpg	245	7	1	1
25	2022-02-23 06:22:31.641073+00	2022-02-23 06:22:32.066673+00	Set Meal 2	Egg Fried Rice, 2 Pcs BBQ Chicken Drumstick, Chinese Vegetables and Salad	None/Set_Meal_2.jpg	363	7	1	1
26	2022-02-23 06:23:36.048851+00	2022-02-23 06:23:36.474618+00	Set Meal 3	Egg Fried Rice, Butter Chicken, Chinese Vegetables, Salad	None/Set_Meal_3.jpg	337	7	1	1
27	2022-02-23 06:24:57.52913+00	2022-02-23 06:24:57.956665+00	Set Meal 4	Egg Fried Rice, Spicy Masala Chicken, Chinese Vegetables, Salad	None/Set_Meal_4.jpg	337	7	1	1
28	2022-02-23 06:26:05.280454+00	2022-02-23 06:26:05.704392+00	Set Meal 5	Egg Fried Rice, Spicy Masala Beef, Chinese Vegetables, Salad	None/Set_Meal_5.jpg	454	7	1	1
29	2022-02-23 06:27:13.419654+00	2022-02-23 06:27:13.844903+00	Set Meal 6	Egg Fried Rice,Chicken Stir Fry, Chinese Vegetables, Salad	None/Set_Meal_6.jpg	414	7	1	1
30	2022-02-23 06:28:52.094037+00	2022-02-23 06:29:23.329793+00	Set Meal 7	Egg Fried Rice,Beef Stir Fry, Chinese Vegetables, Salad	None/Set_Meal_7.jpg	480	7	1	1
31	2022-02-23 06:35:16.531159+00	2022-02-23 06:35:53.502044+00	Set Meal 8	Egg Fried Rice,Sea White Fish Stir Fry, Chinese Vegetables, Salad	None/Set_Meal_8.jpg	493	11	3	1
32	2022-02-23 06:37:28.491126+00	2022-02-23 06:37:28.918796+00	Fish Pops	White Fish Pops Served with Fries, Sausages and Dipping Sauce	None/Fish_Pops.jpeg	335	9	3	1
33	2022-02-23 06:38:47.013077+00	2022-02-23 06:38:47.440834+00	Fish Fingers	5 Pieces White Fish Fingers Sided with Fries and Coleslaw	None/Fish_Fingers.jpeg	380	9	3	1
35	2022-02-23 06:57:21.838198+00	2022-02-23 06:57:22.265425+00	Fried Calamari	Served with Special Dipping Sauce	None/Fish__Chips_1.jpeg	460	9	3	1
36	2022-02-23 07:23:06.460609+00	2022-02-23 07:23:06.886094+00	Mineral Water 250ml	Any local Brand Water Bottle	None/plastic-water-bottle-label-white-background-vector-icon-plastic-water-bottle-label-white-background-183861315.jpg	10	5	1	1
37	2022-02-23 07:25:23.99243+00	2022-02-23 07:25:24.418801+00	Coca Cola Pet 250ml	Coca Cola Pet 250ml	None/coke_5.jpg	20	5	1	1
38	2022-02-23 07:27:47.950075+00	2022-02-23 07:27:48.376186+00	Sprite Pet 250ml	Sprite Pet 250ml	None/Sprite-Pet-250-ml-20-tk.jpg	20	5	1	1
39	2022-02-23 07:30:23.411896+00	2022-02-23 07:30:23.836081+00	Vegetable Salad Sandwich	Single Layered 2 Pieces White Bread Sandwich with Vegetable Salad and Sliced Cheddar Cheese	None/Vegetable_Salad_Sandwich.jpg	150	10	2	1
40	2022-02-23 07:32:11.346043+00	2022-02-23 07:32:11.772272+00	Cheese Sandwich	Single Layered 2 Pieces White Bread Sandwich with Mozzarella Cheese, Cheddar Cheese and Cream Cheese	None/Cheese_Sandwich-removebg-preview_1.png	170	10	2	1
41	2022-02-23 07:34:53.661303+00	2022-02-23 07:34:54.086868+00	Chicken Salad & Egg Sandwich	Double Layered 2 Pieces White Bread Sandwich with Chicken Salad, Cheese Omlette and Sliced Cheddar Chesse	None/Chicken_Salad__Egg_Sandwich.jpg	189	10	2	1
42	2022-02-23 07:36:04.531813+00	2022-02-23 07:36:04.95751+00	Beef Pepperoni Sandwich	Double Layered 2 Pieces White Bread Sandwich with Beef Pepperoni and Sliced Cheddar Cheese	None/Beef_Pepperoni_Sandwich.jpg	279	10	2	1
43	2022-02-23 07:40:12.761322+00	2022-02-23 07:40:13.187069+00	Seafood Special	Squid Ring, Prawn, Mozzarella Cheese, Cheddar Cheese, Black Olives, Spicy Pizza Sauce, Capsicum, Mushroom and Mixed Herbs	None/Seafood_Special.jpg	707	12	3	1
44	2022-02-23 08:04:55.980977+00	2022-02-23 08:04:56.406841+00	Chef's Special	Minced Beef, Chicken Cube, Beef Bacon, The 4 Cheese, Pizza Sauce, Mushroom, Capsicum, Onion, Red Chilli, Black Olives and Mixed Herbs	None/WhatsApp_Image_2022-02-23_at_2.04.32_PM.jpeg	775	8	1	1
45	2022-02-23 08:06:06.266788+00	2022-02-23 08:06:06.692881+00	Margherita Madness	Mozzarella Cheese, Cheddar Cheese, Special Pizza Sauce, Capsicum, Black Olives, Onion and Fried Garlic	None/Margherita_Madness.jpg	359	8	1	1
46	2022-02-23 08:07:29.481439+00	2022-02-23 08:07:29.905402+00	Chicken Heist	BBQ Chicken, Mozzarella Cheese, Cheddar Cheese, Pizza Sauce, Onion, Jalapeno, Chilli Flakes and Mixed Herbs	None/Chicken_Heist.jpg	539	8	1	1
47	2022-02-23 08:30:52.953112+00	2022-02-23 08:30:53.377989+00	Tandoori Tashki	Tandoori Chicken, Special Sauce, Mozzarella Cheese, Mushroom, Onion, Red Chilli and Mixed Herbs	None/Tandoori_Tashki.jpg	575	8	1	1
48	2022-02-23 08:32:57.794414+00	2022-02-23 08:32:58.22164+00	Mexican Fighter	Spicy Chicken, Hot Pizza Sauce, Tomato, Capsicum, Mushroom, Black Olives and Mixed Herbs	None/WhatsApp-Image-2021-01-29-at-20.05.34-6.jpeg	575	8	1	1
49	2022-02-23 09:13:35.904313+00	2022-02-23 09:13:36.329449+00	Chicken Impossible	Chicken Cube, Chicken Sausage, Special Sauce, Mozzarella Cheese, Cheddar Cheese, Capsicum, Black Olives, Chilli Flakes and Mixed Herbs	None/Chicken_Impossible.jpg	575	8	1	1
50	2022-02-23 09:15:49.00176+00	2022-02-23 09:15:49.426702+00	The Room Mafia	Loads of Mushroom, 4 Types of Cheese, Black Olives, Hot Pizza Sauce and Mixed Herbs	None/The_Room_Mafia.jpg	647	8	1	1
51	2022-02-23 09:20:42.360668+00	2022-02-23 09:20:42.788144+00	Naga Moon	Naga Chicken,Naga Flavoured Pizza Sauce,  Cheese, Mushroom, Capsicum, Black Olives and Mixed Herbs	None/download_21.jpg	695	8	1	1
52	2022-02-23 09:21:29.829892+00	2022-02-23 09:21:30.254062+00	Pepperoni Parlour	Minced Beef, Beef Pepperoni, Chef's Special Sauce, 4 Types of Cheese, Mushroom, Onion, Chilli Flakes, Mixed Herbs	None/Pepperoni_Parlour.jpg	707	8	1	1
53	2022-02-23 09:25:04.086295+00	2022-02-23 09:25:04.512428+00	Beef Blaster Burger Doubled-Up with Cheese and Fries	Beef Blaster Burger Doubled-Up with Cheese and Fries	None/Beef_Blaster_Burger_Doubled-Up_with_Cheese_and_Fries_2.jpg	410	4	1	1
54	2022-02-23 09:39:04.611965+00	2022-02-23 09:39:36.009464+00	Grilled Vegetable Panini	2 Pieces Panini, Stuffed with Sauteed Mushroom, Capsicum and Onion, Mixed with Special Sauce	None/1416331590068.jpeg	179	13	1	1
55	2022-02-23 09:44:39.145047+00	2022-02-23 09:46:22.240711+00	Pizza Panini	2 Pieces Panini Stuffed with Grilled Chicken, Sauteed Capsicum, Onion, Mushroom, Fusion with House Special Sauce, Layered with Sliced	None/download_23.jpg	305	13	1	1
57	2022-02-23 09:49:45.783082+00	2022-02-23 09:49:46.210718+00	Bacon Blast Cheese Panini	2 Pieces Panini Stuffed with Beef Bacon and Beef Pepperoni, Caramelised Onion, Layered with Sliced Cheddar Cheese	None/recipe_4586_1174459757_svTkc0y.jpg	320	13	1	1
58	2022-02-23 09:55:38.376783+00	2022-02-23 09:55:38.803078+00	LeWrap Vegan	Vegetable Salad Dressed with Special Sauce, Wrapped in Tortilla Bread	None/IMG_0377.jpg	170	2	2	1
59	2022-02-23 09:57:13.944237+00	2022-02-23 09:57:14.368681+00	Grilled Chicken Wrap	Grilled Chicken, Sauteed Vegetable, House Special Sauce, Wrapped with Tortilla Bread	None/Beef_Wrap_with_Bacon.png	259	13	2	1
60	2022-02-23 09:59:41.805387+00	2022-02-23 09:59:42.231071+00	Beef Wrap	Sliced Beef, Sauteed Vegetable, House Special Sauce, Wrapped with Tortilla Bread	None/Beef-Wrap.jpg	324	2	2	1
34	2022-02-23 06:40:00.111228+00	2022-03-02 04:36:41.659962+00	Fish & Chips	2 Pieces Coated Deep Fried White Fish Served with Fries and Coleslaw	None/Fish__Chips.jpeg	390	9	3	1
2	2021-12-19 07:09:00.289995+00	2022-03-10 10:53:13.580841+00	BBQ Chicken Wings-Served with Dipping Sauce 12pcs	BBQ Chicken Wings-Served with Dipping Sauce 12pcs	None/BBQ_Chicken_Wings-Served_with_Dipping_Sauce_E0zlyp0.jpg	335	3	1	1
61	2022-02-23 10:00:42.486819+00	2022-03-13 11:22:40.417671+00	Beef Wrap with Bacon	Sliced Beef, Beef Bacon, Sauteed Vegetable, House Special Sauce, Wrapped with Tortilla Bread	None/Grilled_Chicken_Wrap_with_Sausage_and_Salad.png	363	3	2	1
62	2022-03-15 04:29:35.72917+00	2022-03-15 04:29:36.583445+00	bb	bb	None/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2014__09__20140918-jamie-olivers-comfort-food-insanity-burger-david-loftus-f7d9042bdc2a468fbbd50b10d467dafd.jpg	10	14	1	1
63	2022-03-15 04:30:45.296749+00	2022-03-15 04:31:21.372241+00	pp	pp	None/pizza-3007395__480.jpg	15	14	1	1
\.


--
-- Data for Name: apps_food_add_ons; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_food_add_ons (id, food_id, addon_id) FROM stdin;
8	2	4
9	2	5
10	2	6
11	61	4
12	62	4
13	62	5
14	62	6
15	63	4
16	63	5
17	63	6
\.


--
-- Data for Name: apps_food_ingredient; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_food_ingredient (id, food_id, ingredient_id) FROM stdin;
4	2	1
5	2	2
6	5	2
7	61	1
8	61	2
\.


--
-- Data for Name: apps_food_sides; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_food_sides (id, from_food_id, to_food_id) FROM stdin;
1	2	4
2	4	2
9	5	6
10	6	5
11	61	53
12	53	61
\.


--
-- Data for Name: apps_ingredient; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_ingredient (id, ts_created, ts_updated, title, image, description) FROM stdin;
1	2021-12-19 07:04:06.942577+00	2021-12-19 07:04:06.943335+00	Bun	None/Screenshot_2021-12-19_at_1.03.53_PM.png	Bun
2	2021-12-19 07:04:41.350061+00	2022-02-03 10:23:08.431088+00	Tomato	None/2979665_1.png	tomato
\.


--
-- Data for Name: apps_notification; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_notification (id, ts_created, ts_updated, title, description) FROM stdin;
\.


--
-- Data for Name: apps_orderdetails; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_orderdetails (id, ts_created, ts_updated, order_identifier, status, ts_delivery, payment_method, online_paid_amount, delivery_charge, discount_amount, point_redeem_amount, tax, total_bill, refund_amount, final_bill, online_payment_details, recipient_lat, recipient_lng, recipient_phone, recipient_name, recipient_address, review, rating, is_reviewed, is_skipped_review, time_slot, note, task_completion_image, ordered_by_id) FROM stdin;
297	2022-02-27 10:43:56.684069+00	2022-02-27 10:43:58.525248+00	CCTGGGGC	1	\N	1	0	29	0	0	0	178	0	178	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
298	2022-02-27 10:46:15.615075+00	2022-02-27 10:46:17.465656+00	GACCAAAC	1	\N	1	0	29	0	0	0	356	0	356	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
299	2022-02-27 10:53:23.74019+00	2022-02-27 10:53:24.592471+00	TGAATGCA	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
300	2022-02-27 10:53:59.866224+00	2022-02-27 10:54:01.772286+00	TCGATCAT	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
301	2022-02-27 10:57:56.316277+00	2022-02-27 10:57:57.166557+00	CCGCGTAT	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
302	2022-02-27 10:59:35.715676+00	2022-02-27 10:59:36.569506+00	AGTGCCCC	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
303	2022-02-27 11:01:25.463395+00	2022-02-27 11:01:27.305468+00	GCCACGCC	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
304	2022-02-27 11:03:52.041966+00	2022-02-27 11:03:52.895285+00	CTAAACGT	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
305	2022-02-27 11:10:57.381269+00	2022-02-27 11:10:59.232585+00	GCTGGGCG	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
306	2022-02-27 11:34:40.662706+00	2022-02-27 11:34:42.512453+00	CCTGGCGT	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
307	2022-02-27 11:44:46.057397+00	2022-02-27 11:44:47.912624+00	GGCGGTGA	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
308	2022-02-27 11:59:38.186232+00	2022-02-27 11:59:41.451666+00	AATTGAGC	1	\N	1	0	29	0	0	0	3	0	3	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
309	2022-02-27 12:04:35.230366+00	2022-02-27 12:04:37.775686+00	GGGGTGTG	1	\N	1	0	29	0	0	0	2	0	2	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
310	2022-02-27 12:35:42.728914+00	2022-02-27 12:35:44.578065+00	GCGTCGTC	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
311	2022-02-27 12:38:21.639252+00	2022-02-27 12:38:24.179211+00	AAACCAAC	1	\N	1	0	29	0	0	0	2	0	2	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
312	2022-02-27 12:38:31.727508+00	2022-02-27 12:38:32.864601+00	GCTCTTGA	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
313	2022-02-27 12:50:02.207173+00	2022-02-27 12:50:03.345118+00	GCTTGTCG	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
314	2022-02-27 12:50:09.415321+00	2022-02-27 12:50:10.556046+00	CATCTTGG	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
315	2022-02-27 12:52:28.020279+00	2022-02-27 12:52:29.219384+00	TGGGTCCT	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
316	2022-02-27 12:58:48.775537+00	2022-02-27 12:58:49.918068+00	CCTGAGGC	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
317	2022-02-27 13:05:18.481177+00	2022-02-27 13:05:19.618706+00	ATATTATG	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
319	2022-02-28 04:49:31.002544+00	2022-02-28 04:49:33.550849+00	CTTTTTAC	1	\N	1	0	29	0	0	0	606	0	606	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
320	2022-02-28 05:10:21.883932+00	2022-02-28 05:10:23.022397+00	CACTGAGC	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
321	2022-02-28 05:15:20.830601+00	2022-02-28 05:15:21.967283+00	GGGTTTAC	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
322	2022-02-28 05:29:24.867831+00	2022-02-28 05:29:26.003548+00	CTTTCGGA	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
323	2022-02-28 05:32:21.971792+00	2022-02-28 05:32:23.104819+00	TTATGAGA	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
324	2022-02-28 07:13:04.707985+00	2022-02-28 07:28:43.448724+00	TCACGACT	1	\N	2	356	29	0	0	0	356	0	356	{"amount": "356.00", "status": "VALID", "val_id": "22022813283903BWYgoQWPMcfSP", "card_no": "418117XXXXXX7814", "tran_id": "42751b81-cbb7-4ddb-bb35-4718d5dd4d32", "value_a": "356.0<#>324<#>7dddcd2e-3f2b-4fb0-92e4-a45526b6fe0c", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 13:28:04", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "TRUST BANK, LTD.", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "TRUST BANK, LTD.", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd913", "offer_avail": 1, "bank_tran_id": "2202281328380bKgf4dHBaJzjkU", "store_amount": "347.1", "validated_on": "2022-02-28 13:28:42", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "356.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
318	2022-02-28 04:49:24.201568+00	2022-02-28 10:13:18.672304+00	GTTCTGTC	1	\N	2	303	29	0	0	0	303	0	303	{"amount": "303.00", "status": "VALID", "val_id": "220228161314102EYNfxqx8lU0n", "card_no": "450850******4050", "tran_id": "840421d6-4677-47b3-9c09-2df8059ccdbc", "value_a": "303.0<#>318<#>f08ec155-3a47-443b-a20a-b13b20f3cbd0", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 16:12:47", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "CAJA DE AHORROS Y PENSIONES DE BARCELONA(LA CAIXA)", "gw_version": "", "risk_level": "1", "risk_title": "Not Safe", "card_issuer": "CAJA DE AHORROS Y PENSIONES DE BARCELONA(LA CAIXA)", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd916", "offer_avail": 1, "bank_tran_id": "2202281613140vCakp76W9qsLlf", "store_amount": "295.43", "validated_on": "2022-02-28 16:13:17", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "303.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Spain", "card_issuer_country_code": "ES"}	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
325	2022-02-28 08:00:20.380407+00	2022-02-28 08:05:25.577564+00	AAATGGAA	1	\N	2	1038	29	0	0	0	1038	0	1038	{"amount": "1038.00", "status": "VALID", "val_id": "22022814052102I1CtsYHOIi7iV", "card_no": "432149XXXXXX0667", "tran_id": "26dc6b45-8cf5-4f85-8139-b6175c724d06", "value_a": "1038.0<#>325<#>8f85cc82-ac40-4728-8298-e021001aa51b", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 14:04:13", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "BRAC BANK, LTD.", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "BRAC BANK, LTD.", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd914", "offer_avail": 1, "bank_tran_id": "2202281405211BhpR9X31pzKQJY", "store_amount": "1012.05", "validated_on": "2022-02-28 14:05:24", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "1038.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	23	23	+8801684155305	Ashequr	\N		0	f	f	0			7
343	2022-03-14 05:53:23.912507+00	2022-03-14 05:55:03.990064+00	GGGATTGG	2	\N	1	0	29	0	0	0	3	0	3	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0	\N		7
326	2022-03-01 11:13:57.249764+00	2022-03-01 11:13:59.115069+00	GTACCCTG	1	\N	1	0	29	0	0	0	303	0	303	\N	23	23	+8801684155305	Ashh	\N		0	f	f	0			7
327	2022-03-02 07:37:19.05296+00	2022-03-02 07:37:20.906069+00	GGTTCGGG	1	\N	1	0	29	0	0	0	1340	0	1340	\N	23	23	01777013381	Ratul	\N		0	f	f	0			38
328	2022-03-02 10:30:25.653002+00	2022-03-02 10:40:46.712677+00	AGGATTTA	2	\N	1	0	29	0	0	0	335	0	335	\N	23	23	+8801684155305	Ashh	\N		0	f	f	0	\N		7
329	2022-03-02 10:53:04.840306+00	2022-03-02 10:53:06.723307+00	GGCCAAAA	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	01601002871	fahin	\N		0	f	f	0			39
331	2022-03-03 07:36:52.239542+00	2022-03-06 10:06:41.726975+00	ACCCATGA	6	2022-03-06 09:15:48+00	1	0	29	0	0	0	1	0	1	\N	23	23	+8801684155305	Ashh	\N		0	f	f	0	\N		7
330	2022-03-03 06:49:53.517517+00	2022-03-06 11:15:37.436397+00	CAGGCTAC	5	\N	1	0	29	0	0	0	320	0	320	\N	23	23	+8801684155305	Ashh	\N		0	f	f	0	\N		7
332	2022-03-06 11:58:28.705349+00	2022-03-06 11:58:39.050685+00	GCCAAGTG	1	\N	1	0	29	0	0	0	506	0	506	\N	23	23	+8801684155305	Ashh	\N		0	f	f	0			7
333	2022-03-10 06:42:23.613824+00	2022-03-10 06:42:25.471547+00	AAGTAGTC	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0			7
335	2022-03-10 07:42:10.185906+00	2022-03-10 07:42:11.034734+00	AACGATAG	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
336	2022-03-10 07:44:13.450428+00	2022-03-10 07:44:14.297206+00	ATAAGTAC	1	\N	1	0	29	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N		0	f	f	0	\N		\N
334	2022-03-10 06:42:25.409124+00	2022-03-13 06:06:50.72083+00	ATCGAAAA	2	\N	1	0	29	0	0	0	2	0	2	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0	\N		7
337	2022-03-13 08:47:52.102586+00	2022-03-13 08:47:56.11537+00	CTAATTAA	1	\N	1	0	29	0	0	0	4	0	4	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0			7
338	2022-03-13 09:57:20.767515+00	2022-03-13 09:57:22.618025+00	TCTTTACA	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0			7
339	2022-03-13 09:57:42.429664+00	2022-03-13 09:57:43.55896+00	GCGATGTG	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0			7
340	2022-03-13 09:57:58.073824+00	2022-03-13 09:57:59.204323+00	CCGAGTGA	1	\N	1	0	29	0	0	0	0	0	0	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0			7
341	2022-03-13 10:30:43.341713+00	2022-03-13 10:30:45.19312+00	CACCGCTG	1	\N	1	0	29	0	0	0	1	0	1	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0	dsas		7
342	2022-03-13 11:10:55.895474+00	2022-03-13 11:20:48.793497+00	CTAGGCGC	2	\N	1	0	29	0	0	0	0	0	0	\N	23	23	123456789123213	Ashequr	\N		0	f	f	0	\N		7
\.


--
-- Data for Name: apps_orderdetails_cart; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_orderdetails_cart (id, orderdetails_id, cart_id) FROM stdin;
75	297	182
76	298	183
77	300	186
78	303	185
79	305	187
80	306	184
81	307	191
82	308	188
83	308	189
84	308	190
85	309	192
86	309	193
87	310	194
88	311	194
90	318	195
91	319	195
93	324	196
94	325	197
95	326	219
96	327	223
97	328	221
98	328	222
99	329	229
100	330	225
101	330	227
102	330	228
103	330	230
104	330	231
105	330	232
106	330	233
107	330	234
108	330	235
109	330	236
110	330	237
111	330	238
112	330	226
113	330	239
114	330	240
115	330	241
116	330	242
117	330	243
118	330	244
119	330	245
120	330	246
121	331	247
122	332	250
123	332	248
124	332	249
125	332	251
126	332	252
127	332	253
128	332	254
129	332	255
130	332	256
131	332	257
132	332	258
133	332	259
134	332	260
135	333	312
136	334	312
138	337	334
139	337	335
140	337	336
141	337	337
142	338	338
143	341	339
144	343	340
145	343	341
146	343	342
\.


--
-- Data for Name: apps_payment; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_payment (id, gateway, vendor_uid, payment_uid, state, amount, details, currency, "timestamp", order_id, user_id) FROM stdin;
20	1	78a41adf-05fb-4703-8f6d-0114ebc017a6	169fe58f-8e0f-44bc-ab68-704d0a5391f5	0	100	\N	1	2022-02-17 10:51:14.923167+00	\N	\N
21	1	3417c2a8-ab61-4f5b-a3cb-63c0e1796a9d	98b022b4-8f22-47bf-96ab-e4cb36f8247b	0	100	\N	1	2022-02-17 10:51:22.510368+00	\N	\N
1	1	f61b2239-b302-4674-93ee-8e67fbd0555c	f3c697c0-cda1-412b-bf44-9abac9394bc0	0	50	\N	1	2022-02-10 08:24:30.821068+00	\N	1
2	1	9b27d03b-9382-4593-aa7d-f7f837e0d390	820670ec-f548-487d-9692-6d1ed62b170f	0	50	\N	1	2022-02-10 08:26:38.211741+00	\N	1
3	1	42271db1-bc99-46c4-81dd-00b85d494685	0074a520-9dfa-48b3-b376-fa1708df0d51	0	50	\N	1	2022-02-10 08:30:31.8919+00	\N	1
4	1	5475d061-98d9-47c0-89c6-6717b6635794	9aef0676-9c93-4974-8191-1c62c0bf0252	0	50	\N	1	2022-02-10 08:31:23.913626+00	\N	1
8	1	b773e9ec-99eb-49df-ab6d-882dd99729ea	5f65978e-2c7c-40ce-b0c0-68ce21e8a16c	0	50	\N	1	2022-02-17 05:06:36.140622+00	\N	1
9	1	d4387729-9918-40bf-8079-1d8b5cee6258	ffb2dc98-f505-41bf-a943-08cb8838686c	0	50	\N	1	2022-02-17 05:08:41.429648+00	\N	1
10	1	4411d0ef-dab4-4445-b58c-118934965ca3	a57160f3-6a9a-4dab-99d4-5b99ebf50cc1	0	50	\N	1	2022-02-17 05:08:51.363002+00	\N	1
5	1	07faf4df-1206-4326-9456-dd0328e83fac	b9835ce9-6679-4b55-a3fd-7189821cc551	2	50	{"amount": "50.00", "status": "VALID", "val_id": "220210143323ld6vJYIXc3FtIUr", "card_no": "", "tran_id": "0a050b98-1efc-4aa5-9c58-ab8983574dd9", "value_a": "50.0<#>1<#>b9835ce9-6679-4b55-a3fd-7189821cc551", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "IBBL-Islami Bank", "tran_date": "2022-02-10 14:32:26", "APIConnect": "DONE", "card_brand": "IB", "emi_amount": "0.00", "emi_issuer": "Islami Bank Bangladesh Limited", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "Islami Bank Bangladesh Limited", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd914", "offer_avail": 1, "bank_tran_id": "2202101433231I76Wrb1UcMfIqU", "store_amount": "48.75", "validated_on": "2022-02-10 14:33:27", "campaign_code": "", "currency_rate": "1.0000", "currency_type": "BDT", "emi_instalment": "0", "account_details": "", "currency_amount": "50.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	1	2022-02-10 08:32:22.180742+00	\N	1
6	1	a29f9e98-d37e-492d-9e92-288dccbd4388	a9bb824d-b8ec-46b6-9b41-9935a486153e	2	50	{"amount": "50.00", "status": "VALID", "val_id": "220210150053yZjJC7shYBf59Uq", "card_no": "552213******3239", "tran_id": "1b17bd50-3f36-48e4-8a6e-7862a18d0ef6", "value_a": "50.0<#>3<#>a9bb824d-b8ec-46b6-9b41-9935a486153e", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "MASTER-Dutch Bangla", "tran_date": "2022-02-10 15:00:36", "APIConnect": "DONE", "card_brand": "MASTERCARD", "emi_amount": "0.00", "emi_issuer": "NATIONAL WESTMINSTER BANK PLC", "gw_version": "", "risk_level": "1", "risk_title": "Not Safe", "card_issuer": "NATIONAL WESTMINSTER BANK PLC", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd915", "offer_avail": 1, "bank_tran_id": "220210150053rJ9ZUroL1YjHnlU", "store_amount": "48.75", "validated_on": "2022-02-10 15:00:57", "campaign_code": "", "currency_rate": "1.0000", "currency_type": "BDT", "emi_instalment": "0", "account_details": "", "currency_amount": "50.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "United Kingdom", "card_issuer_country_code": "GB"}	1	2022-02-10 09:00:32.485796+00	\N	1
7	1	14b3b408-54a0-472b-b371-64d3945cfd64	7ec400d5-4684-4eea-9529-bd15ce520962	2	50	{"amount": "50.00", "status": "VALID", "val_id": "220210151148wzxWN2SoLht3cnj", "card_no": "512815XXXXXX5306", "tran_id": "395c2df7-33ec-49cb-b0f5-40739fd9d348", "value_a": "50.0<#>3<#>7ec400d5-4684-4eea-9529-bd15ce520962", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "MASTER-Dutch Bangla", "tran_date": "2022-02-10 15:11:29", "APIConnect": "DONE", "card_brand": "MASTERCARD", "emi_amount": "0.00", "emi_issuer": "STANDARD CHARTERED BANK", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "STANDARD CHARTERED BANK", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd915", "offer_avail": 1, "bank_tran_id": "2202101511481Ndu6iMRB4HrHQW", "store_amount": "48.75", "validated_on": "2022-02-10 15:11:51", "campaign_code": "", "currency_rate": "1.0000", "currency_type": "BDT", "emi_instalment": "0", "account_details": "", "currency_amount": "50.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	1	2022-02-10 09:11:28.33108+00	\N	1
11	1	b373e9c6-5ecd-4edb-9266-01f3edaeb882	d59bf005-22a0-4359-a17f-2bdf65113a61	0	50	\N	1	2022-02-17 05:09:21.523426+00	\N	1
12	1	64c18842-b1c6-49af-b169-6c084900d6a4	3604a4a9-6c4e-4198-936a-b7ef6549b19c	0	50	\N	1	2022-02-17 05:10:30.8743+00	\N	1
13	1	f77baeef-6216-4627-8b90-6e56756d65b3	69d2df1e-0bab-4708-8866-3d5156d1fac5	0	50	\N	1	2022-02-17 05:10:53.82321+00	\N	1
14	1	d77d36aa-7adf-4a7e-811e-b612af427f52	b7970d37-227c-413a-833c-0d664bf9ad4d	0	50	\N	1	2022-02-17 05:11:42.907524+00	\N	1
15	1	96b19083-2a36-4df6-9edc-c21139e62841	9ab84e2d-500f-4776-8208-d1068a70a466	0	50	\N	1	2022-02-17 05:12:08.60732+00	\N	1
16	1	90ff7abf-ad40-414e-b0d5-048b486818b3	29b2df54-815c-4a31-bdce-79123a2037a1	0	50	\N	1	2022-02-17 05:16:53.681517+00	\N	1
17	1	61a3a290-3b7a-4684-a5e8-1fc7bccba5ac	b5194ced-69b1-47db-ac09-7c12f11b8c5a	0	50	\N	1	2022-02-17 05:16:53.697162+00	\N	1
18	1	68fa44b4-a902-4681-9b88-d4ce3a8964ac	15c1fb40-47cd-4a3e-aa7f-0e16ee4cd7df	0	50	\N	1	2022-02-17 05:18:30.127164+00	\N	1
19	1	c6eb009e-75d3-4b48-841c-2db16817bc3e	0e52c60c-bd57-4b48-a420-9453f5672262	0	50	\N	1	2022-02-17 05:18:30.136384+00	\N	1
22	1	95e2dec0-8ba5-4765-8a25-aa0bed5f9464	8cee837b-97fd-4dc8-a2e7-8a09efbc53fa	0	50	\N	1	2022-02-17 10:54:10.46105+00	\N	1
23	1	3c8ab528-4a79-41f5-90cb-f26ec1733850	7dddcd2e-3f2b-4fb0-92e4-a45526b6fe0c	2	356	{"amount": "356.00", "status": "VALID", "val_id": "22022813283903BWYgoQWPMcfSP", "card_no": "418117XXXXXX7814", "tran_id": "42751b81-cbb7-4ddb-bb35-4718d5dd4d32", "value_a": "356.0<#>324<#>7dddcd2e-3f2b-4fb0-92e4-a45526b6fe0c", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 13:28:04", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "TRUST BANK, LTD.", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "TRUST BANK, LTD.", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd913", "offer_avail": 1, "bank_tran_id": "2202281328380bKgf4dHBaJzjkU", "store_amount": "347.1", "validated_on": "2022-02-28 13:28:42", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "356.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	1	2022-02-28 07:28:03.510397+00	324	7
24	1	6cff8fc2-3298-4b02-a09f-3a7d9fe94ba2	0b59c411-a1b4-48ce-b34a-35aa760b52a9	0	356	\N	1	2022-02-28 07:54:00.258755+00	324	7
25	1	aa8dd326-5e1c-4fda-a404-c6b3a4ed5029	8f85cc82-ac40-4728-8298-e021001aa51b	2	1038	{"amount": "1038.00", "status": "VALID", "val_id": "22022814052102I1CtsYHOIi7iV", "card_no": "432149XXXXXX0667", "tran_id": "26dc6b45-8cf5-4f85-8139-b6175c724d06", "value_a": "1038.0<#>325<#>8f85cc82-ac40-4728-8298-e021001aa51b", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 14:04:13", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "BRAC BANK, LTD.", "gw_version": "", "risk_level": "0", "risk_title": "Safe", "card_issuer": "BRAC BANK, LTD.", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd914", "offer_avail": 1, "bank_tran_id": "2202281405211BhpR9X31pzKQJY", "store_amount": "1012.05", "validated_on": "2022-02-28 14:05:24", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "1038.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Bangladesh", "card_issuer_country_code": "BD"}	1	2022-02-28 08:04:12.013424+00	325	7
26	1	59158ba7-bff7-4914-94d2-8c4aebf40271	3841ef3a-5922-4327-ad6d-f4e2626bde6c	0	1038	\N	1	2022-02-28 08:06:04.709824+00	325	7
27	1	ad92d174-1a04-4da2-bb21-aac3c0bd2dba	d799f2c9-7658-4e2d-8617-b499109bd08c	0	1038	\N	1	2022-02-28 08:06:39.052835+00	325	7
28	1	90bc12b6-7e6f-40a8-9cdc-dbcb5ce227b6	1c8e9eb0-4280-477e-8813-7e404eb509fb	0	1038	\N	1	2022-02-28 08:08:29.437229+00	325	7
29	1	295ac418-567d-4d86-83ee-036e0b831999	53ee59e5-c87d-4b12-b452-15cfbe0fbb2a	0	1038	\N	1	2022-02-28 08:13:35.147428+00	325	7
30	1	2ada34c2-16c5-46bc-92cb-0a89b62b2a93	f08ec155-3a47-443b-a20a-b13b20f3cbd0	2	303	{"amount": "303.00", "status": "VALID", "val_id": "220228161314102EYNfxqx8lU0n", "card_no": "450850******4050", "tran_id": "840421d6-4677-47b3-9c09-2df8059ccdbc", "value_a": "303.0<#>318<#>f08ec155-3a47-443b-a20a-b13b20f3cbd0", "value_b": "", "value_c": "", "value_d": "", "currency": "BDT", "base_fair": "0.00", "card_type": "VISA-Dutch Bangla", "tran_date": "2022-02-28 16:12:47", "APIConnect": "DONE", "card_brand": "VISA", "emi_amount": "0.00", "emi_issuer": "CAJA DE AHORROS Y PENSIONES DE BARCELONA(LA CAIXA)", "gw_version": "", "risk_level": "1", "risk_title": "Not Safe", "card_issuer": "CAJA DE AHORROS Y PENSIONES DE BARCELONA(LA CAIXA)", "card_ref_id": "dc1da4f52669828139e81ef5eb0f48a5a99ea054a131e00a562887d455417dd916", "offer_avail": 1, "bank_tran_id": "2202281613140vCakp76W9qsLlf", "store_amount": "295.43", "validated_on": "2022-02-28 16:13:17", "campaign_code": "", "card_category": "DEBIT", "currency_rate": "1.0000", "currency_type": "BDT", "card_sub_brand": "", "emi_instalment": "0", "account_details": "", "currency_amount": "303.00", "emi_description": "", "isTokeizeSuccess": 0, "card_issuer_country": "Spain", "card_issuer_country_code": "ES"}	1	2022-02-28 10:12:46.56017+00	318	7
\.


--
-- Data for Name: apps_settings; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_settings (id, ts_created, ts_updated, company_name, url, system_email, smtp_host, smtp_user, smtp_password, smtp_port, company_bin, ssl_id, ssl_pass, radius) FROM stdin;
\.


--
-- Data for Name: apps_subaddon; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_subaddon (id, ts_created, ts_updated, title, description, price, add_on_id) FROM stdin;
1	2022-03-13 11:07:47.871726+00	2022-03-13 11:20:23.831062+00	Title	Description	29	5
\.


--
-- Data for Name: apps_user; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.apps_user (id, ts_created, ts_updated, name, password, email, mobile_info, facebook, google, image, phone, type, category) FROM stdin;
2	2022-01-30 20:26:21.649928+00	2022-01-30 20:26:21.650335+00		4321zxcv	kazi.asheq@gmail.com					01953694359	2	3
3	2022-01-31 05:49:21.704548+00	2022-01-31 05:49:21.704864+00		4321zxcv	asheqonline@gmail.com					01953694359	2	3
4	2022-01-31 05:59:15.032961+00	2022-01-31 05:59:15.033292+00		128763	asheqonline2@gmail.com					01953694359	2	3
5	2022-01-31 05:59:54.993405+00	2022-01-31 05:59:54.993715+00		4321	asheqonline3@gmail.com					01708525860	2	3
6	2022-01-31 06:06:29.757427+00	2022-01-31 06:06:29.757742+00		123123	asheqonline5@gmail.com					01708525860	2	3
8	2022-02-01 06:35:46.538245+00	2022-02-01 06:35:46.538668+00		4321zxcv	asheqrah44@gmail.com					+8801684155305	2	3
9	2022-02-06 09:29:17.386301+00	2022-02-06 09:29:17.386724+00	Cat	123456	hello@hello.com					12345678901	2	3
10	2022-02-06 10:04:47.19235+00	2022-02-06 10:04:47.192766+00			\N					01701062753	2	3
11	2022-02-06 10:07:27.957776+00	2022-02-06 10:07:27.958094+00			\N					0172928182	2	3
12	2022-02-06 10:12:18.19921+00	2022-02-06 10:12:18.199532+00		123456	hello5@hello.com						2	3
13	2022-02-06 10:14:06.02871+00	2022-02-06 10:14:06.030038+00		123123	jsjsjs@sjsjs.asd						2	3
14	2022-02-06 10:21:02.622034+00	2022-02-06 10:21:03.476288+00			\N						2	3
15	2022-02-06 10:21:57.811228+00	2022-02-06 10:21:57.811674+00		123	admin@gmail.com						2	3
16	2022-02-06 10:45:15.418502+00	2022-02-06 10:45:15.418815+00			asheqrah@gmail.com$password=1234						2	3
17	2022-02-06 10:46:45.865808+00	2022-02-06 10:46:45.866126+00			asheqrah@gmail.com$password=123456						2	3
18	2022-02-06 10:47:42.814816+00	2022-02-06 10:47:42.815122+00			hello@hello.com$password=111111						2	3
19	2022-02-06 11:04:46.215647+00	2022-02-06 11:04:46.215948+00		123456789	navilur@exsentra.com					01515678710	2	3
20	2022-02-06 11:06:19.734185+00	2022-02-06 11:06:19.734518+00	Imran Hosen	12345678	imran@exsentra.com					01516700532	2	3
21	2022-02-09 05:39:48.569359+00	2022-02-09 05:39:48.569756+00	Ratul	r130493	it@ausbdbazaar.com					+8801777013381	2	3
22	2022-02-15 05:50:41.414575+00	2022-02-15 05:50:42.264967+00			\N						2	3
23	2022-02-15 05:52:25.274179+00	2022-02-15 05:52:26.142645+00			\N						2	3
24	2022-02-15 05:52:45.765102+00	2022-02-15 05:52:46.617373+00			\N						2	3
25	2022-02-15 05:52:56.27081+00	2022-02-15 05:52:57.121845+00			\N						2	3
26	2022-02-15 05:53:01.717482+00	2022-02-15 05:53:02.565546+00			\N						2	3
27	2022-02-15 05:58:10.345864+00	2022-02-15 05:58:11.218843+00			\N						2	3
28	2022-02-15 05:58:25.547782+00	2022-02-15 05:58:26.418918+00			\N						2	3
29	2022-02-15 05:59:31.021688+00	2022-02-15 05:59:31.896842+00			\N						2	3
30	2022-02-15 06:00:07.183675+00	2022-02-15 06:00:08.065971+00			\N						2	3
31	2022-02-15 06:00:42.967498+00	2022-02-15 06:00:43.815396+00			\N						2	3
32	2022-02-15 06:01:23.628406+00	2022-02-15 06:01:24.478964+00			\N						2	3
33	2022-02-15 06:01:41.878121+00	2022-02-15 06:01:42.725754+00			\N						2	3
34	2022-02-15 06:02:18.088901+00	2022-02-15 06:02:18.939748+00			\N						2	3
35	2022-02-15 06:03:51.491717+00	2022-02-15 06:03:52.34217+00			\N						2	3
36	2022-02-15 06:16:26.711342+00	2022-02-15 06:16:27.603793+00			\N						2	3
1	2022-01-27 09:09:43.629087+00	2022-02-17 09:57:43.718757+00	Mr Tomms		\N					01677012475	2	3
37	2022-03-01 09:51:55.44354+00	2022-03-01 09:51:55.443945+00	Faisal	Ibnoon@420	faisalbu85@yahoo.com					01817101196	2	3
38	2022-03-02 07:35:44.422119+00	2022-03-02 07:35:44.422579+00	Ratul	1234	it234@ausbdbazaar.com					01777013381	2	3
39	2022-03-02 10:51:20.746883+00	2022-03-02 10:51:20.747243+00	fahin	23456	sharifnayon16@gmail.com					01601002871	2	3
7	2022-01-31 06:16:35.001986+00	2022-03-08 11:48:40.471603+00	Ashequr	1234	asheqrah@gmail.com					123456789123213	2	3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_group (id, name) FROM stdin;
1	Super Admin
2	Staff
3	Kitchen Staff
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
61	1	61
62	1	62
63	1	63
64	1	64
65	1	65
66	1	66
67	1	67
68	1	68
69	1	69
70	1	70
71	1	71
72	1	72
73	1	73
74	1	74
75	1	75
76	1	76
77	1	77
78	1	78
79	1	79
80	1	80
81	1	81
82	1	82
83	1	83
84	1	84
85	1	85
86	1	86
87	1	87
88	1	88
89	1	89
90	1	90
91	1	91
92	1	92
93	1	93
94	1	94
95	1	95
96	1	96
97	1	97
98	1	98
99	1	99
100	1	100
101	1	101
102	1	102
103	1	103
104	1	104
105	1	105
106	1	106
107	1	107
108	1	108
109	2	1
110	2	2
111	2	3
112	2	4
113	2	5
114	2	6
115	2	7
116	2	8
117	2	9
118	2	10
119	2	11
120	2	12
121	2	13
122	2	14
123	2	15
124	2	16
125	2	17
126	2	18
127	2	19
128	2	20
129	2	21
130	2	22
131	2	23
132	2	24
133	2	25
134	2	26
135	2	27
136	2	28
137	2	29
138	2	30
139	2	31
140	2	32
141	2	33
142	2	34
143	2	35
144	2	36
145	2	37
146	2	38
147	2	39
148	2	40
149	2	41
150	2	42
151	2	43
152	2	44
153	2	45
154	2	46
155	2	47
156	2	48
157	2	49
158	2	50
159	2	51
160	2	52
161	2	53
162	2	54
163	2	55
164	2	56
165	2	57
166	2	58
167	2	59
168	2	60
169	2	61
170	2	62
171	2	63
172	2	64
173	2	65
174	2	66
175	2	67
176	2	68
177	2	69
178	2	70
179	2	71
180	2	72
181	2	73
182	2	74
183	2	75
184	2	76
185	2	77
186	2	78
187	2	79
188	2	80
189	2	81
190	2	82
191	2	83
192	2	84
193	2	85
194	2	86
195	2	87
196	2	88
197	2	89
198	2	90
199	2	91
200	2	92
201	2	93
202	2	94
203	2	95
204	2	96
205	2	97
206	2	98
207	2	99
208	2	100
209	2	101
210	2	102
211	2	103
212	2	104
213	2	105
214	2	106
215	2	107
216	2	108
217	3	1
218	3	2
219	3	3
220	3	4
221	3	5
222	3	6
223	3	7
224	3	8
225	3	9
226	3	10
227	3	11
228	3	12
229	3	13
230	3	14
231	3	15
232	3	16
233	3	17
234	3	18
235	3	19
236	3	20
237	3	21
238	3	22
239	3	23
240	3	24
241	3	25
242	3	26
243	3	27
244	3	28
245	3	29
246	3	30
247	3	31
248	3	32
249	3	33
250	3	34
251	3	35
252	3	36
253	3	37
254	3	38
255	3	39
256	3	40
257	3	41
258	3	42
259	3	43
260	3	44
261	3	45
262	3	46
263	3	47
264	3	48
265	3	49
266	3	50
267	3	51
268	3	52
269	3	53
270	3	54
271	3	55
272	3	56
273	3	57
274	3	58
275	3	59
276	3	60
277	3	61
278	3	62
279	3	63
280	3	64
281	3	65
282	3	66
283	3	67
284	3	68
285	3	69
286	3	70
287	3	71
288	3	72
289	3	73
290	3	74
291	3	75
292	3	76
293	3	77
294	3	78
295	3	79
296	3	80
297	3	81
298	3	82
299	3	83
300	3	84
301	3	85
302	3	86
303	3	87
304	3	88
305	3	89
306	3	90
307	3	91
308	3	92
309	3	93
310	3	94
311	3	95
312	3	96
313	3	97
314	3	98
315	3	99
316	3	100
317	3	101
318	3	102
319	3	103
320	3	104
321	3	105
322	3	106
323	3	107
324	3	108
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add about us	7	add_aboutus
26	Can change about us	7	change_aboutus
27	Can delete about us	7	delete_aboutus
28	Can view about us	7	view_aboutus
29	Can add blog	8	add_blog
30	Can change blog	8	change_blog
31	Can delete blog	8	delete_blog
32	Can view blog	8	view_blog
33	Can add category	9	add_category
34	Can change category	9	change_category
35	Can delete category	9	delete_category
36	Can view category	9	view_category
37	Can add drop down	10	add_dropdown
38	Can change drop down	10	change_dropdown
39	Can delete drop down	10	delete_dropdown
40	Can view drop down	10	view_dropdown
41	Can add faq	11	add_faq
42	Can change faq	11	change_faq
43	Can delete faq	11	delete_faq
44	Can view faq	11	view_faq
45	Can add ingredient	12	add_ingredient
46	Can change ingredient	12	change_ingredient
47	Can delete ingredient	12	delete_ingredient
48	Can view ingredient	12	view_ingredient
49	Can add notification	13	add_notification
50	Can change notification	13	change_notification
51	Can delete notification	13	delete_notification
52	Can view notification	13	view_notification
53	Can add user	14	add_user
54	Can change user	14	change_user
55	Can delete user	14	delete_user
56	Can view user	14	view_user
57	Can add role	15	add_role
58	Can change role	15	change_role
59	Can delete role	15	delete_role
60	Can view role	15	view_role
61	Can add screen	16	add_screen
62	Can change screen	16	change_screen
63	Can delete screen	16	delete_screen
64	Can view screen	16	view_screen
65	Can add payment info	17	add_paymentinfo
66	Can change payment info	17	change_paymentinfo
67	Can delete payment info	17	delete_paymentinfo
68	Can view payment info	17	view_paymentinfo
69	Can add food	18	add_food
70	Can change food	18	change_food
71	Can delete food	18	delete_food
72	Can view food	18	view_food
73	Can add Theme	19	add_theme
74	Can change Theme	19	change_theme
75	Can delete Theme	19	delete_theme
76	Can view Theme	19	view_theme
77	Can add cook	20	add_cook
78	Can change cook	20	change_cook
79	Can delete cook	20	delete_cook
80	Can view cook	20	view_cook
81	Can add banner	21	add_banner
82	Can change banner	21	change_banner
83	Can delete banner	21	delete_banner
84	Can view banner	21	view_banner
85	Can add add on category	22	add_addoncategory
86	Can change add on category	22	change_addoncategory
87	Can delete add on category	22	delete_addoncategory
88	Can view add on category	22	view_addoncategory
89	Can add add on	23	add_addon
90	Can change add on	23	change_addon
91	Can delete add on	23	delete_addon
92	Can view add on	23	view_addon
93	Can add cart	24	add_cart
94	Can change cart	24	change_cart
95	Can delete cart	24	delete_cart
96	Can view cart	24	view_cart
97	Can add payment	25	add_payment
98	Can change payment	25	change_payment
99	Can delete payment	25	delete_payment
100	Can view payment	25	view_payment
101	Can add order details	26	add_orderdetails
102	Can change order details	26	change_orderdetails
103	Can delete order details	26	delete_orderdetails
104	Can view order details	26	view_orderdetails
105	Can add settings	27	add_settings
106	Can change settings	27	change_settings
107	Can delete settings	27	delete_settings
108	Can view settings	27	view_settings
109	Can add sub add on	28	add_subaddon
110	Can change sub add on	28	change_subaddon
111	Can delete sub add on	28	delete_subaddon
112	Can view sub add on	28	view_subaddon
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$d1fUccXDUZin4yArNTwmoo$hdwposF0vAJA6bBP+FGB0ufLNVK704n/KCc0XjVchGk=	2022-03-14 04:35:10.379618+00	t	admin			asd@asd.asd	t	t	2021-12-19 06:48:04.591124+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-19 07:03:35.812941+00	1	Burger	1	[{"added": {}}]	9	1
2	2021-12-19 07:04:07.352282+00	1	Bun	1	[{"added": {}}]	12	1
3	2021-12-19 07:04:41.759817+00	2	Tomato	1	[{"added": {}}]	12	1
4	2021-12-19 07:09:02.045091+00	2	Burger	1	[{"added": {}}, {"added": {"name": "food-ingredient relationship", "object": "Food_ingredient object (4)"}}, {"added": {"name": "food-ingredient relationship", "object": "Food_ingredient object (5)"}}]	18	1
5	2021-12-27 09:32:36.016716+00	2	Bootstrap	2	[{"changed": {"fields": ["Active"]}}]	19	1
6	2021-12-27 09:32:36.585052+00	1	Django	2	[{"changed": {"fields": ["Active"]}}]	19	1
7	2021-12-27 09:32:48.552949+00	2	Bootstrap	2	[{"changed": {"fields": ["Active"]}}]	19	1
8	2021-12-27 09:32:48.978673+00	1	Django	2	[{"changed": {"fields": ["Active"]}}]	19	1
9	2022-01-05 11:13:31.838641+00	3	Pizza	1	[{"added": {}}]	18	1
10	2022-01-06 05:01:50.51631+00	2	Pizza	1	[{"added": {}}]	9	1
11	2022-01-06 05:32:50.042194+00	3	FRENCH FRY	1	[{"added": {}}]	9	1
12	2022-01-06 05:33:09.221667+00	4	SANDWICH	1	[{"added": {}}]	9	1
13	2022-01-06 05:33:33.873535+00	5	SOFT DRINKS	1	[{"added": {}}]	9	1
14	2022-01-06 05:49:54.148473+00	4	Coca-Cola	1	[{"added": {}}]	18	1
15	2022-01-06 06:30:48.894823+00	6	Salad	1	[{"added": {}}]	9	1
16	2022-01-06 06:32:00.818537+00	5	Salad	1	[{"added": {}}, {"added": {"name": "food-ingredient relationship", "object": "Food_ingredient object (6)"}}]	18	1
17	2022-01-10 07:38:14.242777+00	1	Pizza	1	[{"added": {}}]	21	1
18	2022-01-11 07:25:32.218695+00	1	Choice Of Sides	1	[{"added": {}}]	22	1
19	2022-01-11 07:25:56.031767+00	2	Choice Of Dips	1	[{"added": {}}]	22	1
20	2022-01-11 07:27:00.072825+00	1	Mayo Dip	1	[{"added": {}}]	23	1
21	2022-01-11 07:27:30.959819+00	2	Spicy Mayo Dip	1	[{"added": {}}]	23	1
22	2022-01-11 07:28:34.902497+00	3	Toppings For Burger	1	[{"added": {}}]	22	1
23	2022-01-11 07:30:34.868179+00	3	Cheese	1	[{"added": {}}]	23	1
24	2022-01-11 07:31:12.580373+00	1	Choice Of Sides	3		22	1
25	2022-01-11 07:32:25.813295+00	2	Burger	2	[{"changed": {"fields": ["Sides", "Add ons"]}}]	18	1
26	2022-01-11 09:38:11.640106+00	2	Pizza	1	[{"added": {}}]	21	1
27	2022-01-11 09:38:43.320306+00	1	Pizza	3		21	1
28	2022-01-11 09:39:13.266698+00	2	Pizza	2	[{"changed": {"fields": ["Is active"]}}]	21	1
29	2022-01-18 07:20:05.5672+00	2	Burger	2	[{"changed": {"fields": ["Image"]}}]	18	1
30	2022-01-20 11:16:04.557684+00	3	Navilur	3		20	1
31	2022-01-20 11:16:04.703162+00	2	Navilur	3		20	1
32	2022-01-20 11:19:46.378232+00	4	Navilur	3		20	1
33	2022-01-26 10:00:02.739306+00	6	apple	1	[{"added": {}}]	18	1
34	2022-01-31 19:18:53.539703+00	4	Pizza	1	[{"added": {}}]	21	1
35	2022-02-01 14:34:59.956651+00	2	Burger	2	[{"changed": {"fields": ["Sides"]}}]	18	1
36	2022-02-03 10:23:08.578095+00	2	Tomato	2	[{"changed": {"fields": ["Image"]}}]	12	1
37	2022-02-03 11:12:48.556447+00	2	Burger	2	[{"changed": {"fields": ["Sides"]}}]	18	1
38	2022-02-03 11:12:52.800951+00	2	Burger	2	[]	18	1
39	2022-02-08 10:40:50.49154+00	5	Salad	2	[{"changed": {"fields": ["Sides", "Add ons"]}}]	18	1
40	2022-02-10 08:24:18.534563+00	1	order_Mr Tomm_ 01677012475	1	[{"added": {}}]	26	1
41	2022-02-16 11:07:11.728303+00	2	Bootstrap	2	[{"changed": {"fields": ["Active"]}}]	19	1
42	2022-02-16 11:07:12.303914+00	1	Django	2	[{"changed": {"fields": ["Active"]}}]	19	1
43	2022-02-17 09:37:02.561015+00	107	order__ +8801684155305	3		26	1
44	2022-02-17 09:47:20.016701+00	110	order_Asheq_ +8801684155305	2	[{"changed": {"fields": ["Ts delivery"]}}]	26	1
45	2022-02-17 11:51:50.788565+00	110	order_Asheq_ +8801684155305	2	[{"changed": {"fields": ["Ts delivery", "Tax"]}}]	26	1
46	2022-02-21 06:42:11.455441+00	1	Django	2	[{"changed": {"fields": ["Logo", "Title"]}}]	19	1
47	2022-02-22 05:53:12.329943+00	6	apple	2	[{"changed": {"fields": ["Add ons", "Price"]}}]	18	1
48	2022-02-22 06:51:57.032111+00	178	order_anonymous	3		26	1
49	2022-02-22 06:51:57.174947+00	177	order_anonymous	3		26	1
50	2022-02-22 06:51:57.316467+00	176	order_anonymous	3		26	1
51	2022-02-22 06:51:57.457921+00	175	order_anonymous	3		26	1
52	2022-02-22 06:51:57.599489+00	174	order_anonymous	3		26	1
53	2022-02-22 06:51:57.740823+00	173	order_anonymous	3		26	1
54	2022-02-22 06:51:57.882259+00	172	order_anonymous	3		26	1
55	2022-02-22 06:51:58.023724+00	171	order_anonymous	3		26	1
56	2022-02-22 06:51:58.165023+00	170	order_anonymous	3		26	1
57	2022-02-22 06:51:58.306604+00	169	order_anonymous	3		26	1
58	2022-02-22 06:51:58.448268+00	168	order_anonymous	3		26	1
59	2022-02-22 06:51:58.589552+00	167	order_anonymous	3		26	1
60	2022-02-22 06:51:58.73367+00	166	order_anonymous	3		26	1
61	2022-02-22 06:51:58.875682+00	165	order_anonymous	3		26	1
62	2022-02-22 06:51:59.017806+00	164	order_anonymous	3		26	1
63	2022-02-22 06:51:59.159257+00	163	order_anonymous	3		26	1
64	2022-02-22 06:51:59.30699+00	162	order_anonymous	3		26	1
65	2022-02-22 06:51:59.448765+00	161	order_anonymous	3		26	1
66	2022-02-22 06:51:59.590066+00	160	order_anonymous	3		26	1
67	2022-02-22 06:51:59.731675+00	159	order_anonymous	3		26	1
68	2022-02-22 06:51:59.873211+00	158	order_anonymous	3		26	1
69	2022-02-22 06:52:00.014977+00	157	order_anonymous	3		26	1
70	2022-02-22 06:52:00.295607+00	156	order_anonymous	3		26	1
71	2022-02-22 06:52:00.530868+00	155	order_Ashequr_ +8801684155305	3		26	1
72	2022-02-22 06:52:00.743264+00	154	order_anonymous	3		26	1
73	2022-02-22 06:52:00.958795+00	153	order_anonymous	3		26	1
74	2022-02-22 06:52:01.13313+00	152	order_anonymous	3		26	1
75	2022-02-22 06:52:01.274781+00	151	order_anonymous	3		26	1
76	2022-02-22 06:52:01.420944+00	150	order_anonymous	3		26	1
77	2022-02-22 06:52:01.563998+00	149	order_Ashequr_ +8801684155305	3		26	1
78	2022-02-22 06:52:01.706088+00	148	order_anonymous	3		26	1
79	2022-02-22 06:52:01.853886+00	147	order_anonymous	3		26	1
80	2022-02-22 06:52:01.995812+00	146	order_anonymous	3		26	1
81	2022-02-22 06:52:02.138385+00	145	order_anonymous	3		26	1
82	2022-02-22 06:52:02.281813+00	144	order_Ashequr_ +8801684155305	3		26	1
83	2022-02-22 06:52:02.424915+00	143	order_anonymous	3		26	1
84	2022-02-22 06:52:02.566898+00	142	order_anonymous	3		26	1
85	2022-02-22 06:52:02.709107+00	141	order_anonymous	3		26	1
86	2022-02-22 06:52:02.85087+00	140	order_anonymous	3		26	1
87	2022-02-22 06:52:02.992414+00	139	order_anonymous	3		26	1
88	2022-02-22 06:52:03.133966+00	138	order_anonymous	3		26	1
89	2022-02-22 06:52:03.276134+00	137	order_anonymous	3		26	1
90	2022-02-22 06:52:03.418096+00	136	order_anonymous	3		26	1
91	2022-02-22 06:52:03.55956+00	135	order_anonymous	3		26	1
92	2022-02-22 06:52:03.70132+00	134	order_anonymous	3		26	1
93	2022-02-22 06:52:03.842679+00	133	order_anonymous	3		26	1
94	2022-02-22 06:52:03.989008+00	132	order_anonymous	3		26	1
95	2022-02-22 06:52:04.131212+00	131	order_anonymous	3		26	1
96	2022-02-22 06:52:04.272868+00	130	order_anonymous	3		26	1
97	2022-02-22 06:52:04.414388+00	129	order_anonymous	3		26	1
98	2022-02-22 06:52:04.556122+00	128	order_anonymous	3		26	1
99	2022-02-22 06:52:04.69827+00	127	order_anonymous	3		26	1
100	2022-02-22 06:52:04.839689+00	126	order_anonymous	3		26	1
101	2022-02-22 06:52:04.981237+00	125	order_anonymous	3		26	1
102	2022-02-22 06:52:05.150878+00	124	order_anonymous	3		26	1
103	2022-02-22 06:52:05.292555+00	123	order_anonymous	3		26	1
104	2022-02-22 06:52:05.434247+00	122	order_anonymous	3		26	1
105	2022-02-22 06:52:05.576657+00	121	order_anonymous	3		26	1
106	2022-02-22 06:52:05.718213+00	120	order_anonymous	3		26	1
107	2022-02-22 06:52:05.859564+00	119	order_anonymous	3		26	1
108	2022-02-22 06:52:06.001551+00	118	order_anonymous	3		26	1
109	2022-02-22 06:52:06.14425+00	117	order_anonymous	3		26	1
110	2022-02-22 06:52:06.285944+00	116	order_anonymous	3		26	1
111	2022-02-22 06:52:06.427714+00	115	order_anonymous	3		26	1
112	2022-02-22 06:52:06.570956+00	114	order_anonymous	3		26	1
113	2022-02-22 06:52:06.71249+00	113	order_anonymous	3		26	1
114	2022-02-22 06:52:06.854229+00	112	order_anonymous	3		26	1
115	2022-02-22 06:52:06.995838+00	111	order_anonymous	3		26	1
116	2022-02-22 06:52:07.137288+00	110	order_Ashequr_ +8801684155305	3		26	1
117	2022-02-22 06:52:07.278687+00	109	order_anonymous	3		26	1
118	2022-02-22 06:52:07.421216+00	108	order_anonymous	3		26	1
119	2022-02-22 06:52:07.56276+00	106	order_anonymous	3		26	1
120	2022-02-22 06:52:07.705242+00	105	order_anonymous	3		26	1
121	2022-02-22 06:52:07.846817+00	104	order_anonymous	3		26	1
122	2022-02-22 06:52:07.989138+00	103	order_anonymous	3		26	1
123	2022-02-22 06:52:08.130552+00	102	order_anonymous	3		26	1
124	2022-02-22 06:52:08.272119+00	101	order_anonymous	3		26	1
125	2022-02-22 06:52:08.413808+00	100	order_anonymous	3		26	1
126	2022-02-22 06:52:08.555655+00	99	order_anonymous	3		26	1
127	2022-02-22 06:52:08.697115+00	98	order_anonymous	3		26	1
128	2022-02-22 06:52:08.838958+00	97	order_Mr Tomms_ 01677012475	3		26	1
129	2022-02-22 06:52:08.98047+00	96	order_Mr Tomms_ 01677012475	3		26	1
130	2022-02-22 06:52:09.122146+00	95	order_anonymous	3		26	1
131	2022-02-22 06:52:09.263688+00	94	order_anonymous	3		26	1
132	2022-02-22 06:52:09.405227+00	93	order_anonymous	3		26	1
133	2022-02-22 06:52:09.546544+00	92	order_Mr Tomms_ 01677012475	3		26	1
134	2022-02-22 06:52:09.688652+00	91	order_anonymous	3		26	1
135	2022-02-22 06:52:09.830304+00	90	order_anonymous	3		26	1
136	2022-02-22 06:52:09.973536+00	89	order_anonymous	3		26	1
137	2022-02-22 06:52:10.152932+00	88	order_anonymous	3		26	1
138	2022-02-22 06:52:10.294392+00	87	order_anonymous	3		26	1
139	2022-02-22 06:52:10.436437+00	86	order_anonymous	3		26	1
140	2022-02-22 06:52:10.578028+00	85	order_anonymous	3		26	1
141	2022-02-22 06:52:10.719668+00	84	order_anonymous	3		26	1
142	2022-02-22 06:52:10.862486+00	83	order_anonymous	3		26	1
143	2022-02-22 06:52:11.004444+00	82	order_anonymous	3		26	1
144	2022-02-22 06:52:11.146524+00	81	order_anonymous	3		26	1
145	2022-02-22 06:52:11.292136+00	80	order_anonymous	3		26	1
146	2022-02-22 06:52:11.433837+00	79	order_anonymous	3		26	1
147	2022-02-22 06:52:11.57527+00	78	order_anonymous	3		26	1
148	2022-02-22 06:52:36.125733+00	77	order_anonymous	3		26	1
149	2022-02-22 06:52:36.267636+00	76	order_anonymous	3		26	1
150	2022-02-22 06:52:36.409183+00	75	order_anonymous	3		26	1
151	2022-02-22 06:52:36.550542+00	74	order_anonymous	3		26	1
152	2022-02-22 06:52:36.691993+00	73	order_anonymous	3		26	1
153	2022-02-22 06:52:36.833563+00	72	order_anonymous	3		26	1
154	2022-02-22 06:52:36.974885+00	71	order_anonymous	3		26	1
155	2022-02-22 06:52:37.116143+00	70	order_anonymous	3		26	1
156	2022-02-22 06:52:37.25729+00	69	order_anonymous	3		26	1
157	2022-02-22 06:52:37.398922+00	68	order_anonymous	3		26	1
158	2022-02-22 06:52:37.540162+00	67	order_anonymous	3		26	1
159	2022-02-22 06:52:37.681282+00	66	order_anonymous	3		26	1
160	2022-02-22 06:52:37.822386+00	65	order_anonymous	3		26	1
161	2022-02-22 06:52:37.963703+00	64	order_Mr Tomms_ 01677012475	3		26	1
162	2022-02-22 06:52:38.105185+00	63	order_anonymous	3		26	1
163	2022-02-22 06:52:38.246582+00	62	order_anonymous	3		26	1
164	2022-02-22 06:52:38.387779+00	61	order_anonymous	3		26	1
165	2022-02-22 06:52:38.528956+00	60	order_anonymous	3		26	1
166	2022-02-22 06:52:38.670189+00	59	order_anonymous	3		26	1
167	2022-02-22 06:52:38.811325+00	58	order_anonymous	3		26	1
168	2022-02-22 06:52:38.952898+00	57	order_anonymous	3		26	1
169	2022-02-22 06:52:39.09398+00	56	order_anonymous	3		26	1
170	2022-02-22 06:52:39.235621+00	55	order_anonymous	3		26	1
171	2022-02-22 06:52:39.377002+00	54	order_anonymous	3		26	1
172	2022-02-22 06:52:39.52134+00	53	order_anonymous	3		26	1
173	2022-02-22 06:52:39.662623+00	52	order_anonymous	3		26	1
174	2022-02-22 06:52:39.804088+00	51	order_anonymous	3		26	1
175	2022-02-22 06:52:39.945693+00	50	order_anonymous	3		26	1
176	2022-02-22 06:52:40.156341+00	49	order_anonymous	3		26	1
177	2022-02-22 06:52:40.297556+00	48	order_anonymous	3		26	1
178	2022-02-22 06:52:40.438749+00	47	order_anonymous	3		26	1
179	2022-02-22 06:52:40.579781+00	46	order_anonymous	3		26	1
180	2022-02-22 06:52:40.721051+00	45	order_anonymous	3		26	1
181	2022-02-22 06:52:40.862366+00	44	order_anonymous	3		26	1
182	2022-02-22 06:52:41.003758+00	43	order_Mr Tomms_ 01677012475	3		26	1
183	2022-02-22 06:52:41.145026+00	42	order_anonymous	3		26	1
184	2022-02-22 06:52:41.286852+00	41	order_anonymous	3		26	1
185	2022-02-22 06:52:41.428092+00	40	order_anonymous	3		26	1
186	2022-02-22 06:52:41.569211+00	39	order_anonymous	3		26	1
187	2022-02-22 06:52:41.711339+00	38	order_anonymous	3		26	1
188	2022-02-22 06:52:41.852436+00	37	order_anonymous	3		26	1
189	2022-02-22 06:52:41.993777+00	36	order_anonymous	3		26	1
190	2022-02-22 06:52:42.134915+00	35	order_anonymous	3		26	1
191	2022-02-22 06:52:42.276408+00	34	order_anonymous	3		26	1
192	2022-02-22 06:52:42.41777+00	33	order_anonymous	3		26	1
193	2022-02-22 06:52:42.559462+00	32	order_anonymous	3		26	1
194	2022-02-22 06:52:42.700696+00	31	order_anonymous	3		26	1
195	2022-02-22 06:52:42.841828+00	30	order_anonymous	3		26	1
196	2022-02-22 06:52:42.984366+00	29	order_anonymous	3		26	1
197	2022-02-22 06:52:43.125409+00	28	order_anonymous	3		26	1
198	2022-02-22 06:52:43.26692+00	27	order_anonymous	3		26	1
199	2022-02-22 06:52:43.408948+00	26	order_anonymous	3		26	1
200	2022-02-22 06:52:43.550237+00	25	order_anonymous	3		26	1
201	2022-02-22 06:52:43.691526+00	24	order_anonymous	3		26	1
202	2022-02-22 06:52:43.832765+00	23	order_anonymous	3		26	1
203	2022-02-22 06:52:43.973947+00	22	order_anonymous	3		26	1
204	2022-02-22 06:52:44.115174+00	21	order_anonymous	3		26	1
205	2022-02-22 06:52:44.256373+00	20	order_anonymous	3		26	1
206	2022-02-22 06:52:44.397775+00	19	order_anonymous	3		26	1
207	2022-02-22 06:52:44.538987+00	18	order_anonymous	3		26	1
208	2022-02-22 06:52:44.680079+00	17	order_anonymous	3		26	1
209	2022-02-22 06:52:44.8212+00	16	order_anonymous	3		26	1
210	2022-02-22 06:52:44.962406+00	15	order_anonymous	3		26	1
211	2022-02-22 06:52:45.2325+00	14	order_anonymous	3		26	1
212	2022-02-22 06:52:45.373651+00	13	order_anonymous	3		26	1
213	2022-02-22 06:52:45.514865+00	12	order_anonymous	3		26	1
214	2022-02-22 06:52:45.656218+00	11	order_anonymous	3		26	1
215	2022-02-22 06:52:45.799938+00	10	order__ 01953694359	3		26	1
216	2022-02-22 06:52:45.941303+00	9	order_anonymous	3		26	1
217	2022-02-22 06:52:46.08268+00	8	order_anonymous	3		26	1
218	2022-02-22 06:52:46.22392+00	7	order_anonymous	3		26	1
219	2022-02-22 06:52:46.365816+00	6	order_Mr Tomms_ 01677012475	3		26	1
220	2022-02-22 06:52:46.507248+00	5	order_Mr Tomms_ 01677012475	3		26	1
221	2022-02-22 06:52:46.648404+00	4	order_Mr Tomms_ 01677012475	3		26	1
222	2022-02-22 06:52:46.789619+00	3	order_Mr Tomms_ 01677012475	3		26	1
223	2022-02-22 06:52:46.931133+00	2	order_Mr Tomms_ 01677012475	3		26	1
224	2022-02-22 06:52:47.072387+00	1	order_Mr Tomms_ 01677012475	3		26	1
225	2022-02-22 09:33:01.825179+00	191	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
226	2022-02-22 09:33:20.211628+00	190	order_anonymous	3		26	1
227	2022-02-22 09:33:20.354914+00	189	order_anonymous	3		26	1
228	2022-02-22 09:33:20.497765+00	188	order_anonymous	3		26	1
229	2022-02-22 09:33:20.640351+00	187	order_anonymous	3		26	1
230	2022-02-22 09:33:20.783049+00	186	order_anonymous	3		26	1
231	2022-02-22 09:33:20.925761+00	185	order_anonymous	3		26	1
232	2022-02-22 09:33:21.068415+00	184	order_anonymous	3		26	1
233	2022-02-22 09:33:21.216534+00	183	order_anonymous	3		26	1
234	2022-02-22 09:33:21.359079+00	182	order_anonymous	3		26	1
235	2022-02-22 09:33:21.501685+00	181	order_anonymous	3		26	1
236	2022-02-22 09:33:21.643963+00	180	order_anonymous	3		26	1
237	2022-02-22 09:33:21.786582+00	179	order_anonymous	3		26	1
238	2022-02-22 09:39:45.408481+00	194	order_anonymous	3		26	1
239	2022-02-22 09:39:45.550929+00	193	order_anonymous	3		26	1
240	2022-02-22 09:39:45.692374+00	192	order_anonymous	3		26	1
241	2022-02-22 09:54:40.930002+00	196	order_anonymous	3		26	1
242	2022-02-22 09:54:41.074507+00	195	order_anonymous	3		26	1
243	2022-02-22 09:54:41.217346+00	191	order_Ashequr_ +8801684155305	3		26	1
244	2022-02-22 10:02:41.779784+00	197	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Tax"]}}]	26	1
245	2022-02-22 10:03:11.323614+00	197	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Tax"]}}]	26	1
246	2022-02-22 10:09:55.989235+00	198	order_anonymous	3		26	1
247	2022-02-22 10:12:52.491963+00	200	order_Ashequr_ +8801684155305	3		26	1
248	2022-02-22 10:12:52.63559+00	199	order_anonymous	3		26	1
249	2022-02-22 10:23:03.029356+00	203	order_Ashequr_ +8801684155305	3		26	1
250	2022-02-22 10:23:03.172539+00	202	order_Ashequr_ +8801684155305	3		26	1
251	2022-02-22 10:23:03.3151+00	201	order_Ashequr_ +8801684155305	3		26	1
252	2022-02-22 10:23:03.457412+00	197	order_Ashequr_ +8801684155305	3		26	1
253	2022-02-22 11:15:50.75395+00	3	APPITIZER	2	[{"changed": {"fields": ["Title", "Description"]}}]	9	1
254	2022-02-22 11:17:13.011058+00	6	Salads	2	[{"changed": {"fields": ["Title", "Description"]}}]	9	1
255	2022-02-22 11:18:09.310064+00	1	CHICKEN BURGERS	2	[{"changed": {"fields": ["Title", "Description"]}}]	9	1
256	2022-02-22 11:18:44.199482+00	4	BEEF BURGERS	2	[{"changed": {"fields": ["Title", "Description"]}}]	9	1
257	2022-02-22 11:19:20.373566+00	2	WRAPS	2	[{"changed": {"fields": ["Title", "Description"]}}]	9	1
258	2022-02-22 11:19:52.326315+00	7	SET MEALS	1	[{"added": {}}]	9	1
259	2022-02-22 11:20:28.144558+00	8	PIZZA	1	[{"added": {}}]	9	1
260	2022-02-22 11:21:04.978497+00	9	FISH BITE	1	[{"added": {}}]	9	1
261	2022-02-22 11:21:28.066884+00	10	COLD SANDWICH	1	[{"added": {}}]	9	1
262	2022-02-22 11:22:01.499476+00	5	Beverages	2	[{"changed": {"fields": ["Title"]}}]	9	1
263	2022-02-22 11:34:11.042996+00	3	Cheese	3		23	1
264	2022-02-22 11:34:11.18538+00	2	Spicy Mayo Dip	3		23	1
265	2022-02-22 11:34:11.327154+00	1	Mayo Dip	3		23	1
266	2022-02-22 11:40:05.166101+00	6	Classic Fries(Regular)	2	[{"changed": {"fields": ["Title", "Description", "Group", "Price", "Category"]}}]	18	1
267	2022-02-22 12:01:12.82946+00	6	Classic Fries(Regular)	2	[{"changed": {"fields": ["Image"]}}]	18	1
268	2022-02-22 12:08:46.284965+00	5	Masala Fries(Regular)	2	[{"changed": {"fields": ["Title", "Description", "Group", "Image", "Price", "Category"]}}]	18	1
269	2022-02-23 04:27:48.959425+00	4	Hand Cut Potato Wedges-Served with Dipping Sauce	2	[{"changed": {"fields": ["Title", "Description", "Image", "Price", "Category"]}}]	18	1
270	2022-02-23 04:32:08.277102+00	3	BBQ Chicken Wings-Served with Dipping Sauce -6pcs	2	[{"changed": {"fields": ["Title", "Description", "Price", "Category"]}}]	18	1
271	2022-02-23 04:33:43.455949+00	3	BBQ Chicken Wings-Served with Dipping Sauce -6pcs	2	[{"changed": {"fields": ["Image"]}}]	18	1
272	2022-02-23 04:34:36.661736+00	2	BBQ Chicken Wings-Served with Dipping Sauce 12pcs	2	[{"changed": {"fields": ["Title", "Description", "Image", "Category"]}}]	18	1
273	2022-02-23 04:36:12.607855+00	7	Naga Chicken Wings-Served with Dipping Sauce 6Pcs	1	[{"added": {}}]	18	1
274	2022-02-23 04:37:35.863666+00	8	Naga Chicken Wings-Served with Dipping Sauce 12Pcs	1	[{"added": {}}]	18	1
275	2022-02-23 04:38:02.392795+00	2	BBQ Chicken Wings-Served with Dipping Sauce 12pcs	2	[{"changed": {"fields": ["Price"]}}]	18	1
276	2022-02-23 04:39:54.736195+00	9	Egg and Potato Salad 350gm	1	[{"added": {}}]	18	1
277	2022-02-23 04:41:27.963984+00	10	Russian Salad 350gm	1	[{"added": {}}]	18	1
278	2022-02-23 04:41:53.225071+00	9	Egg and Potato Salad 350gm	2	[{"changed": {"fields": ["Group"]}}]	18	1
279	2022-02-23 04:43:07.806988+00	11	Chicken Cashew Nut Salad 350gm	1	[{"added": {}}]	18	1
280	2022-02-23 04:45:36.430517+00	12	Classic Chicken Salad 350gm	1	[{"added": {}}]	18	1
281	2022-02-23 04:45:42.673496+00	13	Classic Chicken Salad 350gm	1	[{"added": {}}]	18	1
282	2022-02-23 04:47:03.534211+00	14	Classic Tuna Salad 350gm	1	[{"added": {}}]	18	1
283	2022-02-23 04:49:48.221956+00	15	Fresh Green Salad 350gm	1	[{"added": {}}]	18	1
284	2022-02-23 04:53:43.216764+00	16	Classic Chicken Burger with Cheese and Fries	1	[{"added": {}}]	18	1
285	2022-02-23 05:00:58.414976+00	211	order_Ratul_ +8801777013381	1	[{"added": {}}]	26	1
286	2022-02-23 05:16:45.168879+00	17	Crispy Chicken Burger with Cheese and Fries	1	[{"added": {}}]	18	1
287	2022-02-23 05:27:55.691258+00	18	Crispy Chicken Blaster Burger Doubled-Up with Cheese and Fries	1	[{"added": {}}]	18	1
288	2022-02-23 05:58:13.941039+00	19	Chicken Supreme Blaster Burger Doubled-Up with Cheese and Fries	1	[{"added": {}}]	18	1
289	2022-02-23 05:59:03.590243+00	20	Classic Beef Burger with Cheese and Fries	1	[{"added": {}}]	18	1
290	2022-02-23 05:59:11.127283+00	21	Classic Beef Burger with Cheese and Fries	1	[{"added": {}}]	18	1
291	2022-02-23 05:59:11.281847+00	22	Classic Beef Burger with Cheese and Fries	1	[{"added": {}}]	18	1
292	2022-02-23 05:59:39.926053+00	20	Classic Beef Burger with Cheese and Fries	3		18	1
293	2022-02-23 06:12:15.340318+00	22	Classic Beef Burger with Cheese and Fries	3		18	1
294	2022-02-23 06:13:24.937303+00	23	Beef Cheese Delight with Fries	1	[{"added": {}}]	18	1
295	2022-02-23 06:19:50.028512+00	24	Set Meal 1	1	[{"added": {}}]	18	1
296	2022-02-23 06:20:18.475674+00	24	Set Meal 1	2	[{"changed": {"fields": ["Description"]}}]	18	1
297	2022-02-23 06:21:16.756368+00	7	SET MEALS (MEAT)	2	[{"changed": {"fields": ["Title"]}}]	9	1
298	2022-02-23 06:22:32.493556+00	25	Set Meal 2	1	[{"added": {}}]	18	1
299	2022-02-23 06:23:36.901245+00	26	Set Meal 3	1	[{"added": {}}]	18	1
300	2022-02-23 06:24:58.385544+00	27	Set Meal 4	1	[{"added": {}}]	18	1
301	2022-02-23 06:26:06.130899+00	28	Set Meal 5	1	[{"added": {}}]	18	1
302	2022-02-23 06:27:14.270246+00	29	Set Meal 6	1	[{"added": {}}]	18	1
303	2022-02-23 06:28:52.950157+00	30	Set Meal 7-	1	[{"added": {}}]	18	1
304	2022-02-23 06:29:23.754828+00	30	Set Meal 7	2	[{"changed": {"fields": ["Title"]}}]	18	1
305	2022-02-23 06:34:10.02373+00	11	SET MEAL (FISH)	1	[{"added": {}}]	9	1
306	2022-02-23 06:35:17.100986+00	31	Set Meal 8	1	[{"added": {}}]	18	1
307	2022-02-23 06:35:53.928835+00	31	Set Meal 8	2	[{"changed": {"fields": ["Category"]}}]	18	1
308	2022-02-23 06:37:29.347364+00	32	Fish Pops	1	[{"added": {}}]	18	1
309	2022-02-23 06:38:47.868416+00	33	Fish Fingers	1	[{"added": {}}]	18	1
310	2022-02-23 06:40:01.094078+00	34	Fish & Chips	1	[{"added": {}}]	18	1
311	2022-02-23 06:57:22.696622+00	35	Fried Calamari	1	[{"added": {}}]	18	1
312	2022-02-23 07:23:07.323584+00	36	Mineral Water 250ml	1	[{"added": {}}]	18	1
313	2022-02-23 07:25:24.994488+00	37	Coca Cola Pet 250ml	1	[{"added": {}}]	18	1
314	2022-02-23 07:27:48.802767+00	38	Sprite Pet 250ml	1	[{"added": {}}]	18	1
315	2022-02-23 07:30:24.261202+00	39	Vegetable Salad Sandwich	1	[{"added": {}}]	18	1
316	2022-02-23 07:32:12.341467+00	40	Cheese Sandwich	1	[{"added": {}}]	18	1
317	2022-02-23 07:34:34.013165+00	207	order_Ashequr_ +8801684155305	3		26	1
318	2022-02-23 07:34:54.51551+00	41	Chicken Salad & Egg Sandwich	1	[{"added": {}}]	18	1
319	2022-02-23 07:36:05.383855+00	42	Beef Pepperoni Sandwich	1	[{"added": {}}]	18	1
320	2022-02-23 07:38:23.157639+00	12	SEA FISH PIZZA	1	[{"added": {}}]	9	1
321	2022-02-23 07:40:13.613484+00	43	Seafood Special	1	[{"added": {}}]	18	1
322	2022-02-23 08:04:56.839414+00	44	Chef's Special	1	[{"added": {}}]	18	1
323	2022-02-23 08:06:07.120477+00	45	Margherita Madness	1	[{"added": {}}]	18	1
324	2022-02-23 08:07:30.331793+00	46	Chicken Heist	1	[{"added": {}}]	18	1
325	2022-02-23 08:30:53.946566+00	47	Tandoori Tashki	1	[{"added": {}}]	18	1
326	2022-02-23 08:32:58.79149+00	48	Mexican Fighter	1	[{"added": {}}]	18	1
327	2022-02-23 09:13:36.90029+00	49	Chicken Impossible	1	[{"added": {}}]	18	1
328	2022-02-23 09:15:49.995409+00	50	The Room Mafia	1	[{"added": {}}]	18	1
329	2022-02-23 09:20:43.21688+00	51	Naga Moon	1	[{"added": {}}]	18	1
330	2022-02-23 09:21:30.679639+00	52	Pepperoni Parlour	1	[{"added": {}}]	18	1
331	2022-02-23 09:25:04.940033+00	53	Beef Blaster Burger Doubled-Up with Cheese and Fries	1	[{"added": {}}]	18	1
332	2022-02-23 09:38:37.286939+00	13	PANINI	1	[{"added": {}}]	9	1
333	2022-02-23 09:39:05.617367+00	54	Grilled Vegetable Panini	1	[{"added": {}}]	18	1
334	2022-02-23 09:39:36.434668+00	54	Grilled Vegetable Panini	2	[{"changed": {"fields": ["Category"]}}]	18	1
335	2022-02-23 09:44:39.994339+00	55	Grilled Chicken & Cheese Panini	1	[{"added": {}}]	18	1
336	2022-02-23 09:46:22.670824+00	55	Pizza Panini	2	[{"changed": {"fields": ["Title", "Price"]}}]	18	1
337	2022-02-23 09:49:35.809571+00	56	Bacon Blast Cheese Panini	1	[{"added": {}}]	18	1
338	2022-02-23 09:49:46.637535+00	57	Bacon Blast Cheese Panini	1	[{"added": {}}]	18	1
339	2022-02-23 09:50:28.487477+00	56	Bacon Blast Cheese Panini	3		18	1
340	2022-02-23 09:55:39.230383+00	58	LeWrap Vegan	1	[{"added": {}}]	18	1
341	2022-02-23 09:57:14.794858+00	59	Grilled Chicken Wrap	1	[{"added": {}}]	18	1
342	2022-02-23 09:59:42.658587+00	60	Beef Wrap	1	[{"added": {}}]	18	1
343	2022-02-23 10:00:43.342908+00	61	Beef Wrap with Bacon	1	[{"added": {}}]	18	1
344	2022-02-24 05:18:06.430185+00	211	order_Ratul_ +8801777013381	2	[{"changed": {"fields": ["Cart"]}}]	26	1
345	2022-02-24 05:19:12.352857+00	220	order_Ratul_ +8801777013381	1	[{"added": {}}]	26	1
346	2022-02-24 08:02:23.797447+00	240	order_anonymous	3		26	1
347	2022-02-24 08:02:23.940404+00	239	order_anonymous	3		26	1
348	2022-02-24 08:02:24.082343+00	238	order_anonymous	3		26	1
349	2022-02-24 08:02:24.224443+00	237	order_anonymous	3		26	1
350	2022-02-24 08:02:24.366418+00	236	order_anonymous	3		26	1
351	2022-02-24 08:02:24.508509+00	235	order_anonymous	3		26	1
352	2022-02-24 08:02:24.650604+00	234	order_anonymous	3		26	1
353	2022-02-24 08:02:24.792814+00	233	order_anonymous	3		26	1
354	2022-02-24 08:02:24.934719+00	232	order_anonymous	3		26	1
355	2022-02-24 08:02:25.126459+00	231	order_anonymous	3		26	1
356	2022-02-24 08:02:25.2683+00	230	order_anonymous	3		26	1
357	2022-02-24 08:02:25.410302+00	229	order_anonymous	3		26	1
358	2022-02-24 08:02:25.552811+00	228	order_anonymous	3		26	1
359	2022-02-24 08:02:25.694977+00	226	order_anonymous	3		26	1
360	2022-02-24 08:02:25.836899+00	225	order_anonymous	3		26	1
361	2022-02-24 08:02:25.978919+00	224	order_anonymous	3		26	1
362	2022-02-24 08:02:26.12084+00	223	order_anonymous	3		26	1
363	2022-02-24 08:02:26.263022+00	222	order_anonymous	3		26	1
364	2022-02-24 08:02:26.404838+00	221	order_anonymous	3		26	1
365	2022-02-24 08:02:26.546744+00	219	order_anonymous	3		26	1
366	2022-02-24 08:02:26.688697+00	218	order_anonymous	3		26	1
367	2022-02-24 08:02:26.831425+00	216	order_anonymous	3		26	1
368	2022-02-24 08:02:26.973321+00	215	order_anonymous	3		26	1
369	2022-02-24 08:02:27.115277+00	214	order_anonymous	3		26	1
370	2022-02-24 08:02:27.25723+00	213	order_anonymous	3		26	1
371	2022-02-24 08:02:27.399536+00	210	order_anonymous	3		26	1
372	2022-02-24 08:02:27.542979+00	209	order_anonymous	3		26	1
373	2022-02-24 08:02:27.684928+00	208	order_anonymous	3		26	1
374	2022-02-24 08:02:27.826831+00	206	order_anonymous	3		26	1
375	2022-02-24 08:02:27.968644+00	205	order_anonymous	3		26	1
376	2022-02-24 08:02:28.110534+00	204	order_anonymous	3		26	1
377	2022-02-24 09:45:17.201882+00	242	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
378	2022-02-24 10:59:37.749681+00	227	order_Ashequr_ +8801684155305	3		26	1
379	2022-02-24 10:59:37.896001+00	217	order_Ashequr_ +8801684155305	3		26	1
380	2022-02-24 10:59:38.037912+00	212	order_Ashequr_ +8801684155305	3		26	1
381	2022-02-24 12:06:04.390393+00	242	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
382	2022-02-24 12:10:53.42002+00	242	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
383	2022-02-24 12:11:15.39499+00	242	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
384	2022-02-24 12:12:13.435376+00	242	order_Ashequr_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
385	2022-02-27 10:28:08.008391+00	296	order_Ashequr_ +8801684155305	3		26	1
386	2022-02-27 10:28:08.155161+00	295	order_anonymous	3		26	1
387	2022-02-27 10:28:08.359075+00	294	order_anonymous	3		26	1
388	2022-02-27 10:28:08.501461+00	293	order_anonymous	3		26	1
389	2022-02-27 10:28:08.643457+00	292	order_anonymous	3		26	1
390	2022-02-27 10:28:08.785503+00	291	order_anonymous	3		26	1
391	2022-02-27 10:28:08.92769+00	290	order_anonymous	3		26	1
392	2022-02-27 10:28:09.078046+00	289	order_anonymous	3		26	1
393	2022-02-27 10:28:09.281124+00	288	order_anonymous	3		26	1
394	2022-02-27 10:28:09.464039+00	287	order_anonymous	3		26	1
395	2022-02-27 10:28:09.606053+00	286	order_anonymous	3		26	1
396	2022-02-27 10:28:09.748958+00	285	order_anonymous	3		26	1
397	2022-02-27 10:28:09.890821+00	284	order_anonymous	3		26	1
398	2022-02-27 10:28:10.033008+00	283	order_anonymous	3		26	1
399	2022-02-27 10:28:10.174924+00	282	order_anonymous	3		26	1
400	2022-02-27 10:28:10.316971+00	281	order_anonymous	3		26	1
401	2022-02-27 10:28:10.458989+00	280	order_anonymous	3		26	1
402	2022-02-27 10:28:10.600957+00	279	order_anonymous	3		26	1
403	2022-02-27 10:28:10.742906+00	278	order_anonymous	3		26	1
404	2022-02-27 10:28:10.884945+00	277	order_anonymous	3		26	1
405	2022-02-27 10:28:11.026923+00	276	order_anonymous	3		26	1
406	2022-02-27 10:28:11.16869+00	275	order_anonymous	3		26	1
407	2022-02-27 10:28:11.310772+00	274	order_anonymous	3		26	1
408	2022-02-27 10:28:11.452924+00	273	order_anonymous	3		26	1
409	2022-02-27 10:28:11.596822+00	272	order_anonymous	3		26	1
410	2022-02-27 10:28:11.7389+00	271	order_anonymous	3		26	1
411	2022-02-27 10:28:11.880862+00	270	order_anonymous	3		26	1
412	2022-02-27 10:28:12.023102+00	269	order_anonymous	3		26	1
413	2022-02-27 10:28:12.165107+00	268	order_anonymous	3		26	1
414	2022-02-27 10:28:12.307335+00	267	order_anonymous	3		26	1
415	2022-02-27 10:28:12.449111+00	266	order_anonymous	3		26	1
416	2022-02-27 10:28:12.591271+00	265	order_anonymous	3		26	1
417	2022-02-27 10:28:12.733307+00	264	order_Ashequr_ +8801684155305	3		26	1
418	2022-02-27 10:28:12.875542+00	263	order_anonymous	3		26	1
419	2022-02-27 10:28:13.017414+00	262	order_anonymous	3		26	1
420	2022-02-27 10:28:13.159338+00	261	order_anonymous	3		26	1
421	2022-02-27 10:28:13.301475+00	260	order_anonymous	3		26	1
422	2022-02-27 10:28:13.443464+00	259	order_anonymous	3		26	1
423	2022-02-27 10:28:13.585444+00	258	order_anonymous	3		26	1
424	2022-02-27 10:28:13.727598+00	257	order_anonymous	3		26	1
425	2022-02-27 10:28:13.869691+00	256	order_anonymous	3		26	1
426	2022-02-27 10:28:14.011844+00	255	order_anonymous	3		26	1
427	2022-02-27 10:28:14.15392+00	254	order_anonymous	3		26	1
428	2022-02-27 10:28:14.296419+00	253	order_Ashequr_ +8801684155305	3		26	1
429	2022-02-27 10:28:14.438415+00	252	order_Ashequr_ +8801684155305	3		26	1
430	2022-02-27 10:28:14.580496+00	251	order_Ashequr_ +8801684155305	3		26	1
431	2022-02-27 10:28:14.722571+00	250	order_Ashequr_ +8801684155305	3		26	1
432	2022-02-27 10:28:14.864674+00	249	order_Ashequr_ +8801684155305	3		26	1
433	2022-02-27 10:28:15.006884+00	248	order_Ashequr_ +8801684155305	3		26	1
434	2022-02-27 10:28:15.149317+00	247	order_Ashequr_ +8801684155305	3		26	1
435	2022-02-27 10:28:15.292078+00	246	order_Ashequr_ +8801684155305	3		26	1
436	2022-02-27 10:28:15.434099+00	245	order_Ashequr_ +8801684155305	3		26	1
437	2022-02-27 10:28:15.576+00	244	order_Ashequr_ +8801684155305	3		26	1
438	2022-02-27 10:28:15.717955+00	243	order_Ashequr_ +8801684155305	3		26	1
439	2022-02-27 10:28:15.859891+00	242	order_Ashequr_ +8801684155305	3		26	1
440	2022-02-27 10:28:16.002276+00	241	order_anonymous	3		26	1
441	2022-02-27 10:28:16.144425+00	220	order_Ratul_ +8801777013381	3		26	1
442	2022-02-27 10:28:16.286567+00	211	order_Ratul_ +8801777013381	3		26	1
443	2022-03-02 04:36:42.08477+00	34	Fish & Chips	2	[]	18	1
444	2022-03-02 10:40:46.996767+00	328	order_Ashh_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
445	2022-03-03 07:38:35.144037+00	331	order_Ashh_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
446	2022-03-03 07:38:37.044319+00	331	order_Ashh_ +8801684155305	2	[]	26	1
447	2022-03-03 08:21:15.423754+00	331	order_Ashh_ +8801684155305	2	[]	26	1
448	2022-03-06 09:15:53.519099+00	331	order_Ashh_ +8801684155305	2	[{"changed": {"fields": ["Ts delivery"]}}]	26	1
449	2022-03-06 10:06:42.013962+00	331	order_Ashh_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
450	2022-03-06 11:15:37.724092+00	330	order_Ashh_ +8801684155305	2	[{"changed": {"fields": ["Status"]}}]	26	1
451	2022-03-09 11:27:08.187717+00	1	Super Admin	1	[{"added": {}}]	3	1
452	2022-03-09 11:27:25.148731+00	2	Staff	1	[{"added": {}}]	3	1
453	2022-03-09 11:27:47.793373+00	3	Kitchen Staff	1	[{"added": {}}]	3	1
454	2022-03-10 10:50:02.527715+00	4	Spicy Level	1	[{"added": {}}]	22	1
455	2022-03-10 10:50:42.957783+00	4	Regular Spicy	1	[{"added": {}}]	23	1
456	2022-03-10 10:51:14.964782+00	5	More Spicy	1	[{"added": {}}]	23	1
457	2022-03-10 10:51:34.050831+00	6	Naga Spicy	1	[{"added": {}}]	23	1
458	2022-03-10 10:53:14.290613+00	2	BBQ Chicken Wings-Served with Dipping Sauce 12pcs	2	[{"changed": {"fields": ["Add ons"]}}]	18	1
459	2022-03-10 11:46:24.942897+00	2	Bootstrap	2	[{"changed": {"fields": ["Active"]}}]	19	1
460	2022-03-10 11:46:40.88987+00	1	Django	2	[{"changed": {"fields": ["Active"]}}]	19	1
461	2022-03-13 06:06:51.009495+00	334	order_Ashequr_ 123456789123213	2	[{"changed": {"fields": ["Status"]}}]	26	1
462	2022-03-13 11:07:48.895004+00	1	Title	1	[{"added": {}}]	28	1
463	2022-03-13 11:20:24.035202+00	1	Title	2	[{"changed": {"fields": ["Add on"]}}]	28	1
464	2022-03-13 11:20:49.07809+00	342	order_Ashequr_ 123456789123213	2	[{"changed": {"fields": ["Status"]}}]	26	1
465	2022-03-13 11:22:41.549977+00	61	Beef Wrap with Bacon	2	[{"changed": {"fields": ["Sides", "Add ons", "Category"]}}, {"added": {"name": "food-ingredient relationship", "object": "Food_ingredient object (7)"}}, {"added": {"name": "food-ingredient relationship", "object": "Food_ingredient object (8)"}}]	18	1
466	2022-03-14 05:55:04.420929+00	343	order_Ashequr_ 123456789123213	2	[{"changed": {"fields": ["Status"]}}]	26	1
467	2022-03-14 09:54:41.191444+00	14	Custom	1	[{"added": {}}]	9	1
468	2022-03-15 04:29:37.15958+00	62	bb	1	[{"added": {}}]	18	1
469	2022-03-15 04:30:46.43313+00	63	pp	1	[{"added": {}}]	18	1
470	2022-03-15 04:31:21.799012+00	63	pp	2	[{"changed": {"fields": ["Category"]}}]	18	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	apps	aboutus
8	apps	blog
9	apps	category
10	apps	dropdown
11	apps	faq
12	apps	ingredient
13	apps	notification
14	apps	user
15	apps	role
16	apps	screen
17	apps	paymentinfo
18	apps	food
19	admin_interface	theme
20	apps	cook
21	apps	banner
22	apps	addoncategory
23	apps	addon
24	apps	cart
25	apps	payment
26	apps	orderdetails
27	apps	settings
28	apps	subaddon
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-19 06:39:03.90696+00
2	auth	0001_initial	2021-12-19 06:39:10.254877+00
3	admin	0001_initial	2021-12-19 06:39:11.894595+00
4	admin	0002_logentry_remove_auto_add	2021-12-19 06:39:12.459515+00
5	admin	0003_logentry_add_action_flag_choices	2021-12-19 06:39:13.122649+00
6	contenttypes	0002_remove_content_type_name	2021-12-19 06:39:14.350905+00
7	auth	0002_alter_permission_name_max_length	2021-12-19 06:39:15.381967+00
8	auth	0003_alter_user_email_max_length	2021-12-19 06:39:16.401462+00
9	auth	0004_alter_user_username_opts	2021-12-19 06:39:17.219413+00
10	auth	0005_alter_user_last_login_null	2021-12-19 06:39:18.2416+00
11	auth	0006_require_contenttypes_0002	2021-12-19 06:39:19.062186+00
12	auth	0007_alter_validators_add_error_messages	2021-12-19 06:39:19.881606+00
13	auth	0008_alter_user_username_max_length	2021-12-19 06:39:20.844657+00
14	auth	0009_alter_user_last_name_max_length	2021-12-19 06:39:21.571405+00
15	auth	0010_alter_group_name_max_length	2021-12-19 06:39:22.483529+00
16	auth	0011_update_proxy_permissions	2021-12-19 06:39:23.364887+00
17	auth	0012_alter_user_first_name_max_length	2021-12-19 06:39:24.387308+00
18	apps	0001_initial	2021-12-19 06:39:35.856473+00
19	sessions	0001_initial	2021-12-19 06:39:37.229604+00
20	admin_interface	0001_initial	2021-12-19 06:52:47.816052+00
21	admin_interface	0002_add_related_modal	2021-12-19 06:52:50.275877+00
22	admin_interface	0003_add_logo_color	2021-12-19 06:52:51.505948+00
23	admin_interface	0004_rename_title_color	2021-12-19 06:52:52.528943+00
24	admin_interface	0005_add_recent_actions_visible	2021-12-19 06:52:53.760435+00
25	admin_interface	0006_bytes_to_str	2021-12-19 06:52:54.783334+00
26	admin_interface	0007_add_favicon	2021-12-19 06:52:56.015146+00
27	admin_interface	0008_change_related_modal_background_opacity_type	2021-12-19 06:52:57.445351+00
28	admin_interface	0009_add_enviroment	2021-12-19 06:52:59.084202+00
29	admin_interface	0010_add_localization	2021-12-19 06:52:59.903957+00
30	admin_interface	0011_add_environment_options	2021-12-19 06:53:01.901785+00
31	admin_interface	0012_update_verbose_names	2021-12-19 06:53:02.771394+00
32	admin_interface	0013_add_related_modal_close_button	2021-12-19 06:53:03.93943+00
33	admin_interface	0014_name_unique	2021-12-19 06:53:05.433972+00
34	admin_interface	0015_add_language_chooser_active	2021-12-19 06:53:06.661511+00
35	admin_interface	0016_add_language_chooser_display	2021-12-19 06:53:07.829622+00
36	admin_interface	0017_change_list_filter_dropdown	2021-12-19 06:53:08.539922+00
37	admin_interface	0018_theme_list_filter_sticky	2021-12-19 06:53:09.753896+00
38	admin_interface	0019_add_form_sticky	2021-12-19 06:53:11.371653+00
39	admin_interface	0020_module_selected_colors	2021-12-19 06:53:13.217341+00
40	admin_interface	0021_file_extension_validator	2021-12-19 06:53:14.033271+00
41	admin_interface	0022_add_logo_max_width_and_height	2021-12-19 06:53:15.877905+00
42	admin_interface	0023_theme_foldable_apps	2021-12-19 06:53:17.065597+00
43	admin_interface	0024_remove_theme_css	2021-12-19 06:53:18.071682+00
44	apps	0002_auto_20211219_1000	2021-12-19 10:00:44.087645+00
45	apps	0003_auto_20220110_0659	2022-01-10 07:01:16.652623+00
46	apps	0004_auto_20220110_0710	2022-01-10 07:10:28.487304+00
47	apps	0005_auto_20220110_0712	2022-01-10 07:12:09.557812+00
48	apps	0006_banner	2022-01-10 07:34:50.15184+00
49	apps	0007_auto_20220110_1052	2022-01-10 10:52:40.391326+00
50	apps	0008_cart	2022-01-11 10:51:20.61383+00
51	apps	0009_auto_20220111_1122	2022-01-19 10:34:38.983085+00
52	apps	0010_orderdetails_payment	2022-02-10 07:44:34.439273+00
53	apps	0011_alter_orderdetails_order_identifier	2022-02-10 08:18:19.630651+00
54	apps	0012_auto_20220210_0842	2022-02-10 08:42:37.899148+00
55	apps	0013_cart_status	2022-02-10 10:14:01.425822+00
56	apps	0014_settings	2022-03-09 07:00:01.705902+00
57	apps	0015_food_cook	2022-03-09 11:08:27.620022+00
58	apps	0016_settings_radius	2022-03-09 11:17:23.373962+00
59	apps	0017_user_category	2022-03-09 11:22:10.196064+00
60	apps	0018_auto_20220309_1131	2022-03-09 11:31:44.547087+00
61	apps	0019_subaddon	2022-03-13 11:03:02.488802+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: buznatsdb
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
45gztkf6di921rs4tnjd0y1d3h5mztzn	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1myq6a:xr2iZ0FjsFepPU7JNHuwG651pSMtUcX9pvalB3Q4TNQ	2022-01-02 06:55:36.781849+00
yic54wmyvsurq56ma3ag8ej5mqi0599v	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1myrfq:YzR-uPl-TKZMR7MnwklLgljI8TLOFfPZPRFwnrUkWh8	2022-01-02 08:36:06.214455+00
s5njqqvqwjoqcu69bdayp4yidoabis3b	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1n1mM2:4-UajAlDZNcTljFXLZdZT9iAYRn4GXH6EsMM_dw_Gi8	2022-01-10 09:31:42.386186+00
gwyopwff58hcwsrb9u3q6yk3swxazvam	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1n54Bu:ZpXlsAyZtaWF5PSSilG7hsjSvD_EpuZ3vef7TFyhGUA	2022-01-19 11:10:50.177429+00
hjvdy78y2y6u0cvjrq5n5i96koekeh6u	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1n6pEu:1maGIkL6knUydaLtMak4S8Qs9uHPKCJjMZCoLZuzCKI	2022-01-24 07:37:12.685125+00
zcrsm9xr8901bhbfef9ad358v4zbsvx8	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1n7BQn:vaDX2scLxF9JzDK1YF1B-gMA0sA_9eMTIrVkipt5meo	2022-01-25 07:18:57.154168+00
b7t7hyap1v2kzcm10u50p1u7t8oogmcz	.eJxVjEEOwiAQRe_C2pApUKa4dO8ZyMCMUjU0Ke3KeHfbpAvdvvf-f6tI61Li2mSOI6uz6tTplyXKT6m74AfV-6TzVJd5THpP9GGbvk4sr8vR_h0UamVbO8RAYJlNh9kPlMAm04csZM3gNgjOJLEQBD0ZvgECOySbA_QEntTnC8ZaNyY:1n91dc:_YfIeHTBlkplTfbFIPGiQxvNSC2E7OK5kW-kWv5tjGo	2022-01-30 09:15:48.435705+00
r32l8kudfq34kyeqedf37iw9qp2675r0	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nCx5Q:nu58joWt1KrVQhqWACjtGPX3szPP2EnCvX8RC9t597M	2022-02-10 05:12:44.441022+00
tgp4ardbpu6i3lg40kj1h1tww3zmbvpt	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nD2Rl:vFo5qnkdkeL2KKZA5rTRnGbj-zcsVTFwVB-1uDn4PWk	2022-02-10 10:56:09.233301+00
g2f85e4ncxy9xz6zn8czdt6febt104ud	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nEcBH:FTtJSR6YDOOtkJP4F_8U-KAZ2X17TtwQKR1JFWhwygo	2022-02-14 19:17:39.138774+00
j9w2tjv6bg5sd3tzb3ujlh47rbuki8ts	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nEtiz:lhDvTF1q0XJNPUx0mRNHhsG0DAODKSmwCJAVA9kXG4o	2022-02-15 14:01:37.605737+00
6oi6izf453nvmvf0jhvtaug66mppkirr	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nFZF3:2CkN7zhRPyqHmxmnpo2CLTCs2_x-pnvtTnX4GSlmiWU	2022-02-17 10:21:29.258647+00
czjxtp5ugi6p5y3s8r7qp44sotz2iv1q	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nGfPJ:PNHhZnl8c3TqJd8UiCYtySbCBDNPEHj2gwPqbESLxdQ	2022-02-20 11:08:37.142358+00
pbsba9bes5c4ru7oyzpiatug04vmj1xh	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nI4UO:OrcoNAR5GHQC_SJh3J3kP1JeaxXPiO_cMxqC_uJiHsg	2022-02-24 08:07:40.537941+00
qb7khs3tdaqjj62r3dc5xobr9447c4ko	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nJ8ZN:AmbU3SnflXv0aBIqX7VxycBRI5si1lL1b6jBI_ID_f0	2022-02-27 06:41:13.429489+00
r6u8zy0tlmri4hmn735y3kti5cw5sqn8	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nMMl9:yDhtOwieoeNkX6pO_02tRlYeIEA7LdvMA396HG5wzpw	2022-03-08 04:26:43.997601+00
z07821mp0r1xm8u69uox77jg2a6fpt3v	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nMOJm:m77RXhOB-G8Gq0kpLQk8QcHJMaZl6f0z6gR0zrDthXA	2022-03-08 06:06:34.998203+00
ha1elrcrp22klh7okl8exn7fawqimlay	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nMRDo:Ax5uBxkvJiRYn-2fwHPYzPfVCNEstElR3OZEYnCGROs	2022-03-08 09:12:36.167243+00
pgkvpdhlgr6liquo0lioob6nmfayrjz0	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nMSJM:CaB0z-NzsIFMoQmn19aJpdWXODiKHqmHQjdNA-q_cOk	2022-03-08 10:22:24.324498+00
ol72m7zzuiwygl1koyolfd68dpozpgds	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nMjDz:u4na8gOiVU1t5LTiihjHCg47HSDX4rt8_Mb5BwelA9M	2022-03-09 04:25:59.73162+00
19do2t6l1yrx5jgk5uwq8xhjxlxe2znd	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nN72C:23c8jxhS-M1gJpdacjvFl_HWD1_VC44VJcYtXaubu6A	2022-03-10 05:51:24.67315+00
brqw5z1qfc46hk9ol3unczgrpm14o6z7	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nN8cU:E_hkv8WLtXXVYZJEAcwnxNnl-yzsh55yAqwgb8RsODg	2022-03-10 07:32:58.203561+00
1rox4bqt4zo9ip7rgm2u98kdhf2tvop0	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nNCRx:DbS2zuTQU9TKwRJEr7OBxDoWo95bLu5pBqqksiu3CAk	2022-03-10 11:38:21.519832+00
ld6ri21vlp25xpqzx53ay91hud6ongj6	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nPMKM:6KsTfenn0di5hTrlO8kTeuHDFr1s3DHSTc6PbHmPGUI	2022-03-16 10:35:26.393592+00
7grndtl8cn34y792ttq9gkwqvlwgoihw	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nRpFE:iw3LA6-Ys6-ZcQCbPBgQ-jIRASj7rBqzeTriVBU6ZYc	2022-03-23 05:52:20.919486+00
sq8t26p7t055j6xluz6ddys9ux0xrvfd	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nS0yb:8vZkcCUuHxPAQu-HJv9Typ1-0IT8vLT0zlyOjLFtJxM	2022-03-23 18:23:57.532515+00
j32hfagwntxwt7i06dsdbl25qi3qj1tl	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nSF35:LXxoFILg0CRvunEBKPlO3uUFQuCaHp4tdAVxJmnPvRo	2022-03-24 09:25:31.924038+00
iv0o5y3eaptyxyxnp1azqpkbauv0timk	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nTHNG:PQEvQbbc2KDtk7hCSbUhEsjvi9UN_QVkY_H6USAP6Jk	2022-03-27 06:06:38.865612+00
mce28m2fq087v3y9svfsmqjr4t3fa6g5	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nTKpF:JiPDre34eu5I3O1qnS8GIICIERVQzkrqzmAyfv-ZVoA	2022-03-27 09:47:45.674393+00
36kdda98ymd7d5sa6i08qncm7uy6uj16	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nTM1y:vJGQeOLwFiE4n4EjlqtGVP80bATLlft01Z8IOIATXI8	2022-03-27 11:04:58.809736+00
ln34e5jwobg0pwdf3uoghha1luqgrlgo	.eJxVjEEOwiAQRe_C2hAKRTou3fcMZJhhbNVAUtqV8e7apAvd_vfef6mI2zrFreUlzqwuqlOn3y0hPXLZAd-x3KqmWtZlTnpX9EGbHivn5_Vw_w4mbNO3FkM-iRAMgh30xA5DEABvDWQCb3oDZyudIcfB9Y6d5eSBjbUoPg3q_QHyajfb:1nTcQI:o19Rwp9--olPHrdpNJY6TAUBdf62n4zbRNUzbhOcELo	2022-03-28 04:35:10.524135+00
\.


--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.admin_interface_theme_id_seq', 2, true);


--
-- Name: apps_aboutus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_aboutus_id_seq', 1, false);


--
-- Name: apps_addon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_addon_id_seq', 6, true);


--
-- Name: apps_addoncategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_addoncategory_id_seq', 4, true);


--
-- Name: apps_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_banner_id_seq', 4, true);


--
-- Name: apps_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_blog_id_seq', 1, false);


--
-- Name: apps_cart_add_on_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_cart_add_on_id_seq', 96, true);


--
-- Name: apps_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_cart_id_seq', 342, true);


--
-- Name: apps_cart_sides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_cart_sides_id_seq', 40, true);


--
-- Name: apps_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_category_id_seq', 14, true);


--
-- Name: apps_cook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_cook_id_seq', 5, true);


--
-- Name: apps_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_faq_id_seq', 1, false);


--
-- Name: apps_food_add_ons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_food_add_ons_id_seq', 17, true);


--
-- Name: apps_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_food_id_seq', 63, true);


--
-- Name: apps_food_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_food_ingredient_id_seq', 8, true);


--
-- Name: apps_food_sides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_food_sides_id_seq', 12, true);


--
-- Name: apps_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_ingredient_id_seq', 2, true);


--
-- Name: apps_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_notification_id_seq', 1, false);


--
-- Name: apps_orderdetails_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_orderdetails_cart_id_seq', 146, true);


--
-- Name: apps_orderdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_orderdetails_id_seq', 343, true);


--
-- Name: apps_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_payment_id_seq', 30, true);


--
-- Name: apps_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_settings_id_seq', 1, false);


--
-- Name: apps_subaddon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_subaddon_id_seq', 1, true);


--
-- Name: apps_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.apps_user_id_seq', 39, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 324, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 470, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: buznatsdb
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 61, true);


--
-- Name: admin_interface_theme admin_interface_theme_name_30bda70f_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_name_30bda70f_uniq UNIQUE (name);


--
-- Name: admin_interface_theme admin_interface_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_pkey PRIMARY KEY (id);


--
-- Name: apps_aboutus apps_aboutus_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_aboutus
    ADD CONSTRAINT apps_aboutus_pkey PRIMARY KEY (id);


--
-- Name: apps_addon apps_addon_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_addon
    ADD CONSTRAINT apps_addon_pkey PRIMARY KEY (id);


--
-- Name: apps_addoncategory apps_addoncategory_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_addoncategory
    ADD CONSTRAINT apps_addoncategory_pkey PRIMARY KEY (id);


--
-- Name: apps_banner apps_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_banner
    ADD CONSTRAINT apps_banner_pkey PRIMARY KEY (id);


--
-- Name: apps_blog apps_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_blog
    ADD CONSTRAINT apps_blog_pkey PRIMARY KEY (id);


--
-- Name: apps_cart_add_on apps_cart_add_on_cart_id_addon_id_f862e2b9_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_add_on
    ADD CONSTRAINT apps_cart_add_on_cart_id_addon_id_f862e2b9_uniq UNIQUE (cart_id, addon_id);


--
-- Name: apps_cart_add_on apps_cart_add_on_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_add_on
    ADD CONSTRAINT apps_cart_add_on_pkey PRIMARY KEY (id);


--
-- Name: apps_cart apps_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart
    ADD CONSTRAINT apps_cart_pkey PRIMARY KEY (id);


--
-- Name: apps_cart_sides apps_cart_sides_cart_id_food_id_d4bc41c1_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_sides
    ADD CONSTRAINT apps_cart_sides_cart_id_food_id_d4bc41c1_uniq UNIQUE (cart_id, food_id);


--
-- Name: apps_cart_sides apps_cart_sides_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_sides
    ADD CONSTRAINT apps_cart_sides_pkey PRIMARY KEY (id);


--
-- Name: apps_category apps_category_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_category
    ADD CONSTRAINT apps_category_pkey PRIMARY KEY (id);


--
-- Name: apps_cook apps_cook_another_phone_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cook
    ADD CONSTRAINT apps_cook_another_phone_key UNIQUE (another_phone);


--
-- Name: apps_cook apps_cook_email_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cook
    ADD CONSTRAINT apps_cook_email_key UNIQUE (email);


--
-- Name: apps_cook apps_cook_phone_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cook
    ADD CONSTRAINT apps_cook_phone_key UNIQUE (phone);


--
-- Name: apps_cook apps_cook_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cook
    ADD CONSTRAINT apps_cook_pkey PRIMARY KEY (id);


--
-- Name: apps_faq apps_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_faq
    ADD CONSTRAINT apps_faq_pkey PRIMARY KEY (id);


--
-- Name: apps_food_add_ons apps_food_add_ons_food_id_addon_id_a339b7f9_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_add_ons
    ADD CONSTRAINT apps_food_add_ons_food_id_addon_id_a339b7f9_uniq UNIQUE (food_id, addon_id);


--
-- Name: apps_food_add_ons apps_food_add_ons_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_add_ons
    ADD CONSTRAINT apps_food_add_ons_pkey PRIMARY KEY (id);


--
-- Name: apps_food_ingredient apps_food_ingredient_food_id_ingredient_id_594c4748_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_ingredient
    ADD CONSTRAINT apps_food_ingredient_food_id_ingredient_id_594c4748_uniq UNIQUE (food_id, ingredient_id);


--
-- Name: apps_food_ingredient apps_food_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_ingredient
    ADD CONSTRAINT apps_food_ingredient_pkey PRIMARY KEY (id);


--
-- Name: apps_food apps_food_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food
    ADD CONSTRAINT apps_food_pkey PRIMARY KEY (id);


--
-- Name: apps_food_sides apps_food_sides_from_food_id_to_food_id_ec1b048f_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_sides
    ADD CONSTRAINT apps_food_sides_from_food_id_to_food_id_ec1b048f_uniq UNIQUE (from_food_id, to_food_id);


--
-- Name: apps_food_sides apps_food_sides_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_sides
    ADD CONSTRAINT apps_food_sides_pkey PRIMARY KEY (id);


--
-- Name: apps_ingredient apps_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_ingredient
    ADD CONSTRAINT apps_ingredient_pkey PRIMARY KEY (id);


--
-- Name: apps_notification apps_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_notification
    ADD CONSTRAINT apps_notification_pkey PRIMARY KEY (id);


--
-- Name: apps_orderdetails_cart apps_orderdetails_cart_orderdetails_id_cart_id_547c6569_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails_cart
    ADD CONSTRAINT apps_orderdetails_cart_orderdetails_id_cart_id_547c6569_uniq UNIQUE (orderdetails_id, cart_id);


--
-- Name: apps_orderdetails_cart apps_orderdetails_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails_cart
    ADD CONSTRAINT apps_orderdetails_cart_pkey PRIMARY KEY (id);


--
-- Name: apps_orderdetails apps_orderdetails_order_identifier_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails
    ADD CONSTRAINT apps_orderdetails_order_identifier_key UNIQUE (order_identifier);


--
-- Name: apps_orderdetails apps_orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails
    ADD CONSTRAINT apps_orderdetails_pkey PRIMARY KEY (id);


--
-- Name: apps_payment apps_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_payment
    ADD CONSTRAINT apps_payment_pkey PRIMARY KEY (id);


--
-- Name: apps_payment apps_payment_vendor_uid_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_payment
    ADD CONSTRAINT apps_payment_vendor_uid_key UNIQUE (vendor_uid);


--
-- Name: apps_settings apps_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_settings
    ADD CONSTRAINT apps_settings_pkey PRIMARY KEY (id);


--
-- Name: apps_subaddon apps_subaddon_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_subaddon
    ADD CONSTRAINT apps_subaddon_pkey PRIMARY KEY (id);


--
-- Name: apps_user apps_user_email_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_user
    ADD CONSTRAINT apps_user_email_key UNIQUE (email);


--
-- Name: apps_user apps_user_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_user
    ADD CONSTRAINT apps_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: admin_interface_theme_name_30bda70f_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX admin_interface_theme_name_30bda70f_like ON public.admin_interface_theme USING btree (name varchar_pattern_ops);


--
-- Name: apps_aboutus_ts_created_34f453ec; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_aboutus_ts_created_34f453ec ON public.apps_aboutus USING btree (ts_created);


--
-- Name: apps_aboutus_ts_updated_fbb32c93; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_aboutus_ts_updated_fbb32c93 ON public.apps_aboutus USING btree (ts_updated);


--
-- Name: apps_addon_add_on_category_id_6f914cc3; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_addon_add_on_category_id_6f914cc3 ON public.apps_addon USING btree (add_on_category_id);


--
-- Name: apps_addon_ts_created_015a41bd; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_addon_ts_created_015a41bd ON public.apps_addon USING btree (ts_created);


--
-- Name: apps_addon_ts_updated_acccb958; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_addon_ts_updated_acccb958 ON public.apps_addon USING btree (ts_updated);


--
-- Name: apps_addoncategory_ts_created_bcbe0005; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_addoncategory_ts_created_bcbe0005 ON public.apps_addoncategory USING btree (ts_created);


--
-- Name: apps_addoncategory_ts_updated_087d99e7; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_addoncategory_ts_updated_087d99e7 ON public.apps_addoncategory USING btree (ts_updated);


--
-- Name: apps_banner_food_id_bacea47b; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_banner_food_id_bacea47b ON public.apps_banner USING btree (food_id);


--
-- Name: apps_banner_ts_created_0a709407; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_banner_ts_created_0a709407 ON public.apps_banner USING btree (ts_created);


--
-- Name: apps_banner_ts_updated_47499bd9; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_banner_ts_updated_47499bd9 ON public.apps_banner USING btree (ts_updated);


--
-- Name: apps_blog_ts_created_0e2b584b; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_blog_ts_created_0e2b584b ON public.apps_blog USING btree (ts_created);


--
-- Name: apps_blog_ts_updated_efa5f6ab; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_blog_ts_updated_efa5f6ab ON public.apps_blog USING btree (ts_updated);


--
-- Name: apps_cart_add_on_addon_id_324e3f5c; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_add_on_addon_id_324e3f5c ON public.apps_cart_add_on USING btree (addon_id);


--
-- Name: apps_cart_add_on_cart_id_59f05077; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_add_on_cart_id_59f05077 ON public.apps_cart_add_on USING btree (cart_id);


--
-- Name: apps_cart_food_id_7ca3931e; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_food_id_7ca3931e ON public.apps_cart USING btree (food_id);


--
-- Name: apps_cart_sides_cart_id_2755ad38; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_sides_cart_id_2755ad38 ON public.apps_cart_sides USING btree (cart_id);


--
-- Name: apps_cart_sides_food_id_3e8b05f5; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_sides_food_id_3e8b05f5 ON public.apps_cart_sides USING btree (food_id);


--
-- Name: apps_cart_ts_created_a562cbec; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_ts_created_a562cbec ON public.apps_cart USING btree (ts_created);


--
-- Name: apps_cart_ts_updated_24eec6ad; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_ts_updated_24eec6ad ON public.apps_cart USING btree (ts_updated);


--
-- Name: apps_cart_user_id_ad0fc918; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cart_user_id_ad0fc918 ON public.apps_cart USING btree (user_id);


--
-- Name: apps_category_ts_created_56ffae15; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_category_ts_created_56ffae15 ON public.apps_category USING btree (ts_created);


--
-- Name: apps_category_ts_updated_c5781bfd; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_category_ts_updated_c5781bfd ON public.apps_category USING btree (ts_updated);


--
-- Name: apps_cook_another_phone_3ba25196_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cook_another_phone_3ba25196_like ON public.apps_cook USING btree (another_phone varchar_pattern_ops);


--
-- Name: apps_cook_email_f7fb1313_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cook_email_f7fb1313_like ON public.apps_cook USING btree (email varchar_pattern_ops);


--
-- Name: apps_cook_phone_6023cb5c_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cook_phone_6023cb5c_like ON public.apps_cook USING btree (phone varchar_pattern_ops);


--
-- Name: apps_cook_ts_created_136df40e; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cook_ts_created_136df40e ON public.apps_cook USING btree (ts_created);


--
-- Name: apps_cook_ts_updated_07bb58f7; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_cook_ts_updated_07bb58f7 ON public.apps_cook USING btree (ts_updated);


--
-- Name: apps_faq_ts_created_5a1e8f31; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_faq_ts_created_5a1e8f31 ON public.apps_faq USING btree (ts_created);


--
-- Name: apps_faq_ts_updated_d5534038; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_faq_ts_updated_d5534038 ON public.apps_faq USING btree (ts_updated);


--
-- Name: apps_food_add_ons_addon_id_1918dac9; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_add_ons_addon_id_1918dac9 ON public.apps_food_add_ons USING btree (addon_id);


--
-- Name: apps_food_add_ons_food_id_de745a08; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_add_ons_food_id_de745a08 ON public.apps_food_add_ons USING btree (food_id);


--
-- Name: apps_food_category_id_c3b4c337; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_category_id_c3b4c337 ON public.apps_food USING btree (category_id);


--
-- Name: apps_food_cook_id_6d4d5320; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_cook_id_6d4d5320 ON public.apps_food USING btree (cook_id);


--
-- Name: apps_food_ingredient_food_id_52252acb; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_ingredient_food_id_52252acb ON public.apps_food_ingredient USING btree (food_id);


--
-- Name: apps_food_ingredient_ingredient_id_96a4c3b5; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_ingredient_ingredient_id_96a4c3b5 ON public.apps_food_ingredient USING btree (ingredient_id);


--
-- Name: apps_food_sides_from_food_id_b102bc39; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_sides_from_food_id_b102bc39 ON public.apps_food_sides USING btree (from_food_id);


--
-- Name: apps_food_sides_to_food_id_54139735; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_sides_to_food_id_54139735 ON public.apps_food_sides USING btree (to_food_id);


--
-- Name: apps_food_ts_created_0cc6e6c2; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_ts_created_0cc6e6c2 ON public.apps_food USING btree (ts_created);


--
-- Name: apps_food_ts_updated_4ad78c98; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_food_ts_updated_4ad78c98 ON public.apps_food USING btree (ts_updated);


--
-- Name: apps_ingredient_ts_created_821ead18; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_ingredient_ts_created_821ead18 ON public.apps_ingredient USING btree (ts_created);


--
-- Name: apps_ingredient_ts_updated_3190a89a; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_ingredient_ts_updated_3190a89a ON public.apps_ingredient USING btree (ts_updated);


--
-- Name: apps_notification_ts_created_8f555a1f; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_notification_ts_created_8f555a1f ON public.apps_notification USING btree (ts_created);


--
-- Name: apps_notification_ts_updated_b3b6a355; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_notification_ts_updated_b3b6a355 ON public.apps_notification USING btree (ts_updated);


--
-- Name: apps_orderdetails_cart_cart_id_6b4e854a; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_cart_cart_id_6b4e854a ON public.apps_orderdetails_cart USING btree (cart_id);


--
-- Name: apps_orderdetails_cart_orderdetails_id_f778a5cf; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_cart_orderdetails_id_f778a5cf ON public.apps_orderdetails_cart USING btree (orderdetails_id);


--
-- Name: apps_orderdetails_order_identifier_c146ea2c_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_order_identifier_c146ea2c_like ON public.apps_orderdetails USING btree (order_identifier varchar_pattern_ops);


--
-- Name: apps_orderdetails_ordered_by_id_715e7f16; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_ordered_by_id_715e7f16 ON public.apps_orderdetails USING btree (ordered_by_id);


--
-- Name: apps_orderdetails_ts_created_9dd9b096; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_ts_created_9dd9b096 ON public.apps_orderdetails USING btree (ts_created);


--
-- Name: apps_orderdetails_ts_updated_4894ff83; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_orderdetails_ts_updated_4894ff83 ON public.apps_orderdetails USING btree (ts_updated);


--
-- Name: apps_payment_order_id_4ff00636; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_payment_order_id_4ff00636 ON public.apps_payment USING btree (order_id);


--
-- Name: apps_payment_user_id_83461f35; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_payment_user_id_83461f35 ON public.apps_payment USING btree (user_id);


--
-- Name: apps_payment_vendor_uid_5ee9e5b3_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_payment_vendor_uid_5ee9e5b3_like ON public.apps_payment USING btree (vendor_uid varchar_pattern_ops);


--
-- Name: apps_settings_ts_created_4d6639a3; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_settings_ts_created_4d6639a3 ON public.apps_settings USING btree (ts_created);


--
-- Name: apps_settings_ts_updated_84420893; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_settings_ts_updated_84420893 ON public.apps_settings USING btree (ts_updated);


--
-- Name: apps_subaddon_add_on_id_26e631ce; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_subaddon_add_on_id_26e631ce ON public.apps_subaddon USING btree (add_on_id);


--
-- Name: apps_subaddon_ts_created_801355a8; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_subaddon_ts_created_801355a8 ON public.apps_subaddon USING btree (ts_created);


--
-- Name: apps_subaddon_ts_updated_87ba4c94; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_subaddon_ts_updated_87ba4c94 ON public.apps_subaddon USING btree (ts_updated);


--
-- Name: apps_user_email_40357ace_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_user_email_40357ace_like ON public.apps_user USING btree (email varchar_pattern_ops);


--
-- Name: apps_user_ts_created_b469cac4; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_user_ts_created_b469cac4 ON public.apps_user USING btree (ts_created);


--
-- Name: apps_user_ts_updated_0bf0a997; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX apps_user_ts_updated_0bf0a997 ON public.apps_user USING btree (ts_updated);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: buznatsdb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: apps_addon apps_addon_add_on_category_id_6f914cc3_fk_apps_addoncategory_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_addon
    ADD CONSTRAINT apps_addon_add_on_category_id_6f914cc3_fk_apps_addoncategory_id FOREIGN KEY (add_on_category_id) REFERENCES public.apps_addoncategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_banner apps_banner_food_id_bacea47b_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_banner
    ADD CONSTRAINT apps_banner_food_id_bacea47b_fk_apps_food_id FOREIGN KEY (food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart_add_on apps_cart_add_on_addon_id_324e3f5c_fk_apps_addon_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_add_on
    ADD CONSTRAINT apps_cart_add_on_addon_id_324e3f5c_fk_apps_addon_id FOREIGN KEY (addon_id) REFERENCES public.apps_addon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart_add_on apps_cart_add_on_cart_id_59f05077_fk_apps_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_add_on
    ADD CONSTRAINT apps_cart_add_on_cart_id_59f05077_fk_apps_cart_id FOREIGN KEY (cart_id) REFERENCES public.apps_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart apps_cart_food_id_7ca3931e_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart
    ADD CONSTRAINT apps_cart_food_id_7ca3931e_fk_apps_food_id FOREIGN KEY (food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart_sides apps_cart_sides_cart_id_2755ad38_fk_apps_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_sides
    ADD CONSTRAINT apps_cart_sides_cart_id_2755ad38_fk_apps_cart_id FOREIGN KEY (cart_id) REFERENCES public.apps_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart_sides apps_cart_sides_food_id_3e8b05f5_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart_sides
    ADD CONSTRAINT apps_cart_sides_food_id_3e8b05f5_fk_apps_food_id FOREIGN KEY (food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_cart apps_cart_user_id_ad0fc918_fk_apps_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_cart
    ADD CONSTRAINT apps_cart_user_id_ad0fc918_fk_apps_user_id FOREIGN KEY (user_id) REFERENCES public.apps_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_add_ons apps_food_add_ons_addon_id_1918dac9_fk_apps_addon_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_add_ons
    ADD CONSTRAINT apps_food_add_ons_addon_id_1918dac9_fk_apps_addon_id FOREIGN KEY (addon_id) REFERENCES public.apps_addon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_add_ons apps_food_add_ons_food_id_de745a08_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_add_ons
    ADD CONSTRAINT apps_food_add_ons_food_id_de745a08_fk_apps_food_id FOREIGN KEY (food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food apps_food_category_id_c3b4c337_fk_apps_category_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food
    ADD CONSTRAINT apps_food_category_id_c3b4c337_fk_apps_category_id FOREIGN KEY (category_id) REFERENCES public.apps_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food apps_food_cook_id_6d4d5320_fk_apps_cook_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food
    ADD CONSTRAINT apps_food_cook_id_6d4d5320_fk_apps_cook_id FOREIGN KEY (cook_id) REFERENCES public.apps_cook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_ingredient apps_food_ingredient_food_id_52252acb_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_ingredient
    ADD CONSTRAINT apps_food_ingredient_food_id_52252acb_fk_apps_food_id FOREIGN KEY (food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_ingredient apps_food_ingredient_ingredient_id_96a4c3b5_fk_apps_ingr; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_ingredient
    ADD CONSTRAINT apps_food_ingredient_ingredient_id_96a4c3b5_fk_apps_ingr FOREIGN KEY (ingredient_id) REFERENCES public.apps_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_sides apps_food_sides_from_food_id_b102bc39_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_sides
    ADD CONSTRAINT apps_food_sides_from_food_id_b102bc39_fk_apps_food_id FOREIGN KEY (from_food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_food_sides apps_food_sides_to_food_id_54139735_fk_apps_food_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_food_sides
    ADD CONSTRAINT apps_food_sides_to_food_id_54139735_fk_apps_food_id FOREIGN KEY (to_food_id) REFERENCES public.apps_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_orderdetails_cart apps_orderdetails_ca_orderdetails_id_f778a5cf_fk_apps_orde; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails_cart
    ADD CONSTRAINT apps_orderdetails_ca_orderdetails_id_f778a5cf_fk_apps_orde FOREIGN KEY (orderdetails_id) REFERENCES public.apps_orderdetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_orderdetails_cart apps_orderdetails_cart_cart_id_6b4e854a_fk_apps_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails_cart
    ADD CONSTRAINT apps_orderdetails_cart_cart_id_6b4e854a_fk_apps_cart_id FOREIGN KEY (cart_id) REFERENCES public.apps_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_orderdetails apps_orderdetails_ordered_by_id_715e7f16_fk_apps_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_orderdetails
    ADD CONSTRAINT apps_orderdetails_ordered_by_id_715e7f16_fk_apps_user_id FOREIGN KEY (ordered_by_id) REFERENCES public.apps_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_payment apps_payment_order_id_4ff00636_fk_apps_orderdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_payment
    ADD CONSTRAINT apps_payment_order_id_4ff00636_fk_apps_orderdetails_id FOREIGN KEY (order_id) REFERENCES public.apps_orderdetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_payment apps_payment_user_id_83461f35_fk_apps_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_payment
    ADD CONSTRAINT apps_payment_user_id_83461f35_fk_apps_user_id FOREIGN KEY (user_id) REFERENCES public.apps_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apps_subaddon apps_subaddon_add_on_id_26e631ce_fk_apps_addon_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.apps_subaddon
    ADD CONSTRAINT apps_subaddon_add_on_id_26e631ce_fk_apps_addon_id FOREIGN KEY (add_on_id) REFERENCES public.apps_addon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: buznatsdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: buznatsdb
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO buznatsdb;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

