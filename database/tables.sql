CREATE TABLE users
(
    user_id  SERIAL PRIMARY KEY,
    name     VARCHAR(250) NOT NULL,
    email    VARCHAR(250) NOT NULL,
    password VARCHAR(250) NOT NULL,
    is_valid BOOLEAN DEFAULT true
);

CREATE TABLE authors
(
    author_id SERIAL PRIMARY KEY,
    name      VARCHAR(200)
);

CREATE TABLE books
(
    book_id          SERIAL PRIMARY KEY,
    author_id        INTEGER NOT NULL,
    name             VARCHAR(200),
    isbn             VARCHAR(50),
    publication_date DATE
);

CREATE TABLE loans
(
    loan_id     SERIAL PRIMARY KEY,
    book_id     INTEGER   NOT NULL,
    user_id     INTEGER   NOT NULL,
    loan_date   TIMESTAMP NOT NULL DEFAULT now(),
    due_date    TIMESTAMP NOT NULL,
    return_date TIMESTAMP,
    status      VARCHAR(1),
    notes       TEXT
);

ALTER TABLE books
    ADD CONSTRAINT books_author_id_fk
        FOREIGN KEY (author_id) REFERENCES authors (author_id);

ALTER TABLE loans
    ADD CONSTRAINT loans_book_id_fk
        FOREIGN KEY (book_id) REFERENCES loans (book_id);

ALTER TABLE loans
    ADD CONSTRAINT loans_user_id_fk
        FOREIGN KEY (user_id) REFERENCES users (user_id);
