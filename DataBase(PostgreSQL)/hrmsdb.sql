-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.cities
(
    id smallint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    city_name character varying(16) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.curriculum_vitaes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    about_description character varying(200),
    PRIMARY KEY (id)
);

CREATE TABLE public.email_verifications
(
    id integer NOT NULL,
    confirm boolean NOT NULL,
    confirm_date character varying(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employees
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    web_site character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_experinces
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    workplace_name character varying(60) NOT NULL,
    position_name character varying(50),
    start_date date NOT NULL,
    end_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    position_name character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_postings
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    job_position_id integer NOT NULL,
    city_id smallint NOT NULL,
    open_position integer NOT NULL,
    job_description character varying(500) NOT NULL,
    status boolean NOT NULL,
    min_salary integer,
    max_salary integer,
    application_deadline date NOT NULL,
    job_position integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seeker_images
(
    id integer NOT NULL,
    image_path character varying(300) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seeker_languages
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    language_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seeker_programming_languages
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    programming_language_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seeker_schools
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    school_id integer NOT NULL,
    department character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seeker_social_accounts
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_id integer NOT NULL,
    social_account_id integer NOT NULL,
    account_url character varying(80),
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seekers
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    nationality_id character(11) NOT NULL,
    birthday_date integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.languages
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    language_name character varying(30),
    PRIMARY KEY (id)
);

CREATE TABLE public.phone_numbers
(
    id integer NOT NULL,
    phone_number character(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.programming_languages
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    programming_language_name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.schools
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_name character varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE public.social_medias
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    social_media_name character varying(60) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.system_verifications
(
    id integer NOT NULL,
    system_person_id integer,
    confirm boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(50) NOT NULL,
    password character varying(20),
    PRIMARY KEY (id)
);

ALTER TABLE public.curriculum_vitaes
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.email_verifications
    ADD FOREIGN KEY (id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.email_verifications
    ADD FOREIGN KEY (id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_experinces
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (job_position)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (city_id)
    REFERENCES public.cities (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.job_seeker_images
    ADD FOREIGN KEY (id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_seeker_languages
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_seeker_languages
    ADD FOREIGN KEY (language_id)
    REFERENCES public.languages (id)
    NOT VALID;


ALTER TABLE public.job_seeker_programming_languages
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_seeker_programming_languages
    ADD FOREIGN KEY (programming_language_id)
    REFERENCES public.programming_languages (id)
    NOT VALID;


ALTER TABLE public.job_seeker_schools
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_seeker_schools
    ADD FOREIGN KEY (school_id)
    REFERENCES public.schools (id)
    NOT VALID;


ALTER TABLE public.job_seeker_social_accounts
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.job_seeker_social_accounts
    ADD FOREIGN KEY (social_account_id)
    REFERENCES public.social_medias (id)
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.phone_numbers
    ADD FOREIGN KEY (id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.system_verifications
    ADD FOREIGN KEY (id)
    REFERENCES public.employers (id)
    NOT VALID;

END;