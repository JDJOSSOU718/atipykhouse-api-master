PGDMP          7    	            {            atipikhouse    12.4    12.4 +    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    16393    atipikhouse    DATABASE     �   CREATE DATABASE atipikhouse WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE atipikhouse;
                postgres    false                        3079    16394 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            M           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16575    booking    TABLE     k  CREATE TABLE public.booking (
    id integer NOT NULL,
    price numeric,
    start_date integer NOT NULL,
    end_date integer NOT NULL,
    reserved_by uuid NOT NULL,
    house integer NOT NULL,
    reserved_names character varying(255),
    billing_details json,
    created_at integer,
    status character varying(25) DEFAULT 'pending'::character varying
);
    DROP TABLE public.booking;
       public         heap    postgres    false            �            1259    16573    booking_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."booking_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."booking_ID_seq";
       public          postgres    false    209            N           0    0    booking_ID_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."booking_ID_seq" OWNED BY public.booking.id;
          public          postgres    false    208            �            1259    16553    comments    TABLE     
  CREATE TABLE public.comments (
    id integer NOT NULL,
    content text,
    created_date integer,
    created_by uuid NOT NULL,
    status character varying(25) DEFAULT 'pending'::character varying NOT NULL,
    stars_number integer,
    house integer NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16551    comments_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."comments_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."comments_ID_seq";
       public          postgres    false    207            O           0    0    comments_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."comments_ID_seq" OWNED BY public.comments.id;
          public          postgres    false    206            �            1259    16531    houses    TABLE     �  CREATE TABLE public.houses (
    id integer NOT NULL,
    title character varying(255),
    description text,
    status character varying(25) DEFAULT 'pending'::character varying NOT NULL,
    type character varying(255),
    nbr_couchage integer,
    capacity character varying(255),
    price numeric,
    photos json,
    created_by uuid NOT NULL,
    created_date integer,
    updated_by uuid,
    updated_date integer,
    off_days integer[],
    location character varying(255),
    notify boolean
);
    DROP TABLE public.houses;
       public         heap    postgres    false            �            1259    16529    houses_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."houses_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."houses_ID_seq";
       public          postgres    false    205            P           0    0    houses_ID_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."houses_ID_seq" OWNED BY public.houses.id;
          public          postgres    false    204            �            1259    16593    pages    TABLE     k   CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying(255),
    content json
);
    DROP TABLE public.pages;
       public         heap    postgres    false            �            1259    16591    page_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."page_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."page_ID_seq";
       public          postgres    false    211            Q           0    0    page_ID_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public."page_ID_seq" OWNED BY public.pages.id;
          public          postgres    false    210            �            1259    16510    users    TABLE     �  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    last_name character varying(150),
    first_name character varying(255),
    email character varying(255),
    address character varying(255),
    phone character varying(25),
    social_link json,
    grade character varying(25) DEFAULT 'customer'::bpchar NOT NULL,
    is_online boolean DEFAULT false NOT NULL,
    created_date integer,
    updated_date integer,
    password character varying(255),
    confirmation_token character varying(255),
    login_session_token character varying(255),
    last_login integer,
    login_history json,
    city character varying(255),
    country character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            �
           2604    16578 
   booking id    DEFAULT     j   ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public."booking_ID_seq"'::regclass);
 9   ALTER TABLE public.booking ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �
           2604    16556    comments id    DEFAULT     l   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public."comments_ID_seq"'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    16534 	   houses id    DEFAULT     h   ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public."houses_ID_seq"'::regclass);
 8   ALTER TABLE public.houses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    16596    pages id    DEFAULT     e   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public."page_ID_seq"'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            D          0    16575    booking 
   TABLE DATA           �   COPY public.booking (id, price, start_date, end_date, reserved_by, house, reserved_names, billing_details, created_at, status) FROM stdin;
    public          postgres    false    209   h3       B          0    16553    comments 
   TABLE DATA           f   COPY public.comments (id, content, created_date, created_by, status, stars_number, house) FROM stdin;
    public          postgres    false    207   �3       @          0    16531    houses 
   TABLE DATA           �   COPY public.houses (id, title, description, status, type, nbr_couchage, capacity, price, photos, created_by, created_date, updated_by, updated_date, off_days, location, notify) FROM stdin;
    public          postgres    false    205   �3       F          0    16593    pages 
   TABLE DATA           3   COPY public.pages (id, title, content) FROM stdin;
    public          postgres    false    211   �3       >          0    16510    users 
   TABLE DATA           �   COPY public.users (id, last_name, first_name, email, address, phone, social_link, grade, is_online, created_date, updated_date, password, confirmation_token, login_session_token, last_login, login_history, city, country) FROM stdin;
    public          postgres    false    203   �3       R           0    0    booking_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."booking_ID_seq"', 40, true);
          public          postgres    false    208            S           0    0    comments_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."comments_ID_seq"', 5, true);
          public          postgres    false    206            T           0    0    houses_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."houses_ID_seq"', 7, true);
          public          postgres    false    204            U           0    0    page_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."page_ID_seq"', 1, true);
          public          postgres    false    210            �
           2606    16580    booking booking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    209            �
           2606    16562    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    207            �
           2606    16603    users email_uniq 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_uniq UNIQUE (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT email_uniq;
       public            postgres    false    203            �
           2606    16540    houses houses_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.houses DROP CONSTRAINT houses_pkey;
       public            postgres    false    205            �
           2606    16601    pages page_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.pages DROP CONSTRAINT page_pkey;
       public            postgres    false    211            �
           2606    16519    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �
           2606    16546    houses created_by    FK CONSTRAINT     }   ALTER TABLE ONLY public.houses
    ADD CONSTRAINT created_by FOREIGN KEY (created_by) REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.houses DROP CONSTRAINT created_by;
       public          postgres    false    203    205    2738            �
           2606    16563    comments created_by    FK CONSTRAINT     u   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT created_by FOREIGN KEY (created_by) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT created_by;
       public          postgres    false    203    2738    207            �
           2606    16568    comments house_id    FK CONSTRAINT     o   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT house_id FOREIGN KEY (house) REFERENCES public.houses(id);
 ;   ALTER TABLE ONLY public.comments DROP CONSTRAINT house_id;
       public          postgres    false    205    207    2740            �
           2606    16586    booking house_id    FK CONSTRAINT     n   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT house_id FOREIGN KEY (house) REFERENCES public.houses(id);
 :   ALTER TABLE ONLY public.booking DROP CONSTRAINT house_id;
       public          postgres    false    205    2740    209            �
           2606    16581    booking reserved_by    FK CONSTRAINT     v   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT reserved_by FOREIGN KEY (reserved_by) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.booking DROP CONSTRAINT reserved_by;
       public          postgres    false    2738    203    209            D      x������ � �      B      x������ � �      @      x������ � �      F      x�3����M������� �I      >   �  x�uVio�H����Y4�6&}T_+�4!�	�HB�_|����	�d�h��V�J����'��_�z]e+�Q�0~C�	��F[_G$I�XP
