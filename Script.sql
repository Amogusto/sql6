-- 1.

SELECT from_user_id, count(*),
(SELECT firstname from users WHERE from_user_id = id) as name,
(SELECT lastname from users WHERE from_user_id = id) as lastname
FROM messages WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) DESC; 

-- 2.

 
SELECT count(*) as quantity
-- (SELECT user_id from media where id = media_id) as user_id,
-- (SELECT firstname FROM users where id = (SELECT user_id from media where id = media_id)) as firstname,
-- (SELECT lastname FROM users where id = (SELECT user_id from media where id = media_id)) as l,
-- (SELECT birthday from profiles where user_id = (SELECT id FROM users where id = (SELECT user_id from media where id = media_id))) as birthday
from likes
WHERE TIMESTAMPDIFF(YEAR, (SELECT birthday from profiles where user_id = 
(SELECT id FROM users where id = (SELECT user_id from media where id = media_id))), NOW()) > 12


-- 3.

SELECT gender, count(*) from profiles WHERE user_id IN
(SELECT user_id from likes)
group by gender 
