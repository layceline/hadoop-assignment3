SELECT count(prenom), trim(orig)
FROM prenoms_opt lateral view explode(origin) origin AS orig GROUP BY trim(orig);
