CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tickets (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    status ENUM('aberto', 'em_andamento', 'resolvido', 'fechado')
        NOT NULL DEFAULT 'aberto',
    prioridade ENUM('baixa', 'media', 'alta', 'urgente')
        NOT NULL DEFAULT 'media',
    usuario_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_tickets_usuarios
        FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO usuarios (nome, email) VALUES
    ('Ana Souza', 'ana.souza@example.com'),
    ('Bruno Lima', 'bruno.lima@example.com'),
    ('Carla Mendes', 'carla.mendes@example.com');

INSERT INTO tickets (titulo, descricao, status, prioridade, usuario_id) VALUES
    (
        'Erro ao acessar o sistema',
        'O sistema informa que a senha esta incorreta mesmo apos a redefinicao.',
        'aberto',
        'alta',
        1
    ),
    (
        'Impressora nao encontrada',
        'A impressora do setor financeiro nao aparece entre os dispositivos.',
        'em_andamento',
        'media',
        2
    ),
    (
        'Solicitacao de novo acesso',
        'Liberar acesso ao modulo de relatorios para a nova colaboradora.',
        'resolvido',
        'baixa',
        3
    );