�[�-��+�P�M��^��4�_�,��Oil7q��A֍��6�7��z�0f�����ޏ���IB7�sء����!C�w�O/��~+��
�JA�!�
��QR�3?S����Xq�U�W������iw���ߔx���ׇ��[�ܻ�[����j�F�l9���p���kp?ɢ��i�22��͘)<�����>��RϷ��� 8)d���41T�!9(#��!�PR��!Du؁R\�sz�5��,�!ՇUA͸s��%d���5t�H@���O���D�*��A҇�1?���F&�0fT�y�����Yi�ׅͲ��k��b�s�B2θޏ�^���\%e����p�i��o���p�����P���x��fõ9ޜo	�.'���w;�+:�L���oq�W���xu�^���[� Ar��?ni4����F�zv#cJĒ�b�|�y�kH_²��(N/�W麾�ݓloė����W��'�q����|+����+M�p��M6ٽ,�2|����yW�F]��\����F��t���R-O���+}YE���D#�+�NР[�ˌi�8o�Pi�֪q`	�l��b�P�Ɓ%Ժq����ց%f8��w,�g�%�eƹ@*��Ɓ q�r
����	�=W-.n�[�Kc�K�#� ��(e�E�j~��r�߱�p�X\��K�t�-��d�+�\��P��y���?����9m�ȗ�Sq��\�k~���z5?�8Wȇ�Un=�`!������+~���Cŏ
�C�Aŏ*� �}`u�b�(W�x��W� ڣ���? ���?hT��S5���>P�ɰB:\�E�q���)��sQ��8狺4�s�+~�4�܊��`�����	�N�+*~Jp\��W�������+��������_sl�R�����W��>�0����0ֱ��"ޠ���7����5���g����ѧ(/�u���J��C-32�d},B�o�;�S����2�����������b{}t򔯞g�/���f����.�b���<4�sFA�(�ʄ�w�Y(BS�S"����eE��Q�<k�dE7��<�Kx{|��ϟ��$�����ڤ�3��?\�e��!�gl8����m7ʢ�4��������t<c���xt9���=��W��U�����^�\sbW���i��K�*�6U��ȏ�1��El<2�)Xk�HYN���䛲�~Ta���v�>��v��z�}p?��DM�X�?��>ɮ���7џNnt�C=�u�.O���0��`~=Y�M�N�����a�;��"����s��Z_��Iop�K8-��N��n�����n:�������Ai��R��O�П݃��� �R     