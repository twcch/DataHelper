CREATE TABLE user_master
(
    user_id            INT PRIMARY KEY AUTO_INCREMENT,
    username           VARCHAR(255) NOT NULL UNIQUE,
    password           VARCHAR(255) NOT NULL,
    first_name         VARCHAR(50),
    last_name          VARCHAR(50),
    nickname           VARCHAR(50),
    tax_id             VARCHAR(50) UNIQUE,
    gender             ENUM ('M', 'F'),
    user_group         VARCHAR(50),
    phone_number       VARCHAR(50),
    country            VARCHAR(50),
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL
);

CREATE TABLE user_payment_credit
(
    user_payment_credit_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id                INT          NOT NULL,
    credit_card_id         VARCHAR(255) NOT NULL,
    expiry_date            TIMESTAMP    NOT NULL,
    action                 ENUM ('X'),
    change_id              INT          NOT NULL,
    created_date           TIMESTAMP    NOT NULL,
    last_modified_date     TIMESTAMP    NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_master (user_id)
);

CREATE TABLE user_favorites
(
    user_favorites_id  INT PRIMARY KEY AUTO_INCREMENT,
    user_id            INT       NOT NULL,
    product_id         INT       NOT NULL,
    action             ENUM ('X'),
    change_id          INT       NOT NULL,
    created_date       TIMESTAMP NOT NULL,
    last_modified_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_master (user_id),
    FOREIGN KEY (product_id) REFERENCES product_master (product_id)
);

CREATE TABLE company_master
(
    company_id         INT PRIMARY KEY AUTO_INCREMENT,
    username           VARCHAR(255)   NOT NULL UNIQUE,
    password           VARCHAR(255)   NOT NULL,
    company_name       VARCHAR(255)   NOT NULL,
    vat_number         VARCHAR(50)    NOT NULL UNIQUE,
    address            VARCHAR(255)   NOT NULL,
    telephone          VARCHAR(50)    NOT NULL,
    score              FLOAT UNSIGNED NOT NULL,
    action             ENUM ('X'),
    change_id          INT            NOT NULL,
    created_date       TIMESTAMP      NOT NULL,
    last_modified_date TIMESTAMP      NOT NULL
);

CREATE TABLE company_reviews
(
    company_reviews_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id         INT          NOT NULL,
    user_id            INT          NOT NULL,
    star_rank          INT UNSIGNED NOT NULL,
    comment            VARCHAR(255),
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company_master (company_id),
    FOREIGN KEY (user_id) REFERENCES user_master (user_id)
);

CREATE TABLE admin_master
(
    admin_id           INT PRIMARY KEY AUTO_INCREMENT,
    username           VARCHAR(255) NOT NULL UNIQUE,
    password           VARCHAR(255) NOT NULL,
    admin_group        VARCHAR(50),
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL
);

CREATE TABLE product_master
(
    product_id         INT PRIMARY KEY AUTO_INCREMENT,
    product_name       VARCHAR(255) NOT NULL,
    category           VARCHAR(50)  NOT NULL,
    price              INT UNSIGNED NOT NULL,
    stock   INT UNSIGNED NOT NULL,
    description        VARCHAR(255),
    company_id         INT          NOT NULL,
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company_master (company_id),
    FOREIGN KEY (category) REFERENCES product_category (category_name)
);

CREATE TABLE product_discount
(
    product_discount_id INT PRIMARY KEY AUTO_INCREMENT,
    discount_title      VARCHAR(50)    NOT NULL,
    discount_rate       FLOAT UNSIGNED NOT NULL,
    start_date_time     TIMESTAMP      NOT NULL,
    end_date_time       TIMESTAMP      NOT NULL,
    company_id          INT            NOT NULL,
    action              ENUM ('X'),
    change_id           INT            NOT NULL,
    created_date        TIMESTAMP      NOT NULL,
    last_modified_date  TIMESTAMP      NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company_master (company_id)
);

CREATE TABLE product_category
(
    product_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name       VARCHAR(50)  NOT NULL,
    count               INT UNSIGNED NOT NULL,
    number_limit INT UNSIGNED NOT NULL,
    company_id          INT          NOT NULL,
    action              ENUM ('X'),
    change_id           INT          NOT NULL,
    created_date        TIMESTAMP    NOT NULL,
    last_modified_date  TIMESTAMP    NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company_master (company_id)
);

CREATE TABLE order_master
(
    order_id           INT PRIMARY KEY AUTO_INCREMENT,
    status             VARCHAR(50)  NOT NULL,
    full_price         INT UNSIGNED NOT NULL,
    discount           INT UNSIGNED NOT NULL,
    tax                INT UNSIGNED NOT NULL,
    service_fee        INT UNSIGNED NOT NULL,
    actual_price       INT UNSIGNED NOT NULL,
    actual_living      VARCHAR(50)  NOT NULL,
    user_id            INT          NOT NULL,
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_master (user_id)
);

CREATE TABLE order_item
(
    order_item_id      INT PRIMARY KEY AUTO_INCREMENT,
    order_id           INT          NOT NULL,
    product_id         INT          NOT NULL,
    price              INT UNSIGNED NOT NULL,
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_master (order_id),
    FOREIGN KEY (product_id) REFERENCES product_master (product_id)
);

CREATE TABLE chat_room
(
    chat_room_id       INT PRIMARY KEY AUTO_INCREMENT,
    chat_room_name     VARCHAR(255) NOT NULL,
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL
);

CREATE TABLE chat_message
(
    chat_message_id    INT PRIMARY KEY AUTO_INCREMENT,
    user_id            INT          NOT NULL,
    chat_room_id       INT          NOT NULL,
    message_text       VARCHAR(255) NOT NULL,
    send_time          TIMESTAMP    NOT NULL,
    action             ENUM ('X'),
    change_id          INT          NOT NULL,
    created_date       TIMESTAMP    NOT NULL,
    last_modified_date TIMESTAMP    NOT NULL,
    FOREIGN KEY (chat_room_id) REFERENCES chat_room (chat_room_id),
    FOREIGN KEY (user_id) REFERENCES user_master (user_id)
);

