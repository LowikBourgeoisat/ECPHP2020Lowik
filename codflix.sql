-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  jeu. 25 juin 2020 à 20:50
-- Version du serveur :  5.7.26
-- Version de PHP :  7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `codflix`
--

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
                         `id` int(11) NOT NULL,
                         `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Horreur'),
(3, 'Science-Fiction');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
                           `id` int(11) NOT NULL,
                           `user_id` int(11) NOT NULL,
                           `media_id` int(11) NOT NULL,
                           `start_date` datetime NOT NULL,
                           `finish_date` datetime DEFAULT NULL,
                           `watch_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
                         `id` int(11) NOT NULL,
                         `genre_id` int(11) NOT NULL,
                         `title` varchar(100) NOT NULL,
                         `type` varchar(20) NOT NULL,
                         `status` varchar(20) NOT NULL,
                         `release_date` date NOT NULL,
                         `duration` int(11) NOT NULL,
                         `summary` longtext NOT NULL,
                         `trailer_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `genre_id`, `title`, `type`, `status`, `release_date`, `duration`, `summary`, `trailer_url`) VALUES
(1, 1, 'Warcraft: Le Commencement', 'film', '', '2016-05-24', 7380, 'Le pacifique royaume d\'Azeroth est au bord de la guerre alors que sa civilisation doit faire face à une redoutable race d’envahisseurs: des guerriers Orcs fuyant leur monde moribond pour en coloniser un autre. Alors qu’un portail s’ouvre pour connecter les deux mondes, une armée fait face à la destruction et l\'autre à l\'extinction. De côtés opposés, deux héros vont s’affronter et décider du sort de leur famille, de leur peuple et de leur patrie.', 'https://www.youtube.com/embed/RVzb956kdgc?autoplay=1'),
(2, 3, 'The Truman Show', 'film', '', '1998-06-01', 6180, 'Truman Burbank mène une vie calme et heureuse. Il habite dans un petit pavillon propret de la radieuse station balnéaire de Seahaven. Il part tous les matins à son bureau d\'agent d\'assurances dont il ressort huit heures plus tard pour regagner son foyer, savourer le confort de son habitat modèle, la bonne humeur inaltérable et le sourire mécanique de sa femme, Meryl. Mais parfois, Truman étouffe sous tant de bonheur et la nuit l\'angoisse le submerge. Il se sent de plus en plus étranger, comme si son entourage jouait un rôle. Pis encore, il se sent observé.', 'https://www.youtube.com/embed/CIldLFcLeX8?autoplay=1'),
(3, 1, 'Vikings', 'series', '', '2013-03-03', 24480, 'Scandinavie, à la fin du 8ème siècle. Ragnar Lodbrok, un jeune guerrier viking, est avide d\'aventures et de nouvelles conquêtes. Lassé des pillages sur les terres de l\'Est, il se met en tête d\'explorer l\'Ouest par la mer. Malgré la réprobation de son chef, Haraldson, il se fie aux signes et à la volonté des dieux, en construisant une nouvelle génération de vaisseaux, plus légers et plus rapides...', 'https://www.youtube.com/embed/mAl60ykBm4A?autoplay=1');

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
                          `id` int(11) NOT NULL,
                          `id_media` int(11) NOT NULL,
                          `id_season` int(11) NOT NULL,
                          `id_episode` int(11) NOT NULL,
                          `duration` int(11) NOT NULL,
                          `episode_title` varchar(100) NOT NULL,
                          `episode_summary` longtext NOT NULL,
                          `trailer_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `series`
--

