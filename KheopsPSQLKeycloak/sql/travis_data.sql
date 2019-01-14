--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(4000),
    user_id character varying(36),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.credential_attribute OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.fed_credential_attribute OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(255),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT 'HmacSHA1'::character varying,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36),
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(36),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36)
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(36) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    last_session_refresh integer,
    offline_flag character varying(4) NOT NULL,
    data text
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(36) NOT NULL,
    requester character varying(36) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(36)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(36) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(36),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
8b36d87f-1dc9-42a5-8341-26d0416fb53d	\N	auth-cookie	master	d2ce947a-e6cc-45d1-b49e-862b2faaee25	2	10	f	\N	\N
3b1d0f6a-633e-4b4d-8c48-75fbe3d0fe29	\N	auth-spnego	master	d2ce947a-e6cc-45d1-b49e-862b2faaee25	3	20	f	\N	\N
5f948a1e-2c4a-4be5-b43c-136330d8dc91	\N	identity-provider-redirector	master	d2ce947a-e6cc-45d1-b49e-862b2faaee25	2	25	f	\N	\N
6e15642d-6fc7-4e23-bbb4-165b178b63f4	\N	\N	master	d2ce947a-e6cc-45d1-b49e-862b2faaee25	2	30	t	c3c9ac50-b6ce-4db3-87fc-27ff8707bae9	\N
1aee7490-dfe1-4181-8c85-0e5605024074	\N	auth-username-password-form	master	c3c9ac50-b6ce-4db3-87fc-27ff8707bae9	0	10	f	\N	\N
330cc4ee-c161-44b3-ae08-236af9b9b219	\N	auth-otp-form	master	c3c9ac50-b6ce-4db3-87fc-27ff8707bae9	1	20	f	\N	\N
71fad1c6-20b1-4c74-846e-14987ef06b6a	\N	direct-grant-validate-username	master	0e98f71b-fdc6-4534-9d57-efa48d43df5e	0	10	f	\N	\N
7a84ec91-40c3-43f7-9964-6dcc35c09612	\N	direct-grant-validate-password	master	0e98f71b-fdc6-4534-9d57-efa48d43df5e	0	20	f	\N	\N
c6a19542-e7f0-4ea0-b878-36048531a1ec	\N	direct-grant-validate-otp	master	0e98f71b-fdc6-4534-9d57-efa48d43df5e	1	30	f	\N	\N
cdd0d2c7-3f88-47e7-bfc2-9ed733a71041	\N	registration-page-form	master	1b72a2a9-461c-45cd-93d8-4e0f210cb6f5	0	10	t	3f82ca7c-9f86-480a-a01b-dc8658400687	\N
503207c9-aa72-4057-a9e8-9f3b37d2242a	\N	registration-user-creation	master	3f82ca7c-9f86-480a-a01b-dc8658400687	0	20	f	\N	\N
bdca923e-86a1-4572-9d42-ea86e0eae3e9	\N	registration-profile-action	master	3f82ca7c-9f86-480a-a01b-dc8658400687	0	40	f	\N	\N
7aed1e4b-0808-4200-90b5-e86a685d8ff2	\N	registration-password-action	master	3f82ca7c-9f86-480a-a01b-dc8658400687	0	50	f	\N	\N
9110ed64-0404-4678-968a-eacd09eb949f	\N	registration-recaptcha-action	master	3f82ca7c-9f86-480a-a01b-dc8658400687	3	60	f	\N	\N
d312c1ee-153c-4ad5-b983-d70250acb770	\N	reset-credentials-choose-user	master	5578dfae-95ea-44ca-ae8f-f88c7abac744	0	10	f	\N	\N
41e10de7-1332-40dc-af52-24e62735b639	\N	reset-credential-email	master	5578dfae-95ea-44ca-ae8f-f88c7abac744	0	20	f	\N	\N
566718a8-d8f7-407c-a44a-d3f90a76297a	\N	reset-password	master	5578dfae-95ea-44ca-ae8f-f88c7abac744	0	30	f	\N	\N
269fdf12-e929-48fd-8c99-e352577f60f0	\N	reset-otp	master	5578dfae-95ea-44ca-ae8f-f88c7abac744	1	40	f	\N	\N
461494ff-4209-4c90-93e0-0761ced501d9	\N	client-secret	master	7988ecba-7e4d-409f-ae3b-5f5d163f959d	2	10	f	\N	\N
8a721902-0b21-4708-b383-cc3030683bdf	\N	client-jwt	master	7988ecba-7e4d-409f-ae3b-5f5d163f959d	2	20	f	\N	\N
1c0278ed-c82b-4ecc-9eae-3f33cf92c683	\N	client-secret-jwt	master	7988ecba-7e4d-409f-ae3b-5f5d163f959d	2	30	f	\N	\N
a923fb51-9d15-4195-96b3-047fc4c545c8	\N	client-x509	master	7988ecba-7e4d-409f-ae3b-5f5d163f959d	2	40	f	\N	\N
0249c301-a575-45d2-9316-de97dfda4923	\N	idp-review-profile	master	3d0dd06d-714b-4a50-8b67-4681844509fd	0	10	f	\N	4be0d261-5feb-4ea0-bcb7-966c3af8f529
34f22330-30e0-419f-90f8-2120df238e25	\N	idp-create-user-if-unique	master	3d0dd06d-714b-4a50-8b67-4681844509fd	2	20	f	\N	a207c92b-60a4-4ca0-8f4d-15cd58663243
72546da9-b116-435d-ac2e-611a79a24a0e	\N	\N	master	3d0dd06d-714b-4a50-8b67-4681844509fd	2	30	t	8a4aaf88-8fb6-440e-9083-94744f517de8	\N
198ac2b4-f78e-426b-9568-564c406a636f	\N	idp-confirm-link	master	8a4aaf88-8fb6-440e-9083-94744f517de8	0	10	f	\N	\N
adbedb89-898e-4ccf-ac7b-e284bf65def0	\N	idp-email-verification	master	8a4aaf88-8fb6-440e-9083-94744f517de8	2	20	f	\N	\N
a2d107c3-c809-4aa0-b3d9-2cb082df2905	\N	\N	master	8a4aaf88-8fb6-440e-9083-94744f517de8	2	30	t	fb7576ea-f376-4b28-addd-d22aefa95e07	\N
a6ca7f0b-4ab8-4caa-aeef-d0608acc0a61	\N	idp-username-password-form	master	fb7576ea-f376-4b28-addd-d22aefa95e07	0	10	f	\N	\N
0389a1b4-6973-4bda-b0b2-1cc4051bb736	\N	auth-otp-form	master	fb7576ea-f376-4b28-addd-d22aefa95e07	1	20	f	\N	\N
dabcc36e-1a66-4734-b372-5ce07365051a	\N	http-basic-authenticator	master	379071e8-0a8c-484b-8cf9-b4e4a172c31c	0	10	f	\N	\N
8568a492-a7a5-47c9-a998-16fe004c623a	\N	docker-http-basic-authenticator	master	c3213258-599c-4a3e-bd33-6557fbb40379	0	10	f	\N	\N
5832c176-ed16-43c1-8c62-1a76ac6b7c93	\N	no-cookie-redirect	master	bda42efc-002f-49e4-8fe6-8b98f502222f	0	10	f	\N	\N
b5574255-44f1-48ca-9b24-bbec96a88f0b	\N	basic-auth	master	bda42efc-002f-49e4-8fe6-8b98f502222f	0	20	f	\N	\N
259183dd-eb06-4160-a9b3-fa70dae61478	\N	basic-auth-otp	master	bda42efc-002f-49e4-8fe6-8b98f502222f	3	30	f	\N	\N
ef10265d-4775-40da-ab3e-61fbe9652928	\N	auth-spnego	master	bda42efc-002f-49e4-8fe6-8b98f502222f	3	40	f	\N	\N
c0668c56-2859-4a03-a752-f863bff28505	\N	auth-cookie	StaticLoginConnect	117937d8-3b00-414c-b9c6-fb877dec8385	2	10	f	\N	\N
e0fec201-f3e5-493c-af0f-9764ec3da621	\N	auth-spnego	StaticLoginConnect	117937d8-3b00-414c-b9c6-fb877dec8385	3	20	f	\N	\N
c626c4d8-6db8-4f68-89aa-7b8c2bcbc15d	\N	identity-provider-redirector	StaticLoginConnect	117937d8-3b00-414c-b9c6-fb877dec8385	2	25	f	\N	\N
a393a715-2f52-45d7-9691-19693c395a7d	\N	\N	StaticLoginConnect	117937d8-3b00-414c-b9c6-fb877dec8385	2	30	t	acf7cab9-8822-44b8-bfba-febc94f3eea3	\N
c8195dcd-f3fe-40cc-99e2-29fe99c3c95c	\N	auth-username-password-form	StaticLoginConnect	acf7cab9-8822-44b8-bfba-febc94f3eea3	0	10	f	\N	\N
3ea10f6a-bf6b-485e-a87c-0ea296bcd73e	\N	auth-otp-form	StaticLoginConnect	acf7cab9-8822-44b8-bfba-febc94f3eea3	1	20	f	\N	\N
469917e2-4a00-4a13-9950-2c95f21abc8c	\N	direct-grant-validate-username	StaticLoginConnect	d08f3786-8c44-48ee-b972-97227f5871fb	0	10	f	\N	\N
73567967-2a9f-40dc-8481-6fd5ccffdcfa	\N	direct-grant-validate-password	StaticLoginConnect	d08f3786-8c44-48ee-b972-97227f5871fb	0	20	f	\N	\N
716858c3-1d24-4781-bbe6-c94e14140bcd	\N	direct-grant-validate-otp	StaticLoginConnect	d08f3786-8c44-48ee-b972-97227f5871fb	1	30	f	\N	\N
98981046-37cb-4cdb-b645-3993d2f039b2	\N	registration-page-form	StaticLoginConnect	517f2c22-504f-49c4-8647-98fb02e699cb	0	10	t	4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	\N
ae556dfa-8705-4762-8751-eff9a9e01024	\N	registration-user-creation	StaticLoginConnect	4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	0	20	f	\N	\N
0629a1a7-7323-4641-96cc-5ac8d4512f61	\N	registration-profile-action	StaticLoginConnect	4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	0	40	f	\N	\N
1d7b2773-f67c-4553-93ef-bd10c6c826b2	\N	registration-password-action	StaticLoginConnect	4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	0	50	f	\N	\N
f4e4e9dd-4973-468a-807e-4ef618ebdf94	\N	registration-recaptcha-action	StaticLoginConnect	4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	3	60	f	\N	\N
f19ccaac-b7d6-4e02-b975-423c6a6413bc	\N	reset-credentials-choose-user	StaticLoginConnect	a6154408-458e-4590-a9d9-9cb7c2f16ddc	0	10	f	\N	\N
d9258950-dfc0-4e6d-9329-44987d5565cc	\N	reset-credential-email	StaticLoginConnect	a6154408-458e-4590-a9d9-9cb7c2f16ddc	0	20	f	\N	\N
0d8c0805-b3ff-4b9d-9f6f-066763839cd1	\N	reset-password	StaticLoginConnect	a6154408-458e-4590-a9d9-9cb7c2f16ddc	0	30	f	\N	\N
1820c05a-2e8d-4624-909b-6ef4520fb397	\N	reset-otp	StaticLoginConnect	a6154408-458e-4590-a9d9-9cb7c2f16ddc	1	40	f	\N	\N
93fdd7b9-3969-4c56-a1d9-b0f472be2448	\N	client-secret	StaticLoginConnect	ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	2	10	f	\N	\N
b4f3cc7c-abfc-474f-a315-13f3f9294a9f	\N	client-jwt	StaticLoginConnect	ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	2	20	f	\N	\N
3316b692-9d60-4f52-8c1d-67ce38e9fe22	\N	client-secret-jwt	StaticLoginConnect	ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	2	30	f	\N	\N
c408723a-cb59-4ebc-a26a-cf56f01a0d5d	\N	client-x509	StaticLoginConnect	ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	2	40	f	\N	\N
eeb6c807-5bd0-402f-bc0e-fc012f871da5	\N	idp-review-profile	StaticLoginConnect	a164ccab-a94a-4f54-b885-809f4ae9ee44	0	10	f	\N	47275122-1b10-47c5-9b1f-9385a7156712
56903cc8-6a0f-40ba-b3fd-09e0a267e11d	\N	idp-create-user-if-unique	StaticLoginConnect	a164ccab-a94a-4f54-b885-809f4ae9ee44	2	20	f	\N	388dceef-6d7f-4837-ab4c-c054e7c15333
42f58eb0-a2aa-4ca6-8ae8-a1d5b73c7224	\N	\N	StaticLoginConnect	a164ccab-a94a-4f54-b885-809f4ae9ee44	2	30	t	f818cc13-df62-4b3a-ab83-504f0f8b3c5e	\N
b3b62d01-1498-4e33-9e47-9851a126d18f	\N	idp-confirm-link	StaticLoginConnect	f818cc13-df62-4b3a-ab83-504f0f8b3c5e	0	10	f	\N	\N
66c9a2ca-6acc-4fae-8394-2938fb66c345	\N	idp-email-verification	StaticLoginConnect	f818cc13-df62-4b3a-ab83-504f0f8b3c5e	2	20	f	\N	\N
848d57fe-22f4-4b22-b0c5-77d1c2828c9f	\N	\N	StaticLoginConnect	f818cc13-df62-4b3a-ab83-504f0f8b3c5e	2	30	t	ef93098f-7379-4188-855c-0a9f05d8062d	\N
940714e1-ac47-49ef-9aa1-691c627463a9	\N	idp-username-password-form	StaticLoginConnect	ef93098f-7379-4188-855c-0a9f05d8062d	0	10	f	\N	\N
8a07dab8-8496-406d-b319-a1a05da03a32	\N	auth-otp-form	StaticLoginConnect	ef93098f-7379-4188-855c-0a9f05d8062d	1	20	f	\N	\N
376c519c-a059-4f7b-bb12-65cf1c47f49f	\N	http-basic-authenticator	StaticLoginConnect	348e43eb-185b-44c6-ab84-94896aa7fd9f	0	10	f	\N	\N
6efebe3b-065c-4335-b1e6-2a3d928e1df2	\N	docker-http-basic-authenticator	StaticLoginConnect	bd76a2dd-8524-453d-91e8-8a74ad4af069	0	10	f	\N	\N
60faa27c-0ca6-4579-a400-7f2972e664ee	\N	no-cookie-redirect	StaticLoginConnect	243b489d-8236-41b1-a6b8-95e31b071fe9	0	10	f	\N	\N
f3192ad5-a5eb-4e1e-b374-772b9a0b88d9	\N	basic-auth	StaticLoginConnect	243b489d-8236-41b1-a6b8-95e31b071fe9	0	20	f	\N	\N
db4fa2ac-73ee-4fcc-babf-a83fe2b5a0ce	\N	basic-auth-otp	StaticLoginConnect	243b489d-8236-41b1-a6b8-95e31b071fe9	3	30	f	\N	\N
b3c1ed18-1738-4c17-8b20-729e5db0f537	\N	auth-spnego	StaticLoginConnect	243b489d-8236-41b1-a6b8-95e31b071fe9	3	40	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
d2ce947a-e6cc-45d1-b49e-862b2faaee25	browser	browser based authentication	master	basic-flow	t	t
c3c9ac50-b6ce-4db3-87fc-27ff8707bae9	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
0e98f71b-fdc6-4534-9d57-efa48d43df5e	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
1b72a2a9-461c-45cd-93d8-4e0f210cb6f5	registration	registration flow	master	basic-flow	t	t
3f82ca7c-9f86-480a-a01b-dc8658400687	registration form	registration form	master	form-flow	f	t
5578dfae-95ea-44ca-ae8f-f88c7abac744	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
7988ecba-7e4d-409f-ae3b-5f5d163f959d	clients	Base authentication for clients	master	client-flow	t	t
3d0dd06d-714b-4a50-8b67-4681844509fd	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
8a4aaf88-8fb6-440e-9083-94744f517de8	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
fb7576ea-f376-4b28-addd-d22aefa95e07	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
379071e8-0a8c-484b-8cf9-b4e4a172c31c	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
c3213258-599c-4a3e-bd33-6557fbb40379	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
bda42efc-002f-49e4-8fe6-8b98f502222f	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
117937d8-3b00-414c-b9c6-fb877dec8385	browser	browser based authentication	StaticLoginConnect	basic-flow	t	t
acf7cab9-8822-44b8-bfba-febc94f3eea3	forms	Username, password, otp and other auth forms.	StaticLoginConnect	basic-flow	f	t
d08f3786-8c44-48ee-b972-97227f5871fb	direct grant	OpenID Connect Resource Owner Grant	StaticLoginConnect	basic-flow	t	t
517f2c22-504f-49c4-8647-98fb02e699cb	registration	registration flow	StaticLoginConnect	basic-flow	t	t
4f42ef3d-9a6e-4eab-ae5f-ac3d00fa20ec	registration form	registration form	StaticLoginConnect	form-flow	f	t
a6154408-458e-4590-a9d9-9cb7c2f16ddc	reset credentials	Reset credentials for a user if they forgot their password or something	StaticLoginConnect	basic-flow	t	t
ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	clients	Base authentication for clients	StaticLoginConnect	client-flow	t	t
a164ccab-a94a-4f54-b885-809f4ae9ee44	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	StaticLoginConnect	basic-flow	t	t
f818cc13-df62-4b3a-ab83-504f0f8b3c5e	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	StaticLoginConnect	basic-flow	f	t
ef93098f-7379-4188-855c-0a9f05d8062d	Verify Existing Account by Re-authentication	Reauthentication of existing account	StaticLoginConnect	basic-flow	f	t
348e43eb-185b-44c6-ab84-94896aa7fd9f	saml ecp	SAML ECP Profile Authentication Flow	StaticLoginConnect	basic-flow	t	t
bd76a2dd-8524-453d-91e8-8a74ad4af069	docker auth	Used by Docker clients to authenticate against the IDP	StaticLoginConnect	basic-flow	t	t
243b489d-8236-41b1-a6b8-95e31b071fe9	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	StaticLoginConnect	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
4be0d261-5feb-4ea0-bcb7-966c3af8f529	review profile config	master
a207c92b-60a4-4ca0-8f4d-15cd58663243	create unique user config	master
47275122-1b10-47c5-9b1f-9385a7156712	review profile config	StaticLoginConnect
388dceef-6d7f-4837-ab4c-c054e7c15333	create unique user config	StaticLoginConnect
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
4be0d261-5feb-4ea0-bcb7-966c3af8f529	missing	update.profile.on.first.login
a207c92b-60a4-4ca0-8f4d-15cd58663243	false	require.password.update.after.registration
47275122-1b10-47c5-9b1f-9385a7156712	missing	update.profile.on.first.login
388dceef-6d7f-4837-ab4c-c054e7c15333	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled) FROM stdin;
8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	t	master-realm	0	f	9c03b1e8-263e-4131-88d8-cb727a461e21	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f
6fc2887c-89c7-4d58-a968-bce74b2278db	t	f	account	0	f	d85c58bb-1211-42db-9c1e-65812a343b6f	/auth/realms/master/account	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
8dc587b5-cfeb-432d-91b6-7cc2184f1738	t	f	broker	0	f	4dc69a11-dda3-4e0c-aaef-5acfddedbee7	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	t	f	security-admin-console	0	t	e6c9064e-230a-4616-8e20-c91a116d01bf	/auth/admin/master/console/index.html	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
c13761de-a457-41dd-b098-a3d760714f09	t	f	admin-cli	0	t	15b67555-4b59-440f-a7a1-b514d148ea12	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
abc9fa09-72e4-4441-885a-3e26e5279410	t	t	StaticLoginConnect-realm	0	f	e7042433-c186-40f9-a108-4b5b5609d3ff	\N	t	\N	f	master	\N	0	f	f	StaticLoginConnect Realm	f	client-secret	\N	\N	\N	t	f	f
68e55df7-429b-4da2-bd2f-a6a700613367	t	f	realm-management	0	f	e02c0fe2-0548-4069-8d5f-27e25ed395cc	\N	t	\N	f	StaticLoginConnect	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f
95c5cc68-9c75-476b-acba-d9caa6f556b7	t	f	account	0	f	ce9a74d2-c528-47e2-99bc-02f29e02bde7	/auth/realms/StaticLoginConnect/account	f	\N	f	StaticLoginConnect	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
266003a0-2de0-46f7-9b07-5179b5ccc76a	t	f	broker	0	f	1404984c-259d-414d-a971-0a7b22cacc81	\N	f	\N	f	StaticLoginConnect	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
cef97d83-ab67-49b9-9a85-9b2f8097e338	t	f	security-admin-console	0	t	092c2632-8052-4cbb-93c1-ad20428c84c7	/auth/admin/StaticLoginConnect/console/index.html	f	\N	f	StaticLoginConnect	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
5a90f1b7-deca-463f-bedd-07b94703604a	t	f	admin-cli	0	t	2bb789ac-d09c-4786-9a45-758f709b1fe3	\N	f	\N	f	StaticLoginConnect	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
d22b5708-970b-48f3-b7b2-45e5f023de7d	t	f	loginConnect	0	t	7e2f0ccc-7d03-4a41-9fcf-01d973bedcd6	\N	f	*	f	StaticLoginConnect	openid-connect	-1	f	f	\N	f	client-secret	*	\N	\N	t	t	t
11189182-98cf-4017-aa64-fde1b18a606d	t	f	kheopsAuthorization	0	f	af083207-04d9-4003-8e6f-822a3125c528	\N	f	\N	f	StaticLoginConnect	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	f	f	t
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.assertion.signature
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.multivalued.roles
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.force.post.binding
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.encrypt
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.server.signature
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.server.signature.keyinfo.ext
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	exclude.session.state.from.auth.response
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml_force_name_id_format
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.client.signature
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	tls.client.certificate.bound.access.tokens
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.authnstatement
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	display.on.consent.screen
d22b5708-970b-48f3-b7b2-45e5f023de7d	false	saml.onetimeuse.condition
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.assertion.signature
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.multivalued.roles
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.force.post.binding
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.encrypt
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.server.signature
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.server.signature.keyinfo.ext
11189182-98cf-4017-aa64-fde1b18a606d	false	exclude.session.state.from.auth.response
11189182-98cf-4017-aa64-fde1b18a606d	false	saml_force_name_id_format
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.client.signature
11189182-98cf-4017-aa64-fde1b18a606d	false	tls.client.certificate.bound.access.tokens
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.authnstatement
11189182-98cf-4017-aa64-fde1b18a606d	false	display.on.consent.screen
11189182-98cf-4017-aa64-fde1b18a606d	false	saml.onetimeuse.condition
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
6fc2887c-89c7-4d58-a968-bce74b2278db	7e1a7438-c5cd-45ea-896b-15b89d0778cf
6fc2887c-89c7-4d58-a968-bce74b2278db	b7ba33d5-86f5-4594-9a7e-645c26c2910d
95c5cc68-9c75-476b-acba-d9caa6f556b7	3a521fc3-dc09-4de0-b1cf-29394da726cc
95c5cc68-9c75-476b-acba-d9caa6f556b7	c16a0346-47d6-40b3-b42a-4166e2f2a840
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
442bf6b2-bad8-4800-a9bd-a5c8b39feab7	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
0683cd0d-4e5a-41a7-b284-e61d6023e643	role_list	master	SAML role list	saml
0a9085a6-d327-423b-8dcc-62fac65d8d47	profile	master	OpenID Connect built-in scope: profile	openid-connect
03b367e0-a758-4630-9ca4-395c86fa9ea0	email	master	OpenID Connect built-in scope: email	openid-connect
7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	address	master	OpenID Connect built-in scope: address	openid-connect
39e7ac4f-154f-418e-a687-a2c1ab798df1	phone	master	OpenID Connect built-in scope: phone	openid-connect
13b12e29-60e1-4a52-8331-26c05e79cf61	offline_access	StaticLoginConnect	OpenID Connect built-in scope: offline_access	openid-connect
8a193695-7ba5-4b5f-9263-129957776aec	role_list	StaticLoginConnect	SAML role list	saml
851becc1-f21e-439f-aec4-cabf3c31320a	profile	StaticLoginConnect	OpenID Connect built-in scope: profile	openid-connect
69f68e8d-f0cd-4a42-8eca-5adbe11413bb	email	StaticLoginConnect	OpenID Connect built-in scope: email	openid-connect
9821a6cb-1b7e-4e08-bb33-126b451b9f73	address	StaticLoginConnect	OpenID Connect built-in scope: address	openid-connect
53cdf76e-1529-4caf-9bde-91aebadaf3c1	phone	StaticLoginConnect	OpenID Connect built-in scope: phone	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
442bf6b2-bad8-4800-a9bd-a5c8b39feab7	${offlineAccessScopeConsentText}	consent.screen.text
442bf6b2-bad8-4800-a9bd-a5c8b39feab7	true	display.on.consent.screen
0683cd0d-4e5a-41a7-b284-e61d6023e643	${samlRoleListScopeConsentText}	consent.screen.text
0683cd0d-4e5a-41a7-b284-e61d6023e643	true	display.on.consent.screen
0a9085a6-d327-423b-8dcc-62fac65d8d47	${profileScopeConsentText}	consent.screen.text
0a9085a6-d327-423b-8dcc-62fac65d8d47	true	display.on.consent.screen
03b367e0-a758-4630-9ca4-395c86fa9ea0	${emailScopeConsentText}	consent.screen.text
03b367e0-a758-4630-9ca4-395c86fa9ea0	true	display.on.consent.screen
7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	${addressScopeConsentText}	consent.screen.text
7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	true	display.on.consent.screen
39e7ac4f-154f-418e-a687-a2c1ab798df1	${phoneScopeConsentText}	consent.screen.text
39e7ac4f-154f-418e-a687-a2c1ab798df1	true	display.on.consent.screen
13b12e29-60e1-4a52-8331-26c05e79cf61	${offlineAccessScopeConsentText}	consent.screen.text
13b12e29-60e1-4a52-8331-26c05e79cf61	true	display.on.consent.screen
8a193695-7ba5-4b5f-9263-129957776aec	${samlRoleListScopeConsentText}	consent.screen.text
8a193695-7ba5-4b5f-9263-129957776aec	true	display.on.consent.screen
851becc1-f21e-439f-aec4-cabf3c31320a	${profileScopeConsentText}	consent.screen.text
851becc1-f21e-439f-aec4-cabf3c31320a	true	display.on.consent.screen
69f68e8d-f0cd-4a42-8eca-5adbe11413bb	${emailScopeConsentText}	consent.screen.text
69f68e8d-f0cd-4a42-8eca-5adbe11413bb	true	display.on.consent.screen
9821a6cb-1b7e-4e08-bb33-126b451b9f73	${addressScopeConsentText}	consent.screen.text
9821a6cb-1b7e-4e08-bb33-126b451b9f73	true	display.on.consent.screen
53cdf76e-1529-4caf-9bde-91aebadaf3c1	${phoneScopeConsentText}	consent.screen.text
53cdf76e-1529-4caf-9bde-91aebadaf3c1	true	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
6fc2887c-89c7-4d58-a968-bce74b2278db	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
c13761de-a457-41dd-b098-a3d760714f09	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
8dc587b5-cfeb-432d-91b6-7cc2184f1738	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
8c237fe9-e6e2-4613-80c8-8d073b7c854f	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
6fc2887c-89c7-4d58-a968-bce74b2278db	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
6fc2887c-89c7-4d58-a968-bce74b2278db	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
6fc2887c-89c7-4d58-a968-bce74b2278db	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
6fc2887c-89c7-4d58-a968-bce74b2278db	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
6fc2887c-89c7-4d58-a968-bce74b2278db	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
c13761de-a457-41dd-b098-a3d760714f09	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
c13761de-a457-41dd-b098-a3d760714f09	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
c13761de-a457-41dd-b098-a3d760714f09	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
c13761de-a457-41dd-b098-a3d760714f09	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
c13761de-a457-41dd-b098-a3d760714f09	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
8dc587b5-cfeb-432d-91b6-7cc2184f1738	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
8dc587b5-cfeb-432d-91b6-7cc2184f1738	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
8dc587b5-cfeb-432d-91b6-7cc2184f1738	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
8dc587b5-cfeb-432d-91b6-7cc2184f1738	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
8dc587b5-cfeb-432d-91b6-7cc2184f1738	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
8c237fe9-e6e2-4613-80c8-8d073b7c854f	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
8c237fe9-e6e2-4613-80c8-8d073b7c854f	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
8c237fe9-e6e2-4613-80c8-8d073b7c854f	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
8c237fe9-e6e2-4613-80c8-8d073b7c854f	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
8c237fe9-e6e2-4613-80c8-8d073b7c854f	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
abc9fa09-72e4-4441-885a-3e26e5279410	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
abc9fa09-72e4-4441-885a-3e26e5279410	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
abc9fa09-72e4-4441-885a-3e26e5279410	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
abc9fa09-72e4-4441-885a-3e26e5279410	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
abc9fa09-72e4-4441-885a-3e26e5279410	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
abc9fa09-72e4-4441-885a-3e26e5279410	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
95c5cc68-9c75-476b-acba-d9caa6f556b7	8a193695-7ba5-4b5f-9263-129957776aec	t
5a90f1b7-deca-463f-bedd-07b94703604a	8a193695-7ba5-4b5f-9263-129957776aec	t
266003a0-2de0-46f7-9b07-5179b5ccc76a	8a193695-7ba5-4b5f-9263-129957776aec	t
68e55df7-429b-4da2-bd2f-a6a700613367	8a193695-7ba5-4b5f-9263-129957776aec	t
cef97d83-ab67-49b9-9a85-9b2f8097e338	8a193695-7ba5-4b5f-9263-129957776aec	t
95c5cc68-9c75-476b-acba-d9caa6f556b7	851becc1-f21e-439f-aec4-cabf3c31320a	t
95c5cc68-9c75-476b-acba-d9caa6f556b7	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
95c5cc68-9c75-476b-acba-d9caa6f556b7	13b12e29-60e1-4a52-8331-26c05e79cf61	f
95c5cc68-9c75-476b-acba-d9caa6f556b7	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
95c5cc68-9c75-476b-acba-d9caa6f556b7	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
5a90f1b7-deca-463f-bedd-07b94703604a	851becc1-f21e-439f-aec4-cabf3c31320a	t
5a90f1b7-deca-463f-bedd-07b94703604a	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
5a90f1b7-deca-463f-bedd-07b94703604a	13b12e29-60e1-4a52-8331-26c05e79cf61	f
5a90f1b7-deca-463f-bedd-07b94703604a	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
5a90f1b7-deca-463f-bedd-07b94703604a	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
266003a0-2de0-46f7-9b07-5179b5ccc76a	851becc1-f21e-439f-aec4-cabf3c31320a	t
266003a0-2de0-46f7-9b07-5179b5ccc76a	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
266003a0-2de0-46f7-9b07-5179b5ccc76a	13b12e29-60e1-4a52-8331-26c05e79cf61	f
266003a0-2de0-46f7-9b07-5179b5ccc76a	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
266003a0-2de0-46f7-9b07-5179b5ccc76a	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
68e55df7-429b-4da2-bd2f-a6a700613367	851becc1-f21e-439f-aec4-cabf3c31320a	t
68e55df7-429b-4da2-bd2f-a6a700613367	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
68e55df7-429b-4da2-bd2f-a6a700613367	13b12e29-60e1-4a52-8331-26c05e79cf61	f
68e55df7-429b-4da2-bd2f-a6a700613367	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
68e55df7-429b-4da2-bd2f-a6a700613367	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
cef97d83-ab67-49b9-9a85-9b2f8097e338	851becc1-f21e-439f-aec4-cabf3c31320a	t
cef97d83-ab67-49b9-9a85-9b2f8097e338	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
cef97d83-ab67-49b9-9a85-9b2f8097e338	13b12e29-60e1-4a52-8331-26c05e79cf61	f
cef97d83-ab67-49b9-9a85-9b2f8097e338	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
cef97d83-ab67-49b9-9a85-9b2f8097e338	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
d22b5708-970b-48f3-b7b2-45e5f023de7d	8a193695-7ba5-4b5f-9263-129957776aec	t
d22b5708-970b-48f3-b7b2-45e5f023de7d	851becc1-f21e-439f-aec4-cabf3c31320a	t
d22b5708-970b-48f3-b7b2-45e5f023de7d	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
d22b5708-970b-48f3-b7b2-45e5f023de7d	13b12e29-60e1-4a52-8331-26c05e79cf61	f
d22b5708-970b-48f3-b7b2-45e5f023de7d	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
d22b5708-970b-48f3-b7b2-45e5f023de7d	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
11189182-98cf-4017-aa64-fde1b18a606d	8a193695-7ba5-4b5f-9263-129957776aec	t
11189182-98cf-4017-aa64-fde1b18a606d	851becc1-f21e-439f-aec4-cabf3c31320a	t
11189182-98cf-4017-aa64-fde1b18a606d	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
11189182-98cf-4017-aa64-fde1b18a606d	13b12e29-60e1-4a52-8331-26c05e79cf61	f
11189182-98cf-4017-aa64-fde1b18a606d	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
11189182-98cf-4017-aa64-fde1b18a606d	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
442bf6b2-bad8-4800-a9bd-a5c8b39feab7	60df2967-fd62-486e-bf6b-3ac5985b46fa
13b12e29-60e1-4a52-8331-26c05e79cf61	db1800f8-bd9f-4985-8d69-2119aff08d8c
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
fbefb3ea-6399-4ecf-95b1-fa8b6d316440	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
1727a950-7162-49a0-8730-7b9ddc087196	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
4c95b6ec-da00-456a-805a-9180d81208e5	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5d7bd937-7546-4343-9c9c-b5b53b3ac96a	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
1d0761b4-6e85-44c7-86a9-36ab4e7c9035	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
56c7c22d-ab9a-4506-9a13-7cf40aa64b3a	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
90732365-a043-4260-b4c0-502cfded7e67	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
ac1fe804-8f59-4a9e-addd-96feff86373a	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
730e4f4b-9a0a-4759-b563-f4da4a96ba97	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
b9bbb039-b45c-4597-b057-b3f7dfb1714e	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
0c7d3471-3d5f-4591-9518-25813bdb4da6	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
298da7a9-b46b-4e44-ae12-e0afc403970a	rsa-generated	StaticLoginConnect	rsa-generated	org.keycloak.keys.KeyProvider	StaticLoginConnect	\N
acc1aaf2-73ba-45de-a102-3c8266b5c249	hmac-generated	StaticLoginConnect	hmac-generated	org.keycloak.keys.KeyProvider	StaticLoginConnect	\N
ecd8fe06-555d-45de-81de-fac5f79bf9cb	aes-generated	StaticLoginConnect	aes-generated	org.keycloak.keys.KeyProvider	StaticLoginConnect	\N
6cf91767-6a00-4a7f-b7d0-9fd78903c1ba	Trusted Hosts	StaticLoginConnect	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
cf5ba679-4010-4909-8609-420307cd26d0	Consent Required	StaticLoginConnect	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
fe55f683-83dd-4dd2-964d-7d7eeb4b4db2	Full Scope Disabled	StaticLoginConnect	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
d0e56154-cd95-483d-bcaa-f0221eda1370	Max Clients Limit	StaticLoginConnect	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
6fe8d619-9217-4c1d-b1b7-723ba8dedef6	Allowed Protocol Mapper Types	StaticLoginConnect	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
6f3b769b-56c0-457f-abed-bccf40c3eed4	Allowed Client Scopes	StaticLoginConnect	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	anonymous
116abe1d-0554-4fc5-b77e-2755426774f7	Allowed Protocol Mapper Types	StaticLoginConnect	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	authenticated
82036b63-aa43-445d-b6d1-1556032aa199	Allowed Client Scopes	StaticLoginConnect	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	StaticLoginConnect	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
a119d01a-8025-4132-9b4c-2fcc18ca0121	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	oidc-full-name-mapper
d05e1636-ad41-45c6-a707-4fdb888798ce	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
c93cf30d-4b02-447c-aceb-ff48e0b67065	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	oidc-address-mapper
6a21c628-363d-477c-92ef-9533727d379b	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	saml-user-attribute-mapper
0cccc8ba-b0c0-4bf1-a01b-599d3f4bb6ce	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ab5d4578-c054-43e9-9dfe-e63af6b3c007	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	saml-role-list-mapper
670177a1-7065-453f-a95b-97764ac9a7a1	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
63d59a5f-200c-407a-9b4c-8c0b705ecbb0	1d0761b4-6e85-44c7-86a9-36ab4e7c9035	allowed-protocol-mapper-types	saml-user-property-mapper
51b089b3-541e-4c27-995e-b21c77da232b	5d7bd937-7546-4343-9c9c-b5b53b3ac96a	max-clients	200
52fb73c1-24c4-44ce-9842-8a7495c24b66	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	oidc-full-name-mapper
ecc795c8-a1c3-469d-95a4-a2f4a89052af	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	saml-user-attribute-mapper
e54eb0a9-8d51-4c76-bbe0-3a118e97be15	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
31549fd6-5150-4601-b504-cb914e941f65	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
566df869-eb66-4f6d-9295-c91808839938	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	saml-user-property-mapper
6e50b8bf-d7c8-4019-be23-bcc382f790d8	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d10fa08a-cdcb-489e-9049-ee9572e2e826	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	oidc-address-mapper
459c41a1-df72-4e29-a038-ae93c49befb3	90732365-a043-4260-b4c0-502cfded7e67	allowed-protocol-mapper-types	saml-role-list-mapper
c7ceca48-5ff2-40e3-a586-1b03d70f73e6	56c7c22d-ab9a-4506-9a13-7cf40aa64b3a	allow-default-scopes	true
cec8d1fe-c51b-4877-b6fa-b579ed9841b5	ac1fe804-8f59-4a9e-addd-96feff86373a	allow-default-scopes	true
6ec60841-e1ee-4a83-8392-fea853f202dc	fbefb3ea-6399-4ecf-95b1-fa8b6d316440	host-sending-registration-request-must-match	true
f65da147-0465-4d22-95cc-c84faf504f08	fbefb3ea-6399-4ecf-95b1-fa8b6d316440	client-uris-must-match	true
2c6481a6-42e7-4e4c-a61b-1cbe9b01c1fb	730e4f4b-9a0a-4759-b563-f4da4a96ba97	privateKey	MIIEowIBAAKCAQEAqVaOruD5CAOIy0gqU8+xODLphq4cT4RYbzmY/YKTY0Ye6Pkj2JLqELoWLEznvM4wxitgFJ8jxpXFrHcZxeRTHu8pb1gVFAEfJ6f6xiK51j6Bv6sUbt3kFDxll+I+NB4eHf69dZTzKnyfVqzm+6VUR5YZXh3z9vIOycGnPekJf2fTDr+ZG1NteebbyTk0Rlx/We+b47I4q/lX4GEQuszBupCDjHZgRrLDQxUl6TBCw9mrYRcYXe/Z4cezKUgzgOdPalj7Tkwcjen5DLuJVC4h/YcA8R/iGpSKmsSUr6X3uzBAik9JpDD0ZsYGMk4c/ChnBVpx71ry3dXaCxQzfWnE3QIDAQABAoIBADTMajyYpM0c3QAVBi2PqoANT8bQbr9UUoaLfOo+VlozuNuHIugaFqUUgGlbqT2zRH3ldFW5sNvwQuwdTonnQQt6In83BYtxNheVRpmUpkDoyGfMndhbkwvEMSEER8TURyuvC7+nq5HpvXy2+GYqDHctk8dGq5SpsHazzMN+75krcbYMqKfE2Yn5nfvZ+L3apS5TdC9CVh4oR1vymiAAKCsCSmpAUL1zwCzXptt80hilT8Vt4j179CTFnyDA4lY1OKCECvU5uNLT5IHb273P4RH1UnQYI2AWbFxXKvTCmzrpHqyEJETC3vItZENcLxVm2LmkvGuL/5GWPX/nFd5/6nkCgYEA5NvpzGQrFx2ZfhJbBeoe0RprWps3kauMgvb6Scy9rVC6wuu6v9+dR0o6tBMTR1IaA4rup29NW24b1pU1KNaTCrof5D1aTw4ymUhuR1GCVCbW014YON6lgvSZtqNaKCJfZ1JDFE819U3uYgL14tJ1v6mO/0y9SFjdqwnNzHP/xvsCgYEAvWubqQeralhamKdCJfGPGcCfqQHWxFyG69xFwIIJqlxS6nCkCUQfz+c3QcOgLp2uAsGqkAKG6WII3y34Sv8GYghWaZxZYoBvGFWfpd0kPRDDhC0X9EzGKFAa4+l/mjVDSSZfb3nsl8B28ZMJuGbPngGmI2DwKZXCcwfuwivxvAcCgYAQBmoXmsf9pV/zGPvwrRUdVTlBLe81Lwr2vK6H7mM1uJprPbBk8RaFQGhd5ZwK+W/C4b6WUM/c4Bfo7ae8RVIkhSXoiHdDY94dJ5o5OjbjB5kxUbxmdwil49TDmiqc9tMxW+xAhs9jbuKLUGPBTzVZh1jw/YGfiEF1UYlskI7PcwKBgQCSML7OUdEGHnKtZkkzJ5+d7IBM29J5cj/fQP3EeZgkF2UW8yBm1mEHABgxdV3nHGL0VavhwVGGRdc7CCudFf5DItQuZjDGSQF08oBobqhNSObc2ECol6hH7KsUQ13sEjd/+VGmo57p7+zcvPK/kvmhpPwoSeSQ87hDN1gaG/hReQKBgGPjux5U6wTbHeptkzE4dlXCbIjNeXLKHSM4fqGt9eXOpSP1ltCJalGugcn0nFRkbbl9aDmIpaNjUaHesaLYT7kmFhoNlLqaRIQtuJ0s/DBEJJI5LMm6Cp07VB1Ee+rN19X7lu07hPRFn3SuzQIl19ojnduaoYq6Yeegs/ebVYkm
5629b4c7-37ae-4022-9f62-32b6a6aac208	730e4f4b-9a0a-4759-b563-f4da4a96ba97	priority	100
4124e5bc-62ba-4c84-823b-df79c3e87cad	730e4f4b-9a0a-4759-b563-f4da4a96ba97	certificate	MIICmzCCAYMCBgFoTOB4+zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTkwMTE0MTQ1ODI2WhcNMjkwMTE0MTUwMDA2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCpVo6u4PkIA4jLSCpTz7E4MumGrhxPhFhvOZj9gpNjRh7o+SPYkuoQuhYsTOe8zjDGK2AUnyPGlcWsdxnF5FMe7ylvWBUUAR8np/rGIrnWPoG/qxRu3eQUPGWX4j40Hh4d/r11lPMqfJ9WrOb7pVRHlhleHfP28g7Jwac96Ql/Z9MOv5kbU2155tvJOTRGXH9Z75vjsjir+VfgYRC6zMG6kIOMdmBGssNDFSXpMELD2athFxhd79nhx7MpSDOA509qWPtOTByN6fkMu4lULiH9hwDxH+IalIqaxJSvpfe7MECKT0mkMPRmxgYyThz8KGcFWnHvWvLd1doLFDN9acTdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFWQJ6c9Vn+ID3sNKdyyu1kOh6tJ0/yaGlKVYCU8XHuDaFG+YJtuJiVS2Bv4H1t1vQWWFbEfSPUGiex8rWob2qlO4eBTd0ONji3BXzG4wwJVb4ff8Ck00obfkdyFTlJKQzD9+9mPZAdF/KjBLBZJuhY2l6iJhRq8vv6Z0UTuOeW1EMoDw54en4pYP+otgP3DFIGFbDCayNsW3dxJO54cuxhqxvMXyqT11AIgXOxPgfoq0EOsJ0f8+BQOjwJoHsSbglXHJiQMKCXGXh4CpzIxVW8yr0UhApGMo5AFgGloUTCb0XzAws4OwKfEeQsV0iKAMC+cGTH3pSdfhtDibDewPGw=
0b747f97-d639-4a6b-850b-515b5f8bb7cc	b9bbb039-b45c-4597-b057-b3f7dfb1714e	priority	100
82e23634-285d-472f-a622-a1d1b065e4ab	b9bbb039-b45c-4597-b057-b3f7dfb1714e	secret	mPU5dsd6Rw-s9pDdLq1h_m7ItKNb39sv6bxnId_Xcn5RRF0rFLkVSQ4-tFb0385W-Y31rxr40ays2KkOle5e8w
54fc74d9-8615-4958-be78-60d5a8b07ae4	b9bbb039-b45c-4597-b057-b3f7dfb1714e	kid	25b16031-6131-49da-9625-c531277517da
d89e3fd1-cbc3-4d2c-9733-ba5d98c7ae55	b9bbb039-b45c-4597-b057-b3f7dfb1714e	algorithm	HS256
5e5449fc-b912-4653-a8ac-6f0da2e1ea74	0c7d3471-3d5f-4591-9518-25813bdb4da6	secret	4MUMeDg6evxEXadQY72FkA
9e4ae5b7-3c89-466e-9146-1d8d3e6dfb42	0c7d3471-3d5f-4591-9518-25813bdb4da6	kid	0e9c7cc9-d0b1-426f-b2f3-b77efb7fa13d
323aad3a-36f9-42b7-97c8-31e439d83d8a	0c7d3471-3d5f-4591-9518-25813bdb4da6	priority	100
1e3fb290-e897-4816-adc7-43ebe3c19c73	298da7a9-b46b-4e44-ae12-e0afc403970a	certificate	MIICszCCAZsCBgFoTOHhhTANBgkqhkiG9w0BAQsFADAdMRswGQYDVQQDDBJTdGF0aWNMb2dpbkNvbm5lY3QwHhcNMTkwMTE0MTQ1OTU4WhcNMjkwMTE0MTUwMTM4WjAdMRswGQYDVQQDDBJTdGF0aWNMb2dpbkNvbm5lY3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7xV0NF6QjC0iALphEl9cj0vee/L6B9r6R6CnYQ4KaC4u5a+sNKnxp9y96At3Vkvj2ZDh49iDeYYMPLFh+578dBMqN8L9ipUoN8jsQnzwnl/MDkymF4Kp7jAKrOom19yFdq1YS4SZpzwCQ0xKYreIM8Z771MhEdM+WYKwLlTGasHA1YDBTNg6Dv4Aqx4iO5pSHETyBOYqznJvNzaBeV3MVJchEvAcYgeCFB5LXRJbAu7yvMAA9xBsXdkUHV1r0hJX+BY9PFvmVMAJ/f66OEGyTEVRvd8Mvp+ryLnYHAOm1mIVU4Vg6BjFIaOFuvzwSgxFxT8yF7UW0Is+VsW+vciZtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAE8KYGpQmPt+nyg6/obDTfSiYecfQzaCmNAvtTicRxPCAAw8Ygr9/MJGnwI/WvgCqI6L8IpxyNtZAZ4VH2pjD0u6CoVFF/OPQyp5xCePYC9SqYXear2fayHsxo2ByXKgshwYAV6659AysFHTAfc6mQbERkFjBacSHA+ckUQMIkULHlOKQZR9WV9QnPoyRAC78vbWAIftoVm2tKN4yFbQdQbEoWvpt7m4VzXDz7q5UNcBpjEoaisZoncq37wIio5pL+tSdIN5fTxOzhbP8FqZe5P7O//qKEdlWBNkEfJUpsZ3eEKiG1VooQre75x6n5bilCEnd+I6fqIeEGG9JDK6vU0=
7fbed80a-82c9-466b-9cb3-2395ddc90931	298da7a9-b46b-4e44-ae12-e0afc403970a	privateKey	MIIEpAIBAAKCAQEAu8VdDRekIwtIgC6YRJfXI9L3nvy+gfa+kegp2EOCmguLuWvrDSp8afcvegLd1ZL49mQ4ePYg3mGDDyxYfue/HQTKjfC/YqVKDfI7EJ88J5fzA5MpheCqe4wCqzqJtfchXatWEuEmac8AkNMSmK3iDPGe+9TIRHTPlmCsC5UxmrBwNWAwUzYOg7+AKseIjuaUhxE8gTmKs5ybzc2gXldzFSXIRLwHGIHghQeS10SWwLu8rzAAPcQbF3ZFB1da9ISV/gWPTxb5lTACf3+ujhBskxFUb3fDL6fq8i52BwDptZiFVOFYOgYxSGjhbr88EoMRcU/Mhe1FtCLPlbFvr3ImbQIDAQABAoIBABR9xVnYaqEoahETBKr3pxLRwxQmoOOt+b4Sh/6B347QE794d35IVKt7vkKibXMRRvoclc0djxi1q4fMXxv6TnDsRO6Yh0pMn3hGJwv5VKc9fde2B6IEkpZJAUGOcdjZz1pZiFsnFvoVDQrA/haLY0/mTmNNJU3TMZRHmH7rGS64QkTzYW4CMh99sjp2UF7PwyHR2CdrWrl8tZ/lSWjtWu7HnUqkg9GtEQyiEcsXHf1+gua1DDzWlyj/BegE/POcy5SbiatdO7HU53lw6PE7F08DH38ReYkf9ev5W3tb5okopBtHTvH/0hMow12nOSuf8ruO5Ps9X3GpB9XknOeC0gECgYEA+ZvSuc1NbaotddN1KqaShLU5bfrWEGhnVQColi0rEHed3saRL4AldvmtvkwcSBjeM4/wHCm+ZkKpGvUkiuH/dkm3Nm/O9APGgAiCVzw1pmPUgcY15OU6EqDO5XIqqkqZOPEbmKe5ODTfil/EKNjdlgaERUa/SI8L0lSUcO2OOXUCgYEAwJQyLJgbBZX/XaoO+O16XRQZT6AI6cxfsE0KXLnO5VS0uU3+zH38GZdEH6t7mPFMDc2kAl06QJYnsPpT2hK+bGWXJIJBeCSTjo0Ga0mxO8zualmdxCO3wiC4EUWKAoepfYCSaVUQsWGcAX7aL8IybUKltdiUsZUJeiSa4/qZIhkCgYEA+T0/DYiS6A4llqGvPQdXBmxvDAKL/ZZCl/4wWMSBW9AVM33TOzsaLdLiSkJ1ewhZ1+LCP1zvYezuLpzaAFPqYpL4/sJmRAIBE5drju/wIlVMvMjOx+CcPD2WWkXFlIUoulMG20efCyDAlctKc/8YQ9X9/a7HEgzEISGTl6+ddIECgYB9Sy4Fw4S5MqktuGn7XQ6ipmP9YULLUlPjcYxPXfiVTnIyqeMgCsvNnpQNAtXsYPm5dVTC0QMIaGk0hPmvRUitX79hWnnb//gc4/YMMarlHGT1vo6dwRtaa002t4aeNMN6Sv93FohA0B/e/ThZoECMw7LqyBmeHDhJRq2brDybaQKBgQC5rOzP8FYH0A/b/fgbguFl6jH/OqLvTlYLKAD6cZYc4DaA3Wr8ZIEc7ArhpD4nOC91AV6//P50aF7w3+Y6Z5VzdHf4yKPhDKZ/4oNup0KkorU3PdsJoOO9LAeB86RIjGu6d5Ygw3pyBxtICIysMQs9TB05X1LGZoeLzJ+QaZm5aw==
3c5d62e3-d9a4-4608-979f-8fb504b61b06	298da7a9-b46b-4e44-ae12-e0afc403970a	priority	100
2b8730d1-2dd8-4609-9358-fb1bff65e714	acc1aaf2-73ba-45de-a102-3c8266b5c249	algorithm	HS256
ece9c50c-eb30-4139-9f40-8d0501003b7a	acc1aaf2-73ba-45de-a102-3c8266b5c249	kid	64f86f6d-1db7-46a9-a03c-c6142aea33ed
4a620e40-3219-40b8-8744-0fd006c9993b	acc1aaf2-73ba-45de-a102-3c8266b5c249	secret	Ac4Uu_pa-4oiUAPCLlRKIlidT3g-cX2ssz3bhNpQKQXCqgtBWFX6QIWbYJwPQ5N0tesJjxPHvSkLoB9G9Qg4fQ
4dbd44c5-e55c-46dc-a040-34fddf12fb90	acc1aaf2-73ba-45de-a102-3c8266b5c249	priority	100
6171e5a4-5bcf-4778-be62-aa83a9b5d362	ecd8fe06-555d-45de-81de-fac5f79bf9cb	priority	100
cda5d5ae-d3ed-4fa0-9f4b-d54ba52f7402	ecd8fe06-555d-45de-81de-fac5f79bf9cb	kid	11d6045d-fcb8-43e3-9264-f2cb4b9d9343
ff8933ab-855f-408b-bc08-9d9c26c57fc8	ecd8fe06-555d-45de-81de-fac5f79bf9cb	secret	ALA5bjGB7MgV5A9i4MgDCQ
6426818c-6359-487f-b184-80958c31f316	6cf91767-6a00-4a7f-b7d0-9fd78903c1ba	host-sending-registration-request-must-match	true
a38d3c0b-ebff-466f-9e1c-3a9a26c62ca2	6cf91767-6a00-4a7f-b7d0-9fd78903c1ba	client-uris-must-match	true
30fa5d3c-8cf6-4180-9998-20461df5e5fb	6f3b769b-56c0-457f-abed-bccf40c3eed4	allow-default-scopes	true
fb29974d-ad94-487d-95f8-a2b2e721f461	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	saml-role-list-mapper
1873f49d-d7f7-419c-8e77-81e149c52df7	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
fc538de2-a5df-4880-b345-47e114e8785a	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
254ff5fa-9c51-41ef-b887-55d98f7cdf4f	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	oidc-address-mapper
889f6253-875f-4287-940c-31fed0b366b2	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
018713a4-84f9-4366-98ef-3a8a70716c65	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	oidc-full-name-mapper
710b51be-bc46-452d-85f6-569169e0b326	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	saml-user-attribute-mapper
26300d2a-b16f-472f-9a56-f3878b3fe16e	6fe8d619-9217-4c1d-b1b7-723ba8dedef6	allowed-protocol-mapper-types	saml-user-property-mapper
83a6398f-7659-4133-8853-8a0f7fd4d07a	d0e56154-cd95-483d-bcaa-f0221eda1370	max-clients	200
082d2d7e-d604-4817-ab28-91acbfda4f99	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	saml-user-property-mapper
3d1bd009-9b45-42da-adfa-96ec8d29d548	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2a94a97b-efca-4250-9fc0-60de07a64512	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
612c71b6-5747-487b-84ea-0fed6dc6a5f6	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	oidc-full-name-mapper
48060a05-b6a4-428b-8e1a-36c03855bce2	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	oidc-address-mapper
3a3c6481-9d30-4505-a072-a2834522545b	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c9666a33-55ea-49bf-b7ad-7fa95d5afd7d	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	saml-role-list-mapper
5672a557-f174-4e13-846a-964db0638043	116abe1d-0554-4fc5-b77e-2755426774f7	allowed-protocol-mapper-types	saml-user-attribute-mapper
a79337c7-d98f-49d9-90b9-cae59e5d913a	82036b63-aa43-445d-b6d1-1556032aa199	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
09a11383-bf20-49c2-ba89-0d3eb0066ba5	3578435a-0e7a-424d-8fde-b5fc97fc359c
09a11383-bf20-49c2-ba89-0d3eb0066ba5	b4d3c46a-356a-4620-97fd-134b3bb803d5
09a11383-bf20-49c2-ba89-0d3eb0066ba5	94dcd223-b0ec-4b61-b2ca-35fcd8db9d31
09a11383-bf20-49c2-ba89-0d3eb0066ba5	e791f941-ddd1-41fa-aa40-9f015a6d3564
09a11383-bf20-49c2-ba89-0d3eb0066ba5	6c27024e-0972-474a-b80a-ef9f59d5939c
09a11383-bf20-49c2-ba89-0d3eb0066ba5	c8a99838-48b5-47cb-a6b4-cca70cb19b36
09a11383-bf20-49c2-ba89-0d3eb0066ba5	7ac22fe3-ef72-4230-b4bc-7b4149539c51
09a11383-bf20-49c2-ba89-0d3eb0066ba5	6902abd6-82ec-4c43-bb61-8fe68d9c6a11
09a11383-bf20-49c2-ba89-0d3eb0066ba5	d70f278c-a793-412f-93ec-3286fa2e161b
09a11383-bf20-49c2-ba89-0d3eb0066ba5	92bd9ac6-9d88-41a5-8941-5073276ca0c1
09a11383-bf20-49c2-ba89-0d3eb0066ba5	345206ee-bdbb-4378-a324-c8151e12c1df
09a11383-bf20-49c2-ba89-0d3eb0066ba5	9a7d62de-382e-44e1-b1a2-c90e4acac8aa
09a11383-bf20-49c2-ba89-0d3eb0066ba5	8603c7d3-fa21-426f-ac83-d1e6aaef4c5a
09a11383-bf20-49c2-ba89-0d3eb0066ba5	82f3d1ae-eed1-435a-9603-4cbe1707dea8
09a11383-bf20-49c2-ba89-0d3eb0066ba5	2e7d7403-2aa7-44fa-874f-65ccc618f197
09a11383-bf20-49c2-ba89-0d3eb0066ba5	e6784789-65db-4fb5-ae18-9c5275abb32f
09a11383-bf20-49c2-ba89-0d3eb0066ba5	d9aaf74f-861a-44ce-bef8-0efa2065bb61
09a11383-bf20-49c2-ba89-0d3eb0066ba5	2ba46973-f605-4585-ab09-c9a3a1f618b9
e791f941-ddd1-41fa-aa40-9f015a6d3564	2e7d7403-2aa7-44fa-874f-65ccc618f197
e791f941-ddd1-41fa-aa40-9f015a6d3564	2ba46973-f605-4585-ab09-c9a3a1f618b9
6c27024e-0972-474a-b80a-ef9f59d5939c	e6784789-65db-4fb5-ae18-9c5275abb32f
b7ba33d5-86f5-4594-9a7e-645c26c2910d	f7e7c2c6-be62-4015-8c2d-3baaae409fc9
09a11383-bf20-49c2-ba89-0d3eb0066ba5	847bde1f-9d11-43dd-b8bb-6d300016617f
09a11383-bf20-49c2-ba89-0d3eb0066ba5	8fb3418e-e88c-434f-9743-a3c1f9257bc1
09a11383-bf20-49c2-ba89-0d3eb0066ba5	776e540b-0b6e-4f4e-b1da-aefbf60ef3f4
09a11383-bf20-49c2-ba89-0d3eb0066ba5	f6541f9c-0c91-4634-aa54-b9ffed2acd39
09a11383-bf20-49c2-ba89-0d3eb0066ba5	137bc95c-02d9-4513-b7d0-858b54400933
09a11383-bf20-49c2-ba89-0d3eb0066ba5	898058c3-b142-4cd2-85c3-c75fbd33364d
09a11383-bf20-49c2-ba89-0d3eb0066ba5	e6ef49e2-b26b-46c3-a3f6-efc5249de48b
09a11383-bf20-49c2-ba89-0d3eb0066ba5	b477b0be-2038-4004-af64-509fb05876c9
09a11383-bf20-49c2-ba89-0d3eb0066ba5	6676f70c-6a17-40ea-b396-94a50db7a5aa
09a11383-bf20-49c2-ba89-0d3eb0066ba5	34e769ee-e340-4b90-b7d5-587290985670
09a11383-bf20-49c2-ba89-0d3eb0066ba5	701b237a-5917-47a5-9945-1a7faeaf333f
09a11383-bf20-49c2-ba89-0d3eb0066ba5	429a1a0a-774c-402b-abe2-c8620db7dbd4
09a11383-bf20-49c2-ba89-0d3eb0066ba5	e2210606-e20a-45f3-8414-8e8fe6de8bde
09a11383-bf20-49c2-ba89-0d3eb0066ba5	ad1c7a83-3821-48f0-ad98-300a36c2c93b
09a11383-bf20-49c2-ba89-0d3eb0066ba5	8929c1c9-7354-4b74-a173-d7312503a56b
09a11383-bf20-49c2-ba89-0d3eb0066ba5	2069e141-a4e4-4b20-bfc7-8f06ad61267f
09a11383-bf20-49c2-ba89-0d3eb0066ba5	8d491570-25f3-4fde-a442-417cfa042484
09a11383-bf20-49c2-ba89-0d3eb0066ba5	3a2a1262-5795-4572-aa3d-12fe4dee4139
f6541f9c-0c91-4634-aa54-b9ffed2acd39	8929c1c9-7354-4b74-a173-d7312503a56b
f6541f9c-0c91-4634-aa54-b9ffed2acd39	3a2a1262-5795-4572-aa3d-12fe4dee4139
137bc95c-02d9-4513-b7d0-858b54400933	2069e141-a4e4-4b20-bfc7-8f06ad61267f
323b2686-4fd3-421a-beaf-fe18e36dcea4	52b49ba6-0bb8-418c-9b27-ca062f66355a
323b2686-4fd3-421a-beaf-fe18e36dcea4	5837e874-7311-4ca8-8f84-0fb6ff291faf
323b2686-4fd3-421a-beaf-fe18e36dcea4	7365b7a4-1e18-48af-8f7a-597f30ef48d2
323b2686-4fd3-421a-beaf-fe18e36dcea4	8d4b72fd-4863-49c0-b196-42dcd31c9b7c
323b2686-4fd3-421a-beaf-fe18e36dcea4	83f9df32-6b7f-40ad-a189-e41e8d6024a3
323b2686-4fd3-421a-beaf-fe18e36dcea4	1c4309ed-a44d-412d-8c0a-f62f858cb424
323b2686-4fd3-421a-beaf-fe18e36dcea4	2611a8d2-b911-4473-b095-115c0859aaf6
323b2686-4fd3-421a-beaf-fe18e36dcea4	cb5069fb-f651-4f00-8004-04cd55e70f4b
323b2686-4fd3-421a-beaf-fe18e36dcea4	c7e8e783-c311-4833-9470-7441c561947f
323b2686-4fd3-421a-beaf-fe18e36dcea4	f27b5f8b-3cf7-424f-8b58-46c075cedf69
323b2686-4fd3-421a-beaf-fe18e36dcea4	b2654dea-edea-40ab-ae60-01392cb4eac4
323b2686-4fd3-421a-beaf-fe18e36dcea4	c43b44f1-ca06-4f18-9f27-a990e6d3bd2b
323b2686-4fd3-421a-beaf-fe18e36dcea4	283aa7b3-3dbb-40d5-bff8-1f32ddec6f7a
323b2686-4fd3-421a-beaf-fe18e36dcea4	fcc708ca-4278-461b-9011-da56374f0bc0
323b2686-4fd3-421a-beaf-fe18e36dcea4	d3eda9c0-04f4-4cb5-9890-beb97da3a976
323b2686-4fd3-421a-beaf-fe18e36dcea4	91d532a8-160b-42c4-98a5-8dbd4abbec38
323b2686-4fd3-421a-beaf-fe18e36dcea4	a118fce8-e27f-4be0-b65f-939179f2ca97
7365b7a4-1e18-48af-8f7a-597f30ef48d2	fcc708ca-4278-461b-9011-da56374f0bc0
7365b7a4-1e18-48af-8f7a-597f30ef48d2	a118fce8-e27f-4be0-b65f-939179f2ca97
8d4b72fd-4863-49c0-b196-42dcd31c9b7c	d3eda9c0-04f4-4cb5-9890-beb97da3a976
09a11383-bf20-49c2-ba89-0d3eb0066ba5	9de32d89-9b5f-4c2a-b1b8-97aaa7fec2e4
c16a0346-47d6-40b3-b42a-4166e2f2a840	785fe446-a46c-495b-a4cb-983ac990dbf0
323b2686-4fd3-421a-beaf-fe18e36dcea4	ddcceb30-8cdd-4347-afac-7f7af976f3df
33115a85-d17c-4316-b881-48f919810a00	7365b7a4-1e18-48af-8f7a-597f30ef48d2
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, device, hash_iterations, salt, type, value, user_id, created_date, counter, digits, period, algorithm) FROM stdin;
270e9b5c-6f2d-4b25-8eea-a9df7855ac0d	\N	27500	\\xd60686f98ce7cddc9aca76afb9169695	password	qtWDwe3oMdkmibdlMtYywiIHG+mG/i9wqV7i9vk9kS2+oS9xJT2V4AZBZTonsQspA7aA2Stj8trqcA/rFBqKOA==	82037fde-fefe-470c-a6f2-9ce605ba963d	\N	0	0	0	pbkdf2-sha256
08776751-db85-4aef-af15-bd5f87e0da02	\N	27500	\\x00f4ae6f3d3eba051bec8ce1136b25f0	password	By1jgZ59b0h5RoPqaqlZcj0wKFE4q5DX5U7uERJbLlVtoAqtm7xKMIV+vTG8hHXENKEgDcGUIcPgZjaq9ntLLw==	58297bc2-4b4d-4802-998f-6eaa605bc8bf	1547478273074	0	0	0	pbkdf2-sha256
5f56f32f-9ff0-4e1a-98a9-c08d9a17cf3c	\N	27500	\\x2222afdd82763e992b8b3cb291573c95	password	Ov7vm4OdS1ehOqJhqXKv7qBR95dAVe4B+TRjRIZw5nhbAS7ri3D21YyTLMQVpGfsATS3ISFKkZ+FEAXL2JLrUw==	17b8864d-d8dd-4c7d-8857-2b072a9e286a	1547478385916	0	0	0	pbkdf2-sha256
cfb800ab-aaff-460d-975f-443b054599c2	\N	27500	\\xfd66c2b64c72d1615b95d27c5d6dcbad	password	KMoiKtR/ZF8wUj1Qbi+YgavSiOfothAeEN6e0E7fD14hxNCBNRiJ2gEQQtaU+D5Cn90tFt93kF4DIscBySWxmg==	837892df-3b68-4d9c-9615-269d408f2693	1547478414837	0	0	0	pbkdf2-sha256
2f698392-5af4-437e-80b4-710ceb6cafe7	\N	27500	\\xa6220292d3159620bb5f786acf64e2f8	password	XsFOUQ8hLHhQyRg93InQM6eP8bXa196gaeGKtYcUdYmpOUigYjUGiNVokAn27hhdEQUQCOxHAQOYZOW5ch3Yag==	7cd7395d-47c2-4739-835b-bcc75fa772df	1547478423658	0	0	0	pbkdf2-sha256
\.


