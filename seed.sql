-- =============================================
-- SALES ANALYSIS DATABASE — SEED DATA
-- Schema + 500 rows of realistic e-commerce data
-- =============================================

-- SCHEMA
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    city VARCHAR(80) NOT NULL,
    region VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    cost NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(id),
    seller_id INT NOT NULL REFERENCES sellers(id),
    order_date DATE NOT NULL,
    total_amount NUMERIC(12,2) NOT NULL DEFAULT 0
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id),
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

-- SELLERS (8)
INSERT INTO sellers (name, region, hire_date) VALUES
('Ana Costa', 'Sudeste', '2023-02-15'),
('Bruno Lima', 'Nordeste', '2023-06-01'),
('Carla Souza', 'Sul', '2022-11-10'),
('Daniel Rocha', 'Sudeste', '2024-01-20'),
('Elena Santos', 'Norte', '2023-09-05'),
('Felipe Alves', 'Centro-Oeste', '2024-03-12'),
('Gabriela Dias', 'Sudeste', '2022-08-01'),
('Hugo Martins', 'Nordeste', '2024-07-15');

-- PRODUCTS (20)
INSERT INTO products (name, category, price, cost) VALUES
('Notebook Pro 15', 'Eletrônicos', 4599.90, 3200.00),
('Mouse Wireless Ergo', 'Periféricos', 189.90, 65.00),
('Teclado Mecânico RGB', 'Periféricos', 349.90, 120.00),
('Monitor 27" 4K', 'Eletrônicos', 2899.90, 1950.00),
('Webcam HD 1080p', 'Periféricos', 279.90, 95.00),
('Headset Gamer Pro', 'Áudio', 459.90, 180.00),
('Caixa de Som BT', 'Áudio', 199.90, 75.00),
('Hub USB-C 7 portas', 'Acessórios', 159.90, 55.00),
('SSD 1TB NVMe', 'Armazenamento', 549.90, 320.00),
('HD Externo 2TB', 'Armazenamento', 399.90, 250.00),
('Cadeira Ergonômica', 'Mobiliário', 1899.90, 950.00),
('Mesa Standing Desk', 'Mobiliário', 2499.90, 1400.00),
('Mousepad XL', 'Acessórios', 89.90, 25.00),
('Suporte Notebook', 'Acessórios', 129.90, 40.00),
('Cabo HDMI 2m', 'Acessórios', 49.90, 12.00),
('Carregador USB-C 65W', 'Acessórios', 179.90, 60.00),
('Fone TWS Bluetooth', 'Áudio', 299.90, 110.00),
('Tablet 10" 128GB', 'Eletrônicos', 1999.90, 1200.00),
('Ring Light 26cm', 'Acessórios', 149.90, 45.00),
('Mochila Notebook 17"', 'Acessórios', 219.90, 80.00);

