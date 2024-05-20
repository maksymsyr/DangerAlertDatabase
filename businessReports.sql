-- Business Report 1: Community Engagement Overview
-- This view provides an overview of community engagement by 
-- counting the number of users in each community.
-- By having this report, the organization can understand which 
-- communities are most active and engaged, allowing them to focus 
-- their efforts on those communities to foster stronger connections and support.

CREATE OR REPLACE VIEW community_engagement_overview AS
SELECT c.community_id, c.name AS "Community Name", 
COUNT(ucb.user_id) AS "Number of Users"
FROM communities c
JOIN users_communities_bridge ucb ON c.community_id = ucb.community_id
GROUP BY c.community_id, c.name;

-- Business Report 2: Shelter Capacity Overview
-- This view provides an overview of shelter capacities in different 
-- locations by summing up the capacities of all shelters in each place.
-- By having this report, emergency management teams can quickly identify 
-- areas with adequate shelter capacities and areas that may require 
-- additional resources to accommodate residents during emergencies.

CREATE OR REPLACE VIEW shelter_capacity_overview AS
SELECT s.place_id, p.placename AS "Place Name", SUM(s.capacity) AS "Total Capacity"
FROM shelters s
JOIN places p ON s.place_id = p.place_id
GROUP BY s.place_id, p.placename
HAVING SUM(s.capacity) > 5000;

-- Business Report 3: Post Engagement Analysis
-- This view provides an analysis of post engagement by calculating 
-- the average number of comments and upvotes per post.
-- By having this report, the organization can gauge the level of 
-- engagement of their users with the posted content, allowing them to 
-- tailor their content strategy to better engage their audience.

CREATE OR REPLACE VIEW post_engagement_analysis AS
SELECT p.post_id, COUNT(c.comment_id) AS "Number of Comments", 
AVG(c.upvotes_num) AS "Average Upvotes"
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;

-- Business Report 4: All Admins Overview
-- This view provides an overview of all admins, including their names, 
-- emails, and the communities they administer.
-- By having this report, the organization can easily identify all admins 
-- and their respective responsibilities, facilitating communication and 
-- coordination among them.

CREATE OR REPLACE VIEW all_admins_overview AS
SELECT a.admin_id, u.firstname || ' ' || u.lastname AS "Admin Name", 
u.email AS "Admin Email", c.name AS "Community Name"
FROM admins a
JOIN users u ON a.user_id = u.user_id
JOIN admins_communities_bridge acb ON a.admin_id = acb.admin_id
JOIN communities c ON acb.community_id = c.community_id;

-- Business Report 5: Shelters by Place
-- This view displays all the shelters available in each place, 
-- including their names, addresses, capacities, and contact numbers.
-- By having this report, emergency management authorities and individuals 
-- can easily locate nearby shelters in different places, facilitating 
-- evacuation and emergency response efforts.

CREATE OR REPLACE VIEW shelters_by_place AS
SELECT p.placename "Place Name", s.shelter_id, s.shelter_name AS "Shelter Name", 
s.shelter_address AS "Shelter Address", s.capacity, 
s.phone FROM places p
JOIN shelters s ON p.place_id = s.place_id
ORDER BY p.placename, s.shelter_name;


select * from community_engagement_overview;
select * from shelter_capacity_overview;
select * from post_engagement_analysis;
select * from all_admins_overview;
select * from shelters_by_place;