--
-- Data for Name: credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2019-01-14 15:00:00.878322	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7478000613
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2019-01-14 15:00:00.887181	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7478000613
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2019-01-14 15:00:00.928077	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7478000613
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2019-01-14 15:00:00.931554	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7478000613
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2019-01-14 15:00:01.054714	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7478000613
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2019-01-14 15:00:01.062527	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7478000613
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2019-01-14 15:00:01.202986	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7478000613
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2019-01-14 15:00:01.206747	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7478000613
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2019-01-14 15:00:01.211709	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7478000613
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2019-01-14 15:00:01.37352	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7478000613
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2019-01-14 15:00:01.496812	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7478000613
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2019-01-14 15:00:01.499874	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7478000613
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2019-01-14 15:00:01.590325	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7478000613
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-01-14 15:00:01.63069	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7478000613
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-01-14 15:00:01.63257	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7478000613
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-01-14 15:00:01.634239	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7478000613
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-01-14 15:00:01.63591	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7478000613
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2019-01-14 15:00:01.701379	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7478000613
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2019-01-14 15:00:01.76653	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7478000613
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2019-01-14 15:00:01.770123	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7478000613
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-01-14 15:00:02.231055	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7478000613
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2019-01-14 15:00:01.772527	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7478000613
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2019-01-14 15:00:01.77542	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7478000613
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2019-01-14 15:00:01.792151	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7478000613
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2019-01-14 15:00:01.796282	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7478000613
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2019-01-14 15:00:01.798076	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7478000613
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2019-01-14 15:00:01.826791	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7478000613
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2019-01-14 15:00:01.888164	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7478000613
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2019-01-14 15:00:01.892483	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7478000613
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2019-01-14 15:00:01.947314	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7478000613
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2019-01-14 15:00:01.958964	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7478000613
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2019-01-14 15:00:01.983938	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7478000613
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2019-01-14 15:00:01.988926	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7478000613
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-01-14 15:00:01.994751	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7478000613
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-01-14 15:00:01.996693	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7478000613
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-01-14 15:00:02.033264	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7478000613
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2019-01-14 15:00:02.060236	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7478000613
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-01-14 15:00:02.069599	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7478000613
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2019-01-14 15:00:02.072908	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7478000613
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2019-01-14 15:00:02.083552	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7478000613
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-01-14 15:00:02.085247	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7478000613
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-01-14 15:00:02.086954	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7478000613
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2019-01-14 15:00:02.091866	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7478000613
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-01-14 15:00:02.205198	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7478000613
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2019-01-14 15:00:02.221536	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7478000613
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-01-14 15:00:02.239893	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7478000613
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-01-14 15:00:02.244144	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7478000613
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-01-14 15:00:02.311696	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7478000613
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-01-14 15:00:02.336711	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7478000613
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2019-01-14 15:00:02.404239	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7478000613
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2019-01-14 15:00:02.454285	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7478000613
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2019-01-14 15:00:02.461072	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7478000613
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2019-01-14 15:00:02.467085	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7478000613
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2019-01-14 15:00:02.472324	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7478000613
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-01-14 15:00:02.483521	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7478000613
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-01-14 15:00:02.489998	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7478000613
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-01-14 15:00:02.5406	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7478000613
4.0.0-KEYCLOAK-5579	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-01-14 15:00:02.634145	58	EXECUTED	7:c88da39534e99aba51cc89d09fd53936	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7478000613
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2019-01-14 15:00:02.698936	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7478000613
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2019-01-14 15:00:02.708857	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7478000613
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-01-14 15:00:02.720905	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7478000613
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2019-01-14 15:00:02.725721	62	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7478000613
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2019-01-14 15:00:02.731307	63	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7478000613
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	442bf6b2-bad8-4800-a9bd-a5c8b39feab7	f
master	0683cd0d-4e5a-41a7-b284-e61d6023e643	t
master	0a9085a6-d327-423b-8dcc-62fac65d8d47	t
master	03b367e0-a758-4630-9ca4-395c86fa9ea0	t
master	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62	f
master	39e7ac4f-154f-418e-a687-a2c1ab798df1	f
StaticLoginConnect	13b12e29-60e1-4a52-8331-26c05e79cf61	f
StaticLoginConnect	8a193695-7ba5-4b5f-9263-129957776aec	t
StaticLoginConnect	851becc1-f21e-439f-aec4-cabf3c31320a	t
StaticLoginConnect	69f68e8d-f0cd-4a42-8eca-5adbe11413bb	t
StaticLoginConnect	9821a6cb-1b7e-4e08-bb33-126b451b9f73	f
StaticLoginConnect	53cdf76e-1529-4caf-9bde-91aebadaf3c1	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, device, hash_iterations, salt, type, value, created_date, counter, digits, period, algorithm, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
625e921a-814f-4a9c-a4bf-36168f706f9d	kheopsAuthorization	\N	StaticLoginConnect
43a5b241-b021-4045-ad94-49eb95b0ec34	kheopsUsers	\N	StaticLoginConnect
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
09a11383-bf20-49c2-ba89-0d3eb0066ba5	master	f	${role_admin}	admin	master	\N	master
3578435a-0e7a-424d-8fde-b5fc97fc359c	master	f	${role_create-realm}	create-realm	master	\N	master
b4d3c46a-356a-4620-97fd-134b3bb803d5	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_create-client}	create-client	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
94dcd223-b0ec-4b61-b2ca-35fcd8db9d31	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-realm}	view-realm	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
e791f941-ddd1-41fa-aa40-9f015a6d3564	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-users}	view-users	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
6c27024e-0972-474a-b80a-ef9f59d5939c	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-clients}	view-clients	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
c8a99838-48b5-47cb-a6b4-cca70cb19b36	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-events}	view-events	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
7ac22fe3-ef72-4230-b4bc-7b4149539c51	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-identity-providers}	view-identity-providers	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
6902abd6-82ec-4c43-bb61-8fe68d9c6a11	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_view-authorization}	view-authorization	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
d70f278c-a793-412f-93ec-3286fa2e161b	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-realm}	manage-realm	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
92bd9ac6-9d88-41a5-8941-5073276ca0c1	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-users}	manage-users	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
345206ee-bdbb-4378-a324-c8151e12c1df	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-clients}	manage-clients	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
9a7d62de-382e-44e1-b1a2-c90e4acac8aa	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-events}	manage-events	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
8603c7d3-fa21-426f-ac83-d1e6aaef4c5a	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-identity-providers}	manage-identity-providers	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
82f3d1ae-eed1-435a-9603-4cbe1707dea8	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_manage-authorization}	manage-authorization	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
2e7d7403-2aa7-44fa-874f-65ccc618f197	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_query-users}	query-users	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
e6784789-65db-4fb5-ae18-9c5275abb32f	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_query-clients}	query-clients	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
d9aaf74f-861a-44ce-bef8-0efa2065bb61	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_query-realms}	query-realms	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
2ba46973-f605-4585-ab09-c9a3a1f618b9	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_query-groups}	query-groups	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
7e1a7438-c5cd-45ea-896b-15b89d0778cf	6fc2887c-89c7-4d58-a968-bce74b2278db	t	${role_view-profile}	view-profile	master	6fc2887c-89c7-4d58-a968-bce74b2278db	\N
b7ba33d5-86f5-4594-9a7e-645c26c2910d	6fc2887c-89c7-4d58-a968-bce74b2278db	t	${role_manage-account}	manage-account	master	6fc2887c-89c7-4d58-a968-bce74b2278db	\N
f7e7c2c6-be62-4015-8c2d-3baaae409fc9	6fc2887c-89c7-4d58-a968-bce74b2278db	t	${role_manage-account-links}	manage-account-links	master	6fc2887c-89c7-4d58-a968-bce74b2278db	\N
46f9dce2-2d71-4087-a2ea-33a91663f241	8dc587b5-cfeb-432d-91b6-7cc2184f1738	t	${role_read-token}	read-token	master	8dc587b5-cfeb-432d-91b6-7cc2184f1738	\N
847bde1f-9d11-43dd-b8bb-6d300016617f	8c237fe9-e6e2-4613-80c8-8d073b7c854f	t	${role_impersonation}	impersonation	master	8c237fe9-e6e2-4613-80c8-8d073b7c854f	\N
60df2967-fd62-486e-bf6b-3ac5985b46fa	master	f	${role_offline-access}	offline_access	master	\N	master
7d8805ba-7e10-4aaa-a414-8ec410dcda9b	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
8fb3418e-e88c-434f-9743-a3c1f9257bc1	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_create-client}	create-client	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
776e540b-0b6e-4f4e-b1da-aefbf60ef3f4	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-realm}	view-realm	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
f6541f9c-0c91-4634-aa54-b9ffed2acd39	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-users}	view-users	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
137bc95c-02d9-4513-b7d0-858b54400933	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-clients}	view-clients	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
898058c3-b142-4cd2-85c3-c75fbd33364d	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-events}	view-events	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
e6ef49e2-b26b-46c3-a3f6-efc5249de48b	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-identity-providers}	view-identity-providers	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
b477b0be-2038-4004-af64-509fb05876c9	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_view-authorization}	view-authorization	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
6676f70c-6a17-40ea-b396-94a50db7a5aa	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-realm}	manage-realm	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
34e769ee-e340-4b90-b7d5-587290985670	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-users}	manage-users	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
701b237a-5917-47a5-9945-1a7faeaf333f	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-clients}	manage-clients	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
429a1a0a-774c-402b-abe2-c8620db7dbd4	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-events}	manage-events	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
e2210606-e20a-45f3-8414-8e8fe6de8bde	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-identity-providers}	manage-identity-providers	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
ad1c7a83-3821-48f0-ad98-300a36c2c93b	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_manage-authorization}	manage-authorization	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
8929c1c9-7354-4b74-a173-d7312503a56b	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_query-users}	query-users	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
2069e141-a4e4-4b20-bfc7-8f06ad61267f	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_query-clients}	query-clients	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
8d491570-25f3-4fde-a442-417cfa042484	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_query-realms}	query-realms	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
3a2a1262-5795-4572-aa3d-12fe4dee4139	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_query-groups}	query-groups	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
323b2686-4fd3-421a-beaf-fe18e36dcea4	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_realm-admin}	realm-admin	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
52b49ba6-0bb8-418c-9b27-ca062f66355a	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_create-client}	create-client	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
5837e874-7311-4ca8-8f84-0fb6ff291faf	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-realm}	view-realm	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
7365b7a4-1e18-48af-8f7a-597f30ef48d2	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-users}	view-users	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
8d4b72fd-4863-49c0-b196-42dcd31c9b7c	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-clients}	view-clients	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
83f9df32-6b7f-40ad-a189-e41e8d6024a3	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-events}	view-events	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
1c4309ed-a44d-412d-8c0a-f62f858cb424	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-identity-providers}	view-identity-providers	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
2611a8d2-b911-4473-b095-115c0859aaf6	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_view-authorization}	view-authorization	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
cb5069fb-f651-4f00-8004-04cd55e70f4b	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-realm}	manage-realm	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
c7e8e783-c311-4833-9470-7441c561947f	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-users}	manage-users	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
f27b5f8b-3cf7-424f-8b58-46c075cedf69	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-clients}	manage-clients	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
b2654dea-edea-40ab-ae60-01392cb4eac4	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-events}	manage-events	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
c43b44f1-ca06-4f18-9f27-a990e6d3bd2b	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-identity-providers}	manage-identity-providers	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
283aa7b3-3dbb-40d5-bff8-1f32ddec6f7a	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_manage-authorization}	manage-authorization	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
fcc708ca-4278-461b-9011-da56374f0bc0	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_query-users}	query-users	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
d3eda9c0-04f4-4cb5-9890-beb97da3a976	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_query-clients}	query-clients	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
91d532a8-160b-42c4-98a5-8dbd4abbec38	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_query-realms}	query-realms	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
a118fce8-e27f-4be0-b65f-939179f2ca97	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_query-groups}	query-groups	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
3a521fc3-dc09-4de0-b1cf-29394da726cc	95c5cc68-9c75-476b-acba-d9caa6f556b7	t	${role_view-profile}	view-profile	StaticLoginConnect	95c5cc68-9c75-476b-acba-d9caa6f556b7	\N
c16a0346-47d6-40b3-b42a-4166e2f2a840	95c5cc68-9c75-476b-acba-d9caa6f556b7	t	${role_manage-account}	manage-account	StaticLoginConnect	95c5cc68-9c75-476b-acba-d9caa6f556b7	\N
785fe446-a46c-495b-a4cb-983ac990dbf0	95c5cc68-9c75-476b-acba-d9caa6f556b7	t	${role_manage-account-links}	manage-account-links	StaticLoginConnect	95c5cc68-9c75-476b-acba-d9caa6f556b7	\N
9de32d89-9b5f-4c2a-b1b8-97aaa7fec2e4	abc9fa09-72e4-4441-885a-3e26e5279410	t	${role_impersonation}	impersonation	master	abc9fa09-72e4-4441-885a-3e26e5279410	\N
ddcceb30-8cdd-4347-afac-7f7af976f3df	68e55df7-429b-4da2-bd2f-a6a700613367	t	${role_impersonation}	impersonation	StaticLoginConnect	68e55df7-429b-4da2-bd2f-a6a700613367	\N
fe2cccc4-ba78-4b67-ac7d-4e26f78c7dba	266003a0-2de0-46f7-9b07-5179b5ccc76a	t	${role_read-token}	read-token	StaticLoginConnect	266003a0-2de0-46f7-9b07-5179b5ccc76a	\N
db1800f8-bd9f-4985-8d69-2119aff08d8c	StaticLoginConnect	f	${role_offline-access}	offline_access	StaticLoginConnect	\N	StaticLoginConnect
10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a	StaticLoginConnect	f	${role_uma_authorization}	uma_authorization	StaticLoginConnect	\N	StaticLoginConnect
33115a85-d17c-4316-b881-48f919810a00	StaticLoginConnect	f	\N	listUsers	StaticLoginConnect	\N	StaticLoginConnect
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version) FROM stdin;
SINGLETON	4.2.0
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, last_session_refresh, offline_flag, data) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
a85e9546-17fa-4cff-aa04-755a1d4b25e6	locale	openid-connect	oidc-usermodel-attribute-mapper	d8bb2fbd-ce5f-469e-aa44-7fee2b677311	\N
62fb39ca-d9dd-43d4-9991-bb36d032461f	role list	saml	saml-role-list-mapper	\N	0683cd0d-4e5a-41a7-b284-e61d6023e643
259e486f-a951-47e3-a0e9-d4e1d6498081	full name	openid-connect	oidc-full-name-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
5b048b4d-b2f0-47c2-8395-1c696213918b	family name	openid-connect	oidc-usermodel-property-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
3f03e96a-ce33-4268-a646-2a3280bf91c6	given name	openid-connect	oidc-usermodel-property-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
861b533c-81ce-40e0-a721-b799e02e928d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
b011a7f2-342a-4cc0-a3e2-f73f706da77f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
7e91ec32-3587-46e6-940a-889184536057	username	openid-connect	oidc-usermodel-property-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
720bbafa-db5d-4a96-8c45-ce79b7e2217f	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
c783d568-5243-4a2b-917b-1dda533f7821	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
bb1b4584-edc2-449e-8966-67c3ca2989c2	website	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
8184ae7a-0a91-4c07-866f-9494036e5c3c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
853debef-762a-49dd-9367-255dba1e86b7	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
7da04e31-38b9-4327-81fe-80dfc402ee4a	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	0a9085a6-d327-423b-8dcc-62fac65d8d47
7202e747-e269-40a7-995e-a66b31905a2a	email	openid-connect	oidc-usermodel-property-mapper	\N	03b367e0-a758-4630-9ca4-395c86fa9ea0
e80396d2-94ce-4e1c-853e-1d58a1e187e2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	03b367e0-a758-4630-9ca4-395c86fa9ea0
89a150c6-0dc0-4f0f-b16d-fa24d6866758	address	openid-connect	oidc-address-mapper	\N	7d9a2483-2c5d-4b90-a3d6-6f49097b4e62
27393d0e-14b2-40b4-8178-44751e2c5ce3	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	39e7ac4f-154f-418e-a687-a2c1ab798df1
d1c4525e-1960-4293-98cb-dd1388ae15f5	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	39e7ac4f-154f-418e-a687-a2c1ab798df1
c1a9927e-6076-4f90-8dab-e8465de5897d	role list	saml	saml-role-list-mapper	\N	8a193695-7ba5-4b5f-9263-129957776aec
31c59c67-31bf-47b7-aa50-b0fb1214dff0	full name	openid-connect	oidc-full-name-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
0599262a-0127-4dd7-adc5-734a4373b6b4	family name	openid-connect	oidc-usermodel-property-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
bd302cb4-7377-4abd-8219-97818ef16254	given name	openid-connect	oidc-usermodel-property-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
502fe35f-6822-45da-9cf0-58bc911a4190	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
ae2be16c-e331-4c68-a46d-f51e4498cfd3	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
44792cf6-1701-4ffe-aef1-9a1bbf79418e	username	openid-connect	oidc-usermodel-property-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
27d896f7-f249-4cdf-a055-6c703dfedc41	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
7061945c-04fa-4836-b24d-d503221d57a0	website	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
75348755-bd73-459b-a142-8beb308d3ba2	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
cc028e31-5f66-453d-915f-cff7f8ff12c8	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
d274483b-692b-48bb-a616-235e1336b57f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
3153a86a-07b2-47db-90e7-46f85c67a6d7	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
cefc00d8-846e-47b4-a19b-7a86bafaee0a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	851becc1-f21e-439f-aec4-cabf3c31320a
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	email	openid-connect	oidc-usermodel-property-mapper	\N	69f68e8d-f0cd-4a42-8eca-5adbe11413bb
6ded11c3-d525-487c-8468-1c59a4aa1522	email verified	openid-connect	oidc-usermodel-property-mapper	\N	69f68e8d-f0cd-4a42-8eca-5adbe11413bb
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	address	openid-connect	oidc-address-mapper	\N	9821a6cb-1b7e-4e08-bb33-126b451b9f73
18ec9767-a54b-46a4-abba-7605b9f82502	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	53cdf76e-1529-4caf-9bde-91aebadaf3c1
acfbb60e-39ef-459c-a069-764187783baa	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	53cdf76e-1529-4caf-9bde-91aebadaf3c1
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	locale	openid-connect	oidc-usermodel-attribute-mapper	cef97d83-ab67-49b9-9a85-9b2f8097e338	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
a85e9546-17fa-4cff-aa04-755a1d4b25e6	true	userinfo.token.claim
a85e9546-17fa-4cff-aa04-755a1d4b25e6	locale	user.attribute
a85e9546-17fa-4cff-aa04-755a1d4b25e6	true	id.token.claim
a85e9546-17fa-4cff-aa04-755a1d4b25e6	true	access.token.claim
a85e9546-17fa-4cff-aa04-755a1d4b25e6	locale	claim.name
a85e9546-17fa-4cff-aa04-755a1d4b25e6	String	jsonType.label
62fb39ca-d9dd-43d4-9991-bb36d032461f	false	single
62fb39ca-d9dd-43d4-9991-bb36d032461f	Basic	attribute.nameformat
62fb39ca-d9dd-43d4-9991-bb36d032461f	Role	attribute.name
259e486f-a951-47e3-a0e9-d4e1d6498081	true	userinfo.token.claim
259e486f-a951-47e3-a0e9-d4e1d6498081	true	id.token.claim
259e486f-a951-47e3-a0e9-d4e1d6498081	true	access.token.claim
5b048b4d-b2f0-47c2-8395-1c696213918b	true	userinfo.token.claim
5b048b4d-b2f0-47c2-8395-1c696213918b	lastName	user.attribute
5b048b4d-b2f0-47c2-8395-1c696213918b	true	id.token.claim
5b048b4d-b2f0-47c2-8395-1c696213918b	true	access.token.claim
5b048b4d-b2f0-47c2-8395-1c696213918b	family_name	claim.name
5b048b4d-b2f0-47c2-8395-1c696213918b	String	jsonType.label
3f03e96a-ce33-4268-a646-2a3280bf91c6	true	userinfo.token.claim
3f03e96a-ce33-4268-a646-2a3280bf91c6	firstName	user.attribute
3f03e96a-ce33-4268-a646-2a3280bf91c6	true	id.token.claim
3f03e96a-ce33-4268-a646-2a3280bf91c6	true	access.token.claim
3f03e96a-ce33-4268-a646-2a3280bf91c6	given_name	claim.name
3f03e96a-ce33-4268-a646-2a3280bf91c6	String	jsonType.label
861b533c-81ce-40e0-a721-b799e02e928d	true	userinfo.token.claim
861b533c-81ce-40e0-a721-b799e02e928d	middleName	user.attribute
861b533c-81ce-40e0-a721-b799e02e928d	true	id.token.claim
861b533c-81ce-40e0-a721-b799e02e928d	true	access.token.claim
861b533c-81ce-40e0-a721-b799e02e928d	middle_name	claim.name
861b533c-81ce-40e0-a721-b799e02e928d	String	jsonType.label
b011a7f2-342a-4cc0-a3e2-f73f706da77f	true	userinfo.token.claim
b011a7f2-342a-4cc0-a3e2-f73f706da77f	nickname	user.attribute
b011a7f2-342a-4cc0-a3e2-f73f706da77f	true	id.token.claim
b011a7f2-342a-4cc0-a3e2-f73f706da77f	true	access.token.claim
b011a7f2-342a-4cc0-a3e2-f73f706da77f	nickname	claim.name
b011a7f2-342a-4cc0-a3e2-f73f706da77f	String	jsonType.label
7e91ec32-3587-46e6-940a-889184536057	true	userinfo.token.claim
7e91ec32-3587-46e6-940a-889184536057	username	user.attribute
7e91ec32-3587-46e6-940a-889184536057	true	id.token.claim
7e91ec32-3587-46e6-940a-889184536057	true	access.token.claim
7e91ec32-3587-46e6-940a-889184536057	preferred_username	claim.name
7e91ec32-3587-46e6-940a-889184536057	String	jsonType.label
720bbafa-db5d-4a96-8c45-ce79b7e2217f	true	userinfo.token.claim
720bbafa-db5d-4a96-8c45-ce79b7e2217f	profile	user.attribute
720bbafa-db5d-4a96-8c45-ce79b7e2217f	true	id.token.claim
720bbafa-db5d-4a96-8c45-ce79b7e2217f	true	access.token.claim
720bbafa-db5d-4a96-8c45-ce79b7e2217f	profile	claim.name
720bbafa-db5d-4a96-8c45-ce79b7e2217f	String	jsonType.label
c783d568-5243-4a2b-917b-1dda533f7821	true	userinfo.token.claim
c783d568-5243-4a2b-917b-1dda533f7821	picture	user.attribute
c783d568-5243-4a2b-917b-1dda533f7821	true	id.token.claim
c783d568-5243-4a2b-917b-1dda533f7821	true	access.token.claim
c783d568-5243-4a2b-917b-1dda533f7821	picture	claim.name
c783d568-5243-4a2b-917b-1dda533f7821	String	jsonType.label
bb1b4584-edc2-449e-8966-67c3ca2989c2	true	userinfo.token.claim
bb1b4584-edc2-449e-8966-67c3ca2989c2	website	user.attribute
bb1b4584-edc2-449e-8966-67c3ca2989c2	true	id.token.claim
bb1b4584-edc2-449e-8966-67c3ca2989c2	true	access.token.claim
bb1b4584-edc2-449e-8966-67c3ca2989c2	website	claim.name
bb1b4584-edc2-449e-8966-67c3ca2989c2	String	jsonType.label
8184ae7a-0a91-4c07-866f-9494036e5c3c	true	userinfo.token.claim
8184ae7a-0a91-4c07-866f-9494036e5c3c	gender	user.attribute
8184ae7a-0a91-4c07-866f-9494036e5c3c	true	id.token.claim
8184ae7a-0a91-4c07-866f-9494036e5c3c	true	access.token.claim
8184ae7a-0a91-4c07-866f-9494036e5c3c	gender	claim.name
8184ae7a-0a91-4c07-866f-9494036e5c3c	String	jsonType.label
853debef-762a-49dd-9367-255dba1e86b7	true	userinfo.token.claim
853debef-762a-49dd-9367-255dba1e86b7	birthdate	user.attribute
853debef-762a-49dd-9367-255dba1e86b7	true	id.token.claim
853debef-762a-49dd-9367-255dba1e86b7	true	access.token.claim
853debef-762a-49dd-9367-255dba1e86b7	birthdate	claim.name
853debef-762a-49dd-9367-255dba1e86b7	String	jsonType.label
7da04e31-38b9-4327-81fe-80dfc402ee4a	true	userinfo.token.claim
7da04e31-38b9-4327-81fe-80dfc402ee4a	zoneinfo	user.attribute
7da04e31-38b9-4327-81fe-80dfc402ee4a	true	id.token.claim
7da04e31-38b9-4327-81fe-80dfc402ee4a	true	access.token.claim
7da04e31-38b9-4327-81fe-80dfc402ee4a	zoneinfo	claim.name
7da04e31-38b9-4327-81fe-80dfc402ee4a	String	jsonType.label
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	true	userinfo.token.claim
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	locale	user.attribute
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	true	id.token.claim
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	true	access.token.claim
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	locale	claim.name
88edb396-f8de-4aaf-9d6d-f56ed110ecc4	String	jsonType.label
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	true	userinfo.token.claim
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	updatedAt	user.attribute
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	true	id.token.claim
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	true	access.token.claim
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	updated_at	claim.name
cdb45d9a-88ab-450c-8ce0-9f6ab4747339	String	jsonType.label
7202e747-e269-40a7-995e-a66b31905a2a	true	userinfo.token.claim
7202e747-e269-40a7-995e-a66b31905a2a	email	user.attribute
7202e747-e269-40a7-995e-a66b31905a2a	true	id.token.claim
7202e747-e269-40a7-995e-a66b31905a2a	true	access.token.claim
7202e747-e269-40a7-995e-a66b31905a2a	email	claim.name
7202e747-e269-40a7-995e-a66b31905a2a	String	jsonType.label
e80396d2-94ce-4e1c-853e-1d58a1e187e2	true	userinfo.token.claim
e80396d2-94ce-4e1c-853e-1d58a1e187e2	emailVerified	user.attribute
e80396d2-94ce-4e1c-853e-1d58a1e187e2	true	id.token.claim
e80396d2-94ce-4e1c-853e-1d58a1e187e2	true	access.token.claim
e80396d2-94ce-4e1c-853e-1d58a1e187e2	email_verified	claim.name
e80396d2-94ce-4e1c-853e-1d58a1e187e2	boolean	jsonType.label
89a150c6-0dc0-4f0f-b16d-fa24d6866758	formatted	user.attribute.formatted
89a150c6-0dc0-4f0f-b16d-fa24d6866758	country	user.attribute.country
89a150c6-0dc0-4f0f-b16d-fa24d6866758	postal_code	user.attribute.postal_code
89a150c6-0dc0-4f0f-b16d-fa24d6866758	true	userinfo.token.claim
89a150c6-0dc0-4f0f-b16d-fa24d6866758	street	user.attribute.street
89a150c6-0dc0-4f0f-b16d-fa24d6866758	true	id.token.claim
89a150c6-0dc0-4f0f-b16d-fa24d6866758	region	user.attribute.region
89a150c6-0dc0-4f0f-b16d-fa24d6866758	true	access.token.claim
89a150c6-0dc0-4f0f-b16d-fa24d6866758	locality	user.attribute.locality
27393d0e-14b2-40b4-8178-44751e2c5ce3	true	userinfo.token.claim
27393d0e-14b2-40b4-8178-44751e2c5ce3	phoneNumber	user.attribute
27393d0e-14b2-40b4-8178-44751e2c5ce3	true	id.token.claim
27393d0e-14b2-40b4-8178-44751e2c5ce3	true	access.token.claim
27393d0e-14b2-40b4-8178-44751e2c5ce3	phone_number	claim.name
27393d0e-14b2-40b4-8178-44751e2c5ce3	String	jsonType.label
d1c4525e-1960-4293-98cb-dd1388ae15f5	true	userinfo.token.claim
d1c4525e-1960-4293-98cb-dd1388ae15f5	phoneNumberVerified	user.attribute
d1c4525e-1960-4293-98cb-dd1388ae15f5	true	id.token.claim
d1c4525e-1960-4293-98cb-dd1388ae15f5	true	access.token.claim
d1c4525e-1960-4293-98cb-dd1388ae15f5	phone_number_verified	claim.name
d1c4525e-1960-4293-98cb-dd1388ae15f5	boolean	jsonType.label
c1a9927e-6076-4f90-8dab-e8465de5897d	false	single
c1a9927e-6076-4f90-8dab-e8465de5897d	Basic	attribute.nameformat
c1a9927e-6076-4f90-8dab-e8465de5897d	Role	attribute.name
31c59c67-31bf-47b7-aa50-b0fb1214dff0	true	userinfo.token.claim
31c59c67-31bf-47b7-aa50-b0fb1214dff0	true	id.token.claim
31c59c67-31bf-47b7-aa50-b0fb1214dff0	true	access.token.claim
0599262a-0127-4dd7-adc5-734a4373b6b4	true	userinfo.token.claim
0599262a-0127-4dd7-adc5-734a4373b6b4	lastName	user.attribute
0599262a-0127-4dd7-adc5-734a4373b6b4	true	id.token.claim
0599262a-0127-4dd7-adc5-734a4373b6b4	true	access.token.claim
0599262a-0127-4dd7-adc5-734a4373b6b4	family_name	claim.name
0599262a-0127-4dd7-adc5-734a4373b6b4	String	jsonType.label
bd302cb4-7377-4abd-8219-97818ef16254	true	userinfo.token.claim
bd302cb4-7377-4abd-8219-97818ef16254	firstName	user.attribute
bd302cb4-7377-4abd-8219-97818ef16254	true	id.token.claim
bd302cb4-7377-4abd-8219-97818ef16254	true	access.token.claim
bd302cb4-7377-4abd-8219-97818ef16254	given_name	claim.name
bd302cb4-7377-4abd-8219-97818ef16254	String	jsonType.label
502fe35f-6822-45da-9cf0-58bc911a4190	true	userinfo.token.claim
502fe35f-6822-45da-9cf0-58bc911a4190	middleName	user.attribute
502fe35f-6822-45da-9cf0-58bc911a4190	true	id.token.claim
502fe35f-6822-45da-9cf0-58bc911a4190	true	access.token.claim
502fe35f-6822-45da-9cf0-58bc911a4190	middle_name	claim.name
502fe35f-6822-45da-9cf0-58bc911a4190	String	jsonType.label
ae2be16c-e331-4c68-a46d-f51e4498cfd3	true	userinfo.token.claim
ae2be16c-e331-4c68-a46d-f51e4498cfd3	nickname	user.attribute
ae2be16c-e331-4c68-a46d-f51e4498cfd3	true	id.token.claim
ae2be16c-e331-4c68-a46d-f51e4498cfd3	true	access.token.claim
ae2be16c-e331-4c68-a46d-f51e4498cfd3	nickname	claim.name
ae2be16c-e331-4c68-a46d-f51e4498cfd3	String	jsonType.label
44792cf6-1701-4ffe-aef1-9a1bbf79418e	true	userinfo.token.claim
44792cf6-1701-4ffe-aef1-9a1bbf79418e	username	user.attribute
44792cf6-1701-4ffe-aef1-9a1bbf79418e	true	id.token.claim
44792cf6-1701-4ffe-aef1-9a1bbf79418e	true	access.token.claim
44792cf6-1701-4ffe-aef1-9a1bbf79418e	preferred_username	claim.name
44792cf6-1701-4ffe-aef1-9a1bbf79418e	String	jsonType.label
27d896f7-f249-4cdf-a055-6c703dfedc41	true	userinfo.token.claim
27d896f7-f249-4cdf-a055-6c703dfedc41	profile	user.attribute
27d896f7-f249-4cdf-a055-6c703dfedc41	true	id.token.claim
27d896f7-f249-4cdf-a055-6c703dfedc41	true	access.token.claim
27d896f7-f249-4cdf-a055-6c703dfedc41	profile	claim.name
27d896f7-f249-4cdf-a055-6c703dfedc41	String	jsonType.label
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	true	userinfo.token.claim
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	picture	user.attribute
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	true	id.token.claim
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	true	access.token.claim
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	picture	claim.name
3b230d30-8c9b-47e2-91c7-a13b58f4ca00	String	jsonType.label
7061945c-04fa-4836-b24d-d503221d57a0	true	userinfo.token.claim
7061945c-04fa-4836-b24d-d503221d57a0	website	user.attribute
7061945c-04fa-4836-b24d-d503221d57a0	true	id.token.claim
7061945c-04fa-4836-b24d-d503221d57a0	true	access.token.claim
7061945c-04fa-4836-b24d-d503221d57a0	website	claim.name
7061945c-04fa-4836-b24d-d503221d57a0	String	jsonType.label
75348755-bd73-459b-a142-8beb308d3ba2	true	userinfo.token.claim
75348755-bd73-459b-a142-8beb308d3ba2	gender	user.attribute
75348755-bd73-459b-a142-8beb308d3ba2	true	id.token.claim
75348755-bd73-459b-a142-8beb308d3ba2	true	access.token.claim
75348755-bd73-459b-a142-8beb308d3ba2	gender	claim.name
75348755-bd73-459b-a142-8beb308d3ba2	String	jsonType.label
cc028e31-5f66-453d-915f-cff7f8ff12c8	true	userinfo.token.claim
cc028e31-5f66-453d-915f-cff7f8ff12c8	birthdate	user.attribute
cc028e31-5f66-453d-915f-cff7f8ff12c8	true	id.token.claim
cc028e31-5f66-453d-915f-cff7f8ff12c8	true	access.token.claim
cc028e31-5f66-453d-915f-cff7f8ff12c8	birthdate	claim.name
cc028e31-5f66-453d-915f-cff7f8ff12c8	String	jsonType.label
d274483b-692b-48bb-a616-235e1336b57f	true	userinfo.token.claim
d274483b-692b-48bb-a616-235e1336b57f	zoneinfo	user.attribute
d274483b-692b-48bb-a616-235e1336b57f	true	id.token.claim
d274483b-692b-48bb-a616-235e1336b57f	true	access.token.claim
d274483b-692b-48bb-a616-235e1336b57f	zoneinfo	claim.name
d274483b-692b-48bb-a616-235e1336b57f	String	jsonType.label
3153a86a-07b2-47db-90e7-46f85c67a6d7	true	userinfo.token.claim
3153a86a-07b2-47db-90e7-46f85c67a6d7	locale	user.attribute
3153a86a-07b2-47db-90e7-46f85c67a6d7	true	id.token.claim
3153a86a-07b2-47db-90e7-46f85c67a6d7	true	access.token.claim
3153a86a-07b2-47db-90e7-46f85c67a6d7	locale	claim.name
3153a86a-07b2-47db-90e7-46f85c67a6d7	String	jsonType.label
cefc00d8-846e-47b4-a19b-7a86bafaee0a	true	userinfo.token.claim
cefc00d8-846e-47b4-a19b-7a86bafaee0a	updatedAt	user.attribute
cefc00d8-846e-47b4-a19b-7a86bafaee0a	true	id.token.claim
cefc00d8-846e-47b4-a19b-7a86bafaee0a	true	access.token.claim
cefc00d8-846e-47b4-a19b-7a86bafaee0a	updated_at	claim.name
cefc00d8-846e-47b4-a19b-7a86bafaee0a	String	jsonType.label
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	true	userinfo.token.claim
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	email	user.attribute
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	true	id.token.claim
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	true	access.token.claim
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	email	claim.name
3f44f29a-f18d-4b94-91e7-41f0a4f5f9b7	String	jsonType.label
6ded11c3-d525-487c-8468-1c59a4aa1522	true	userinfo.token.claim
6ded11c3-d525-487c-8468-1c59a4aa1522	emailVerified	user.attribute
6ded11c3-d525-487c-8468-1c59a4aa1522	true	id.token.claim
6ded11c3-d525-487c-8468-1c59a4aa1522	true	access.token.claim
6ded11c3-d525-487c-8468-1c59a4aa1522	email_verified	claim.name
6ded11c3-d525-487c-8468-1c59a4aa1522	boolean	jsonType.label
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	formatted	user.attribute.formatted
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	country	user.attribute.country
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	postal_code	user.attribute.postal_code
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	true	userinfo.token.claim
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	street	user.attribute.street
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	true	id.token.claim
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	region	user.attribute.region
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	true	access.token.claim
f4417647-7f45-40e7-b3ff-a19b8aca5ad2	locality	user.attribute.locality
18ec9767-a54b-46a4-abba-7605b9f82502	true	userinfo.token.claim
18ec9767-a54b-46a4-abba-7605b9f82502	phoneNumber	user.attribute
18ec9767-a54b-46a4-abba-7605b9f82502	true	id.token.claim
18ec9767-a54b-46a4-abba-7605b9f82502	true	access.token.claim
18ec9767-a54b-46a4-abba-7605b9f82502	phone_number	claim.name
18ec9767-a54b-46a4-abba-7605b9f82502	String	jsonType.label
acfbb60e-39ef-459c-a069-764187783baa	true	userinfo.token.claim
acfbb60e-39ef-459c-a069-764187783baa	phoneNumberVerified	user.attribute
acfbb60e-39ef-459c-a069-764187783baa	true	id.token.claim
acfbb60e-39ef-459c-a069-764187783baa	true	access.token.claim
acfbb60e-39ef-459c-a069-764187783baa	phone_number_verified	claim.name
acfbb60e-39ef-459c-a069-764187783baa	boolean	jsonType.label
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	true	userinfo.token.claim
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	locale	user.attribute
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	true	id.token.claim
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	true	access.token.claim
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	locale	claim.name
26eac461-d4f8-49ec-b3c8-d7e2b02050f4	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	8c237fe9-e6e2-4613-80c8-8d073b7c854f	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	d2ce947a-e6cc-45d1-b49e-862b2faaee25	1b72a2a9-461c-45cd-93d8-4e0f210cb6f5	0e98f71b-fdc6-4534-9d57-efa48d43df5e	5578dfae-95ea-44ca-ae8f-f88c7abac744	7988ecba-7e4d-409f-ae3b-5f5d163f959d	2592000	f	900	t	f	c3213258-599c-4a3e-bd33-6557fbb40379	0	f
StaticLoginConnect	60	300	300	\N	\N	\N	t	f	0	\N	StaticLoginConnect	0	\N	t	f	f	f	NONE	1800	36000	f	f	abc9fa09-72e4-4441-885a-3e26e5279410	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	117937d8-3b00-414c-b9c6-fb877dec8385	517f2c22-504f-49c4-8647-98fb02e699cb	d08f3786-8c44-48ee-b972-97227f5871fb	a6154408-458e-4590-a9d9-9cb7c2f16ddc	ce7ecd3a-551f-4aab-8f3c-fe4e301ff548	2592000	f	900	t	f	bd76a2dd-8524-453d-91e8-8a74ad4af069	0	f
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		StaticLoginConnect
_browser_header.xContentTypeOptions	nosniff	StaticLoginConnect
_browser_header.xRobotsTag	none	StaticLoginConnect
_browser_header.xFrameOptions	SAMEORIGIN	StaticLoginConnect
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	StaticLoginConnect
_browser_header.xXSSProtection	1; mode=block	StaticLoginConnect
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	StaticLoginConnect
bruteForceProtected	false	StaticLoginConnect
permanentLockout	false	StaticLoginConnect
maxFailureWaitSeconds	900	StaticLoginConnect
minimumQuickLoginWaitSeconds	60	StaticLoginConnect
waitIncrementSeconds	60	StaticLoginConnect
quickLoginCheckMilliSeconds	1000	StaticLoginConnect
maxDeltaTimeSeconds	43200	StaticLoginConnect
failureFactor	30	StaticLoginConnect
offlineSessionMaxLifespanEnabled	false	StaticLoginConnect
offlineSessionMaxLifespan	5184000	StaticLoginConnect
actionTokenGeneratedByAdminLifespan	43200	StaticLoginConnect
actionTokenGeneratedByUserLifespan	300	StaticLoginConnect
displayName	Kheops	StaticLoginConnect
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
StaticLoginConnect	43a5b241-b021-4045-ad94-49eb95b0ec34
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	60df2967-fd62-486e-bf6b-3ac5985b46fa
master	7d8805ba-7e10-4aaa-a414-8ec410dcda9b
StaticLoginConnect	db1800f8-bd9f-4985-8d69-2119aff08d8c
StaticLoginConnect	10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
StaticLoginConnect	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	StaticLoginConnect
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
6fc2887c-89c7-4d58-a968-bce74b2278db	/auth/realms/master/account/*
d8bb2fbd-ce5f-469e-aa44-7fee2b677311	/auth/admin/master/console/*
95c5cc68-9c75-476b-acba-d9caa6f556b7	/auth/realms/StaticLoginConnect/account/*
cef97d83-ab67-49b9-9a85-9b2f8097e338	/auth/admin/StaticLoginConnect/console/*
d22b5708-970b-48f3-b7b2-45e5f023de7d	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
79b8447b-7f4b-498f-a03f-90dd648b73fd	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
d32575be-f2f0-463a-a86b-78ae5fa898a3	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
5471667c-e043-4572-aaef-22fae8f8404c	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
df4a3b8b-27b9-436d-84e9-5568ca59b6a3	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
bba2e3c9-0ae6-4c08-afc4-0b9954ec11ee	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
2367edcd-5e65-4f21-a8ed-0c7566a9d233	VERIFY_EMAIL	Verify Email	StaticLoginConnect	t	f	VERIFY_EMAIL	50
2e185651-b672-4e5b-be6f-4a53fd1f78bf	UPDATE_PROFILE	Update Profile	StaticLoginConnect	t	f	UPDATE_PROFILE	40
23e7be79-9895-4ffa-a9e8-61701bcb262b	CONFIGURE_TOTP	Configure OTP	StaticLoginConnect	t	f	CONFIGURE_TOTP	10
0f70c243-49c0-478d-a690-46915fc45a6e	UPDATE_PASSWORD	Update Password	StaticLoginConnect	t	f	UPDATE_PASSWORD	30
96fffb12-5afe-49ab-90ba-eeea19f894bb	terms_and_conditions	Terms and Conditions	StaticLoginConnect	f	f	terms_and_conditions	20
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode) FROM stdin;
68e55df7-429b-4da2-bd2f-a6a700613367	f	0
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
bceccedc-1762-4d49-930a-386bc5054aeb	map-role	\N	68e55df7-429b-4da2-bd2f-a6a700613367	\N
df0108f9-cd49-4183-9a89-23adf622cf62	map-role-client-scope	\N	68e55df7-429b-4da2-bd2f-a6a700613367	\N
9e2d8bc7-26af-4c42-b062-9e662627156e	map-role-composite	\N	68e55df7-429b-4da2-bd2f-a6a700613367	\N
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
11189182-98cf-4017-aa64-fde1b18a606d	33115a85-d17c-4316-b881-48f919810a00
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
82037fde-fefe-470c-a6f2-9ce605ba963d	\N	4c712cb1-916b-4a04-a83e-7a9ba0817845	f	t	\N	\N	\N	master	keycloak_admin	1547478006301	\N	0
58297bc2-4b4d-4802-998f-6eaa605bc8bf	\N	1d4a6ae3-5e09-4233-a05d-074022abc86a	f	t	\N	\N	\N	StaticLoginConnect	kheopsauthorization	1547478256376	\N	0
17b8864d-d8dd-4c7d-8857-2b072a9e286a	toto@gmail.com	toto@gmail.com	f	t	\N	\N	\N	StaticLoginConnect	toto	1547478376612	\N	0
7cd7395d-47c2-4739-835b-bcc75fa772df	tata@gmail.com	tata@gmail.com	f	t	\N	\N	\N	StaticLoginConnect	tata	1547478395657	\N	0
837892df-3b68-4d9c-9615-269d408f2693	titi@gmail.com	titi@gmail.com	f	t	\N	\N	\N	StaticLoginConnect	titi	1547478408196	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
625e921a-814f-4a9c-a4bf-36168f706f9d	58297bc2-4b4d-4802-998f-6eaa605bc8bf
43a5b241-b021-4045-ad94-49eb95b0ec34	17b8864d-d8dd-4c7d-8857-2b072a9e286a
43a5b241-b021-4045-ad94-49eb95b0ec34	7cd7395d-47c2-4739-835b-bcc75fa772df
43a5b241-b021-4045-ad94-49eb95b0ec34	837892df-3b68-4d9c-9615-269d408f2693
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
7d8805ba-7e10-4aaa-a414-8ec410dcda9b	82037fde-fefe-470c-a6f2-9ce605ba963d
b7ba33d5-86f5-4594-9a7e-645c26c2910d	82037fde-fefe-470c-a6f2-9ce605ba963d
60df2967-fd62-486e-bf6b-3ac5985b46fa	82037fde-fefe-470c-a6f2-9ce605ba963d
7e1a7438-c5cd-45ea-896b-15b89d0778cf	82037fde-fefe-470c-a6f2-9ce605ba963d
09a11383-bf20-49c2-ba89-0d3eb0066ba5	82037fde-fefe-470c-a6f2-9ce605ba963d
3a521fc3-dc09-4de0-b1cf-29394da726cc	58297bc2-4b4d-4802-998f-6eaa605bc8bf
db1800f8-bd9f-4985-8d69-2119aff08d8c	58297bc2-4b4d-4802-998f-6eaa605bc8bf
10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a	58297bc2-4b4d-4802-998f-6eaa605bc8bf
c16a0346-47d6-40b3-b42a-4166e2f2a840	58297bc2-4b4d-4802-998f-6eaa605bc8bf
3a521fc3-dc09-4de0-b1cf-29394da726cc	17b8864d-d8dd-4c7d-8857-2b072a9e286a
db1800f8-bd9f-4985-8d69-2119aff08d8c	17b8864d-d8dd-4c7d-8857-2b072a9e286a
10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a	17b8864d-d8dd-4c7d-8857-2b072a9e286a
c16a0346-47d6-40b3-b42a-4166e2f2a840	17b8864d-d8dd-4c7d-8857-2b072a9e286a
3a521fc3-dc09-4de0-b1cf-29394da726cc	7cd7395d-47c2-4739-835b-bcc75fa772df
db1800f8-bd9f-4985-8d69-2119aff08d8c	7cd7395d-47c2-4739-835b-bcc75fa772df
10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a	7cd7395d-47c2-4739-835b-bcc75fa772df
c16a0346-47d6-40b3-b42a-4166e2f2a840	7cd7395d-47c2-4739-835b-bcc75fa772df
3a521fc3-dc09-4de0-b1cf-29394da726cc	837892df-3b68-4d9c-9615-269d408f2693
db1800f8-bd9f-4985-8d69-2119aff08d8c	837892df-3b68-4d9c-9615-269d408f2693
10f94c33-d9c4-4e56-aa5f-8e2c087c4d0a	837892df-3b68-4d9c-9615-269d408f2693
c16a0346-47d6-40b3-b42a-4166e2f2a840	837892df-3b68-4d9c-9615-269d408f2693
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
d22b5708-970b-48f3-b7b2-45e5f023de7d	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: credential_attribute constraint_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT constraint_credential_attr PRIMARY KEY (id);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: fed_credential_attribute constraint_fed_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT constraint_fed_credential_attr PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_credential_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_credential_attr_cred ON public.credential_attribute USING btree (credential_id);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_fed_cred_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fed_cred_attr_cred ON public.fed_credential_attribute USING btree (credential_id);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: credential_attribute fk_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT fk_cred_attr FOREIGN KEY (credential_id) REFERENCES public.credential(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: fed_credential_attribute fk_fed_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT fk_fed_cred_attr FOREIGN KEY (credential_id) REFERENCES public.fed_user_credential(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: keycloak_role fk_kjho5le2c0ral09fl8cm9wfw9; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_kjho5le2c0ral09fl8cm9wfw9 FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: realm fk_traf444kk6qrkms7n56aiwq5y; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT fk_traf444kk6qrkms7n56aiwq5y FOREIGN KEY (master_admin_client) REFERENCES public.client(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