INSERT INTO `series` (`id`, `id_media`, `id_season`, `id_episode`, `duration`, `episode_title`, `episode_summary`, `trailer_url`) VALUES
(1, 3, 1, 1, 2820, 'Cap à l\'Ouest', 'Scandinavie, 793 après Jésus-Christ. Le valeureux Ragnar Lothbrok est un fermier doublé d\'un guerrier féroce. Marié, père d\'un garçon et d\'une fille, il a un rêve : partir à l\'ouest pour y découvrir de nouvelles cités à piller. En secret, il fait construire un drakkar de conception révolutionnaire. Mais il doit d\'abord convaincre le seigneur local.\r\n', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(2, 3, 1, 2, 2820, 'L\'Expédition', 'Une fois la construction de son bateau achevée, Ragnar tente de recruter en secret un équipage et affronte sa femme, Lagertha, qui veut absolument faire partie de l\'expédition. Ragnar rassemble autour de lui une poignée d\'hommes prêts à risquer leur vie pour voguer vers l\'inconnu. De plus en plus paranoïaque, Earl Haraldson découvre le plan de Ragnar. Mais persuadé qu\'il n\'y a rien à découvrir à l\'Ouest, il décide de laisser faire.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(3, 3, 1, 3, 2700, 'La Pêche miraculeuse', 'De retour de leur campagne vers l\'ouest, lors de laquelle ils ont dévalisé et détruit un monastère, Ragnar et ses hommes sont accueillis en héros à Kattegat. Mais pour les punir d\'avoir désobéi, le Comte Haraldson confisque le butin, leur accordant simplement une récompense chacun. Ragnar choisit Athelstan, l\'un des moines qu\'il a capturés, comme esclave. Il compte sur ce dernier pour lui en apprendre davantage sur l\'Angleterre.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(4, 3, 1, 4, 2700, 'Justice est faite', 'Ragnar et ses hommes organisent une nouvelle expédition en Angleterre. Cette fois, ils partent avec l\'aval d\'Earl Haraldson, mais embarquent à bord un espion, Knut. Lagertha est elle aussi du voyage. Les Vikings envahissent la ville d\'Hexam qu\'ils mettent à feu et à sang. Durant le raid, Knut viole une femme et tente également de s\'en prendre à Logertha, qui le tue. Auprès d\'Earl Haraldson, Ragnar s\'accuse du meurtre. Il est arrêté.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(5, 3, 1, 5, 2640, 'Le Raid', 'Un devin annonce à Earl Haraldson que Ragnar veut sa mort. Harldson décide de lui donner une leçon et attaque son village. Gravement blessé, Ragnar se rend afin de permettre à sa famille de s\'enfuir. Mais il ne tarde pas à s\'échapper et se fait soigner par Floki. Après le mariage de sa fille, Haraldson fait prisonnier Rollo, le frère de Ragnar, et le soumet à la torture.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(6, 3, 1, 6, 2640, 'L\'ultime drakkar', 'Souffrant toujours de ses blessures, Ragnar Lothbrok apprend que son frère a été torturé par Earl Haraldson. Il décide de faire face à son chef de clan pour un ultime face-à-face. Il demande à Floki d\'informer Earl de ce souhait. Celui-ci en accepte le principe : il s\'agira d\'un combat aux choix des armes dont seul un homme sortira vivant.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(7, 3, 1, 7, 2640, 'La rançon', 'Trois navires vikings font route vers la demeure du puissant roi Aelle, dans l\'est de l\'Angleterre. Après avoir lancé l\'assaut durant la nuit, les guerriers païens prennent en otage le frère du roi, Aethelwulf. Ragnar réclame ensuite une rançon en échange de la paix. Aelle accepte mais pose une condition... Au même moment, à Kattegat, Lagertha gère les affaires courantes en l\'absence de son mari.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(8, 3, 1, 8, 2820, 'Le sacrifice', 'Ragnar, Logertha et Athelstan se rendent en pèlerinage à Uppsala pour remercier les dieux de leurs faveurs. Logertha, qui vient de faire une fausse couche, veut savoir si elle donnera naissance à d\'autres enfants. Tandis que les Vikings s\'apprêtent à faire un grand sacrifice à leurs dieux, Athelstan découvre combien sa foi est grande.', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(9, 3, 1, 9, 2700, 'Renaissance', 'À la demande du roi Horik, Ragnar s\'embarque avec quelques hommes pour le Götaland, la plus méridionale des trois grandes régions de Suède. Il veut régler un litige de territoire avec le chef de la région, Jarl Borg. La réputation de Ragnar le précède et Borg est intrigué : a-t-il trouvé en lui un nouvel allié, ou celui-ci est-il une marionnette du roi ?', 'https://www.youtube.com/embed/mAl60ykBm4A'),
(10, 3, 2, 1, 2820, 'Le Sang des frères', 'Les négociations menées par Ragnar Lothbrok, émissaire du roi Horik, échouent. Jarl Borg refuse de céder ses terres et profite de la convoitise de Rollo pour le monter contre son frère. Le combat fait rage entre les deux camps alors que Ragnar se remet à peine du décès de sa fille Gyda, emportée par la peste. La peine de Lagertha, son épouse, est d\'autant plus grande qu\'elle apprend la liaison de son mari avec la belle princesse Aslaug.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(11, 3, 2, 2, 2820, 'Fragile Alliance', 'Il aura fallu quatre années à Ragnar Lothbrok pour construire de nouveaux navires et remplacer ses hommes morts de la peste. La princesse Aslaug lui a donné des fils, comme le prédisait la prophétie, mais il ne peut se résoudre à oublier Bjorn, son aîné. La perspective de nouvelles conquêtes galvanise les guerriers nordiques, bien que Rollo ne soit toujours pas prêt à rejoindre ses frères d\'armes.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(12, 3, 2, 3, 2700, 'Trahison', 'Winchester est envahie par des hordes de Vikings avides de richesse. Le roi Ecbert, inquiet mais prudent, semble être un adversaire de choix pour Ragnar Lothbrok, qui comprend très vite l\'importance d\'un accord avec lui. Cependant, occupé par ses conquêtes, Ragnar ne réalise pas qu\'il s\'est fait un ennemi de taille : la rancune de Jarl Borg, laissé pour compte malgré son accord avec le roi Horik, ne connaît aucune limite.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(13, 3, 2, 4, 2700, 'Œil pour œil', 'Jarl Borg prend possession de Kattegat pendant que Ragnar négocie avec le roi Ecbert. Lorsque Ragnar apprend que ses terres ont été envahies, il se précipite au secours de sa famille, réfugiée dans les montagnes. Mais la nouvelle de son arrivée ne passe pas inaperçue. Jarl Borg semble déterminé à le faire tomber, alors même que Ragnar voit ses forces se disperser. Mais entre l\'exploration de l\'Ouest et la reconquête de son territoire, aucune hésitation n\'est possible.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(14, 3, 2, 5, 2640, 'Les Liens du sang', 'Lagertha décide de venir en aide à Ragnar et emmène son fils Bjorn avec elle pour combattre Jarl Borg. Les retrouvailles sont l\'occasion pour Ragnar de jauger la bravoure de son fils, qui se montre largement à la hauteur. Mais bientôt, Ragnar devra à nouveau choisir entre Lagertha et Aslaug. Entre la guerrière et la princesse, son coeur balance.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(15, 3, 2, 6, 2640, 'L\'Impossible Pardon\r\n', 'L\'amertume de Siggy la pousse à nouer de dangereuses alliances. Le roi Horik, qui ne sert que ses propres intérêts, profite de cette rancoeur pour garder la main sur Ragnar Lothbrok. Il encourage même Ragnar à pardonner l\'invasion de ses terres par Jarl Borg afin de restaurer l\'accord d\'origine. Mais Ragnar semble avoir d\'autres préoccupations dont la conquête de l\'Ouest ne fait pas partie, bien qu\'il regrette la perte de son ami Athelstan. Désormais détenu par le roi Ecbert, l\'ancien moine, rongé par le doute et la culpabilité, peine à trouver sa place. Il semble pourtant qu\'Ecbert ait des projets pour lui...', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(16, 3, 2, 7, 2640, 'L\'Aigle de sang', 'L\'exécution de Jarl Borg est imminente. Sans surprise, le roi Horik encourage Ragnar à attendre que de nouveaux alliés se manifestent avant de tuer Jarl Borg. Mais dans son impatience à venger la trahison du roi Ecbert, il complote à nouveau avec un Jarl Borg en piteux état. Bientôt, l\'appel de Ragnar est entendu et un mystérieux personnage, Earl Ingstad, accepte de se joindre à lui pour conquérir l\'Ouest.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(17, 3, 2, 8, 2820, 'Le Désossé', 'Lagertha, Ragnar et le roi Horik se préparent pour un nouveau raid. Cette alliance a pour effet de déséquilibrer le rapport de force, et Horik tente par tous les moyens de faire pencher la balance en sa faveur. Mais à l\'ouest, le roi Egbert profite de la confusion qui règne dans le camp de Ragnar pour s\'unir à la sulfureuse princesse Kwenthrith de Mercie. Avec la force du nombre, Egbert compte bien faire plier Ragnar et mener des négociations à son avantage.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(18, 3, 2, 9, 2700, 'Le Choix', 'Entre Ragnar et Horik, la tension est palpable. Alors que Ragnar veut négocier avec le roi Egbert, Horik, lui, préfère s\'engager dans un combat d\'où personne ne sortira vainqueur. Floki, dont la loyauté envers Ragnar semble de plus en plus douteuse, se range finalement du côté d\'Horik et fonce tête baissée dans la bataille. Cette petite guerre des chefs profite au roi Egbert et inquiète Athelstan, toujours tiraillé entre son ancienne foi et son amitié pour Ragnar.', 'https://www.youtube.com/embed/WCeQAmZTX70'),
(19, 3, 2, 10, 2700, 'Notre Père', 'Pour fêter les accords conclus avec le roi Egbert, Ragnar reçoit la famille du roi Horik à Kattegat. Ce dernier profite des célébrations pour mettre à l\'épreuve Floki, dont la duplicité ne fait plus aucun doute. L\'étau se resserre autour de Ragnar, qui voit ses amis les plus proches pactiser avec l\'ennemi. Personne ne risque de sortir gagnant de cette lutte de pouvoir sans merci.', 'https://www.youtube.com/embed/WCeQAmZTX70');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
                        `id` int(11) NOT NULL,
                        `email` varchar(254) NOT NULL,
                        `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(2, 'oui@gmail.com', '$2y$10$KC0Lyl6teoVRRwk90a/WH.IDm1cTjkK64OyWBuhsutzWaSpkVI50a'),
(3, 'coding@gmail.com', '$2y$10$oZGm11sP4Ar8rkn.rwwI8uEoiZVSbhgfTI1W4wqwXBVPE5QqP/NY.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
    ADD PRIMARY KEY (`id`),
    ADD KEY `history_user_id_fk_media_id` (`user_id`),
    ADD KEY `history_media_id_fk_media_id` (`media_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
    ADD PRIMARY KEY (`id`),
    ADD KEY `media_genre_id_fk_genre_id` (`genre_id`) USING BTREE;

--
-- Index pour la table `series`
--
ALTER TABLE `series`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `series`
--
ALTER TABLE `series`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
    ADD CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
    ADD CONSTRAINT `media_genre_id_b1257088_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