-- CUSTOMERS (50)
INSERT INTO customers (name, email, city, region, signup_date) VALUES
('Mariana Silva', 'mariana.silva@email.com', 'São Paulo', 'Sudeste', '2024-01-15'),
('João Pedro Oliveira', 'joaop@email.com', 'Rio de Janeiro', 'Sudeste', '2024-01-22'),
('Camila Ferreira', 'camila.f@email.com', 'Belo Horizonte', 'Sudeste', '2024-02-03'),
('Lucas Almeida', 'lucas.almeida@email.com', 'Curitiba', 'Sul', '2024-02-10'),
('Beatriz Santos', 'bea.santos@email.com', 'Salvador', 'Nordeste', '2024-02-18'),
('Rafael Costa', 'rafael.c@email.com', 'Brasília', 'Centro-Oeste', '2024-03-01'),
('Isabela Lima', 'isabela.l@email.com', 'Porto Alegre', 'Sul', '2024-03-05'),
('Thiago Souza', 'thiago.s@email.com', 'Recife', 'Nordeste', '2024-03-12'),
('Amanda Rocha', 'amanda.r@email.com', 'Florianópolis', 'Sul', '2024-03-20'),
('Pedro Henrique', 'pedroh@email.com', 'Manaus', 'Norte', '2024-04-01'),
('Larissa Dias', 'larissa.d@email.com', 'Goiânia', 'Centro-Oeste', '2024-04-08'),
('Gabriel Martins', 'gabriel.m@email.com', 'Fortaleza', 'Nordeste', '2024-04-15'),
('Fernanda Alves', 'fernanda.a@email.com', 'Campinas', 'Sudeste', '2024-04-22'),
('Matheus Ribeiro', 'matheus.r@email.com', 'Belém', 'Norte', '2024-05-01'),
('Juliana Castro', 'juliana.c@email.com', 'São Paulo', 'Sudeste', '2024-05-05'),
('Diego Pereira', 'diego.p@email.com', 'Curitiba', 'Sul', '2024-05-10'),
('Carolina Moura', 'carolina.m@email.com', 'Rio de Janeiro', 'Sudeste', '2024-05-18'),
('André Vieira', 'andre.v@email.com', 'Natal', 'Nordeste', '2024-06-01'),
('Patrícia Nunes', 'patricia.n@email.com', 'Belo Horizonte', 'Sudeste', '2024-06-08'),
('Rodrigo Barbosa', 'rodrigo.b@email.com', 'Campo Grande', 'Centro-Oeste', '2024-06-15'),
('Aline Cardoso', 'aline.c@email.com', 'São Paulo', 'Sudeste', '2024-06-22'),
('Bruno Teixeira', 'bruno.t@email.com', 'Porto Velho', 'Norte', '2024-07-01'),
('Vanessa Lopes', 'vanessa.l@email.com', 'Vitória', 'Sudeste', '2024-07-05'),
('Marcos Araújo', 'marcos.a@email.com', 'Salvador', 'Nordeste', '2024-07-12'),
('Renata Campos', 'renata.c@email.com', 'Florianópolis', 'Sul', '2024-07-20'),
('Felipe Mendes', 'felipe.m@email.com', 'São Paulo', 'Sudeste', '2024-08-01'),
('Tatiana Reis', 'tatiana.r@email.com', 'Cuiabá', 'Centro-Oeste', '2024-08-08'),
('Vinícius Matos', 'vinicius.m@email.com', 'Recife', 'Nordeste', '2024-08-15'),
('Priscila Gomes', 'priscila.g@email.com', 'Joinville', 'Sul', '2024-08-22'),
('Eduardo Freitas', 'eduardo.f@email.com', 'São Paulo', 'Sudeste', '2024-09-01'),
('Natália Correia', 'natalia.c@email.com', 'Rio de Janeiro', 'Sudeste', '2024-09-05'),
('Gustavo Pinto', 'gustavo.p@email.com', 'Teresina', 'Nordeste', '2024-09-12'),
('Daniela Monteiro', 'daniela.m@email.com', 'Porto Alegre', 'Sul', '2024-09-20'),
('Ricardo Farias', 'ricardo.f@email.com', 'Macapá', 'Norte', '2024-10-01'),
('Bianca Cunha', 'bianca.c@email.com', 'Belo Horizonte', 'Sudeste', '2024-10-08'),
('Alexandre Borges', 'alexandre.b@email.com', 'São Luís', 'Nordeste', '2024-10-15'),
('Simone Duarte', 'simone.d@email.com', 'Curitiba', 'Sul', '2024-10-22'),
('Leandro Carvalho', 'leandro.c@email.com', 'Goiânia', 'Centro-Oeste', '2024-11-01'),
('Cristiane Moraes', 'cristiane.m@email.com', 'São Paulo', 'Sudeste', '2024-11-05'),
('Henrique Azevedo', 'henrique.a@email.com', 'Fortaleza', 'Nordeste', '2024-11-12'),
('Michele Torres', 'michele.t@email.com', 'Blumenau', 'Sul', '2024-11-20'),
('Sérgio Machado', 'sergio.m@email.com', 'São Paulo', 'Sudeste', '2024-12-01'),
('Paula Ramos', 'paula.r@email.com', 'Manaus', 'Norte', '2024-12-05'),
('Roberto Xavier', 'roberto.x@email.com', 'Rio de Janeiro', 'Sudeste', '2024-12-12'),
('Adriana Nogueira', 'adriana.n@email.com', 'Salvador', 'Nordeste', '2024-12-20'),
('Luciano Brito', 'luciano.b@email.com', 'Campinas', 'Sudeste', '2025-01-05'),
('Elaine Barros', 'elaine.b@email.com', 'Londrina', 'Sul', '2025-01-12'),
('Fábio Rangel', 'fabio.r@email.com', 'Brasília', 'Centro-Oeste', '2025-01-20'),
('Carla Medeiros', 'carla.med@email.com', 'São Paulo', 'Sudeste', '2025-02-01'),
('Wagner Nascimento', 'wagner.n@email.com', 'Maceió', 'Nordeste', '2025-02-10');

-- ORDERS (200) + ORDER_ITEMS
-- Using a DO block to generate realistic orders
DO $$
DECLARE
    v_order_id INT;
    v_customer INT;
    v_seller INT;
    v_date DATE;
    v_product INT;
    v_qty INT;
    v_price NUMERIC;
    v_total NUMERIC;
    v_items INT;
    i INT;
    j INT;
BEGIN
    FOR i IN 1..200 LOOP
        v_customer := (random() * 49 + 1)::INT;
        v_seller := (random() * 7 + 1)::INT;
        v_date := '2024-03-01'::DATE + (random() * 700)::INT;
        IF v_date > '2026-03-01' THEN v_date := '2026-02-15'; END IF;

        INSERT INTO orders (customer_id, seller_id, order_date, total_amount)
        VALUES (v_customer, v_seller, v_date, 0)
        RETURNING id INTO v_order_id;

        v_total := 0;
        v_items := (random() * 3 + 1)::INT;

        FOR j IN 1..v_items LOOP
            v_product := (random() * 19 + 1)::INT;
            v_qty := (random() * 3 + 1)::INT;
            SELECT price INTO v_price FROM products WHERE id = v_product;

            INSERT INTO order_items (order_id, product_id, quantity, unit_price)
            VALUES (v_order_id, v_product, v_qty, v_price);

            v_total := v_total + (v_qty * v_price);
        END LOOP;

        UPDATE orders SET total_amount = v_total WHERE id = v_order_id;
    END LOOP;
END $$;

-- INDEXES
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_seller ON orders(seller_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_customers_region ON customers(region);
